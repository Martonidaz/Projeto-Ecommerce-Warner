using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class relatorio_vendas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tipousuario"] != null || Session["tipousuario"].ToString() == "admin")
            {
                if (!IsPostBack)
                    CarregarVendas();
            }
            else
            {
                // redirecione ou trate o acesso não autorizado conforme sua aplicação
                Response.Redirect("Login.aspx");
            }

            // Define datas padrão (últimos 30 dias)
            txtDataInicio.Text = DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
            txtDataFim.Text = DateTime.Now.ToString("yyyy-MM-dd");

            
        }
    }

    protected void btnFiltrar_Click(object sender, EventArgs e)
    {
        CarregarVendas();
    }

    private void CarregarVendas()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // 1. Query principal para buscar vendas
            string sqlVendas = @"
                SELECT 
                    v.id_venda,
                    v.data_venda,
                    v.valor_total,
                    c.nome as nome_cliente
                FROM Venda v
                LEFT JOIN Cliente c ON v.id_cliente = c.id_cliente
                WHERE 1=1";

            // Adiciona filtros de data se informados
            if (!string.IsNullOrEmpty(txtDataInicio.Text))
            {
                sqlVendas += " AND v.data_venda >= @data_inicio";
            }
            if (!string.IsNullOrEmpty(txtDataFim.Text))
            {
                sqlVendas += " AND v.data_venda <= @data_fim";
            }

            sqlVendas += " ORDER BY v.data_venda DESC";

            SqlCommand cmdVendas = new SqlCommand(sqlVendas, con);

            // Parâmetros dos filtros
            if (!string.IsNullOrEmpty(txtDataInicio.Text))
            {
                cmdVendas.Parameters.AddWithValue("@data_inicio", Convert.ToDateTime(txtDataInicio.Text));
            }
            if (!string.IsNullOrEmpty(txtDataFim.Text))
            {
                cmdVendas.Parameters.AddWithValue("@data_fim", Convert.ToDateTime(txtDataFim.Text).AddDays(1));
            }

            DataTable dtVendas = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmdVendas);
            da.Fill(dtVendas);

            // 3. Calcular totais
            CalcularTotais(con);

            // 4. Bind no GridView
            if (dtVendas.Rows.Count > 0)
            {
                gvVendas.DataSource = dtVendas;
                gvVendas.DataBind();
                gvVendas.Visible = true;
                pnlSemRegistros.Visible = false;
            }
            else
            {
                gvVendas.Visible = false;
                pnlSemRegistros.Visible = true;
            }
        }
    }

    private void CalcularTotais(SqlConnection con)
    {
        // Query para totais
        string sqlTotais = @"
            SELECT 
                COUNT(*) as total_vendas,
                ISNULL(SUM(valor_total), 0) as valor_total,
                CASE 
                    WHEN COUNT(*) > 0 THEN ISNULL(SUM(valor_total), 0) / COUNT(*) 
                    ELSE 0 
                END as ticket_medio
            FROM Venda 
            WHERE 1=1";

        // Adiciona filtros
        if (!string.IsNullOrEmpty(txtDataInicio.Text))
        {
            sqlTotais += " AND data_venda >= @data_inicio";
        }
        if (!string.IsNullOrEmpty(txtDataFim.Text))
        {
            sqlTotais += " AND data_venda <= @data_fim";
        }

        SqlCommand cmdTotais = new SqlCommand(sqlTotais, con);

        if (!string.IsNullOrEmpty(txtDataInicio.Text))
        {
            cmdTotais.Parameters.AddWithValue("@data_inicio", Convert.ToDateTime(txtDataInicio.Text));
        }
        if (!string.IsNullOrEmpty(txtDataFim.Text))
        {
            cmdTotais.Parameters.AddWithValue("@data_fim", Convert.ToDateTime(txtDataFim.Text).AddDays(1));
        }

        SqlDataReader reader = cmdTotais.ExecuteReader();
        if (reader.Read())
        {
            lblTotalVendas.Text = reader["total_vendas"].ToString();
            lblValorTotal.Text = "R$ " + Convert.ToDecimal(reader["valor_total"]).ToString("N2");
            lblTicketMedio.Text = "R$ " + Convert.ToDecimal(reader["ticket_medio"]).ToString("N2");
        }
        reader.Close();
    }

    protected void gvVendas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Encontrar o Repeater de itens
            Repeater rptItens = (Repeater)e.Row.FindControl("rptItens");

            if (rptItens != null)
            {
                // Obter os itens da venda
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                DataTable dtItens = (DataTable)rowView["Itens"];

                rptItens.DataSource = dtItens;
                rptItens.DataBind();
            }
        }
    }

    protected void SairVendas_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home_admin.aspx");
    }
}