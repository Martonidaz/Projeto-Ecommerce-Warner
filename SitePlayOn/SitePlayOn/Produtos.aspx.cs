using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Produtos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CarregarProdutos();

    }

    private void CarregarProdutos()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sql = "SELECT id_jogo, nome, descricao, preco FROM Jogos";
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            rptProdutos.DataSource = reader;
            rptProdutos.DataBind();

            reader.Close();
        }
    }
}