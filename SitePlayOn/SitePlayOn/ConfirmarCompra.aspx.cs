using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmarCompra : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int idJogo))
                {
                    CarregarProduto(idJogo);
                }
                else
                {
                    MostrarErro("Produto não especificado.");
                }
            }
        }
    }

    private void CarregarProduto(int idJogo)
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sql = "SELECT id_jogo, nome, preco FROM Jogos WHERE id_jogo = @id_jogo";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id_jogo", idJogo);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblNome.Text = reader["nome"].ToString();

                decimal preco = Convert.ToDecimal(reader["preco"]);
                lblPreco.Text = "R$ " + preco.ToString("N2");

                // Carregar imagem
                string imagemUrl = "Imagens/Produtos/" + idJogo + ".jpg";
                imgProduto.ImageUrl = imagemUrl;
                imgProduto.AlternateText = reader["nome"].ToString();

                pnlDetalhes.Visible = true;
            }
            else
            {
                MostrarErro("Produto não encontrado.");
            }

            reader.Close();
        }
    }

    protected void btnConfirmarCompra_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int idJogo))
        {
            RegistrarVenda(idJogo);
        }
    }

    private void RegistrarVenda(int idJogo)
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        // Usar transação para garantir que ambas as tabelas sejam atualizadas
        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();
            SqlTransaction transaction = con.BeginTransaction();

            try
            {
                // 1. Buscar informações do produto
                decimal precoProduto = 0;
                string nomeProduto = "";

                string sqlProduto = "SELECT nome, preco FROM Jogos WHERE id_jogo = @id_jogo";
                SqlCommand cmdProduto = new SqlCommand(sqlProduto, con, transaction);
                cmdProduto.Parameters.AddWithValue("@id_jogo", idJogo);

                SqlDataReader reader = cmdProduto.ExecuteReader();
                if (reader.Read())
                {
                    nomeProduto = reader["nome"].ToString();
                    precoProduto = Convert.ToDecimal(reader["preco"]);
                }
                reader.Close();

                // 3. Inserir na tabela Venda
                string sqlVenda = @"INSERT INTO Venda (valor_total, data_venda) 
                                   OUTPUT INSERTED.id_venda 
                                   VALUES (@valor_total, @data_venda)";

                SqlCommand cmdVenda = new SqlCommand(sqlVenda, con, transaction);
                cmdVenda.Parameters.AddWithValue("@valor_total", precoProduto);
                cmdVenda.Parameters.AddWithValue("@data_venda", DateTime.Now);      

                // Obter o ID da venda recém-criada
                int idVenda = Convert.ToInt32(cmdVenda.ExecuteScalar());
                int quantidade =+ 1;

                // 4. Inserir na tabela ItemVenda
                string sqlItemVenda = @"INSERT INTO ItemVenda (id_venda, id_jogo, quantidade) 
                                       VALUES (@id_venda, @id_jogo, @quantidade)";

                SqlCommand cmdItemVenda = new SqlCommand(sqlItemVenda, con, transaction);
                cmdItemVenda.Parameters.AddWithValue("@id_venda", idVenda);
                cmdItemVenda.Parameters.AddWithValue("@id_jogo", idJogo);
                cmdItemVenda.Parameters.AddWithValue("@quantidade", quantidade);

                cmdItemVenda.ExecuteNonQuery();

                // 5. Commit da transação
                transaction.Commit();

                // 6. Mostrar mensagem de sucesso
                MostrarSucesso(nomeProduto, precoProduto, idVenda);

            }
            catch (Exception ex)
            {
                // Rollback em caso de erro
                transaction.Rollback();
                MostrarErro("Erro ao registrar venda: " + ex.Message);
            }
        }
    }

    private void MostrarSucesso(string nomeProduto, decimal preco, int idVenda)
    {
        pnlDetalhes.Visible = false;
        pnlSucesso.Visible = true;

        lblProdutoSucesso.Text = nomeProduto;
        lblValorSucesso.Text = "R$ " + preco.ToString("N2");
        lblDataSucesso.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm");

        // Mostrar número da venda
        lblNumeroVenda.Text = "Nº " + idVenda.ToString();
    }

    private void MostrarErro(string mensagem)
    {
        pnlDetalhes.Visible = false;
        pnlSucesso.Visible = false;
        pnlErro.Visible = true;
        lblErro.Text = mensagem;
    }
}
   

