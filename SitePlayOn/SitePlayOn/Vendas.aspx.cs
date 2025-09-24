using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

public partial class Vendas : System.Web.UI.Page
{
    // Classe para o Carrinho (agora dentro do próprio codebehind)
    public class ItemCarrinho
    {
        public int IdJogo { get; set; }
        public string Nome { get; set; }
        public decimal PrecoUnitario { get; set; }
        public int Quantidade { get; set; }
        public decimal Subtotal => PrecoUnitario * Quantidade;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
         CarregarJogos();
         CarregarTiposPagamento();
         CarregarCarrinho();
        
    }

    private void CarregarJogos()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT id_jogo, nome, preco FROM Jogo", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gridJogos.DataSource = dt;
            gridJogos.DataBind();
        }
    }

    private void CarregarTiposPagamento()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT id_tipopag, descricao FROM TipoPagamento", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlTipoPagamento.DataSource = dt;
            ddlTipoPagamento.DataTextField = "descricao";
            ddlTipoPagamento.DataValueField = "id_tipopag";
            ddlTipoPagamento.DataBind();
        }
    }

    private void CarregarCarrinho()
    {
        List<ItemCarrinho> carrinho = Session["Carrinho"] as List<ItemCarrinho> ?? new List<ItemCarrinho>();
        gridCarrinho.DataSource = carrinho;
        gridCarrinho.DataBind();

        lblTotal.Text = carrinho.Sum(i => i.Subtotal).ToString("C");
    }

    protected void gridJogos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Adicionar")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int idJogo = Convert.ToInt32(gridJogos.Rows[index].Cells[0].Text);
            string nome = gridJogos.Rows[index].Cells[1].Text;
            decimal preco = Convert.ToDecimal(gridJogos.Rows[index].Cells[2].Text);

            List<ItemCarrinho> carrinho = Session["Carrinho"] as List<ItemCarrinho> ?? new List<ItemCarrinho>();
            var itemExistente = carrinho.FirstOrDefault(i => i.IdJogo == idJogo);

            if (itemExistente != null)
                itemExistente.Quantidade++;
            else
                carrinho.Add(new ItemCarrinho { IdJogo = idJogo, Nome = nome, PrecoUnitario = preco, Quantidade = 1 });

            Session["Carrinho"] = carrinho;
            CarregarCarrinho();
        }
    }

    protected void btnFinalizar_Click(object sender, EventArgs e)
    {
        List<ItemCarrinho> carrinho = Session["Carrinho"] as List<ItemCarrinho>;
        if (carrinho == null || carrinho.Count == 0)
        {
            lblMsg.Text = "Carrinho vazio!";
            return;
        }

        decimal total = carrinho.Sum(i => i.Subtotal);
        int idCliente = Convert.ToInt32(Session["id_cliente"]); // cliente logado
        int idTipoPag = Convert.ToInt32(ddlTipoPagamento.SelectedValue);

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString))
        {
            con.Open();

            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                // Inserir Venda
                string sqlVenda = @"INSERT INTO Venda (valor_total, data_venda, id_cliente, id_tipopag)
                                    VALUES (@total, GETDATE(), @id_cliente, @id_tipopag);
                                    SELECT SCOPE_IDENTITY();";
                SqlCommand cmdVenda = new SqlCommand(sqlVenda, con, transaction);
                cmdVenda.Parameters.AddWithValue("@total", total);
                cmdVenda.Parameters.AddWithValue("@id_cliente", idCliente);
                cmdVenda.Parameters.AddWithValue("@id_tipopag", idTipoPag);

                int idVenda = Convert.ToInt32(cmdVenda.ExecuteScalar());

                // Inserir ItensVenda
                foreach (var item in carrinho)
                {
                    string sqlItem = @"INSERT INTO ItemVenda (id_venda, id_jogo, quantidade)
                                       VALUES (@id_venda, @id_jogo, @quantidade)";
                    SqlCommand cmdItem = new SqlCommand(sqlItem, con, transaction);
                    cmdItem.Parameters.AddWithValue("@id_venda", idVenda);
                    cmdItem.Parameters.AddWithValue("@id_jogo", item.IdJogo);
                    cmdItem.Parameters.AddWithValue("@quantidade", item.Quantidade);
                    cmdItem.ExecuteNonQuery();
                }

                transaction.Commit();

                Session["Carrinho"] = null;
                CarregarCarrinho();
                lblMsg.Text = "Venda finalizada com sucesso!";
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                lblMsg.Text = "Erro ao finalizar venda: " + ex.Message;
            }
        }
    }
}
