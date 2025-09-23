using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visualizar_usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        visualizarUsuarios();
    }

    private void visualizarUsuarios()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sqlVerifica = @"SELECT id_cliente, nome, cpf, sexo, data_nascimento, telefone, email, data_cadastro FROM Cliente";
            
            SqlCommand cmdVerifica = new SqlCommand(sqlVerifica, con);
            con.Open();

            SqlDataReader dr = cmdVerifica.ExecuteReader();
            gridUsuarios.DataSource = dr;
            gridUsuarios.DataBind();
        }
    }
}