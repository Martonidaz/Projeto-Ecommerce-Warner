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
            string sql = @"SELECT u.id_usuario, u.username, c.nome, c.cpf, c.sexo, c.email, c.telefone, c.data_nascimento, c.data_cadastro, u.tipousuario FROM Usuario u INNER JOIN cliente c on u.id_cliente = c.id_cliente";
            
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            gridUsuarios.DataSource = dr;
            gridUsuarios.DataBind();
        }
    }
}