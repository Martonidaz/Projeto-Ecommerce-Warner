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
        if (Session["tipousuario"] != null || Session["tipousuario"].ToString() == "admin")
        {
            visualizarUsuarios();
        }
        
    }

    private void visualizarUsuarios()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sqlVerifica = @"SELECT u.id_usuario, u.username, c.nome, c.cpf, c.sexo, c.telefone, c.email, u.tipousuario FROM Usuario u INNER JOIN Cliente c On u.id_cliente = c.id_cliente";
            
            SqlCommand cmdVerifica = new SqlCommand(sqlVerifica, con);
            con.Open();

            SqlDataReader dr = cmdVerifica.ExecuteReader();
            gridUsuarios.DataSource = dr;
            gridUsuarios.DataBind();
        }
    }

    protected void gridUsuarios_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        gridUsuarios.EditIndex = e.NewEditIndex;
        visualizarUsuarios();
    }

    protected void gridUsuarios_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gridUsuarios.EditIndex = -1;
        visualizarUsuarios();
    }

    protected void gridUsuarios_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int id_usuario = Convert.ToInt32(gridUsuarios.DataKeys[e.RowIndex].Value);
        var row = gridUsuarios.Rows[e.RowIndex];

        string username = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
        string nome = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;
        string cpf = ((System.Web.UI.WebControls.TextBox)row.Cells[3].Controls[0]).Text;
        string sexo = ((System.Web.UI.WebControls.TextBox)row.Cells[4].Controls[0]).Text;
        string telefone = ((System.Web.UI.WebControls.TextBox)row.Cells[5].Controls[0]).Text;
        string email = ((System.Web.UI.WebControls.TextBox)row.Cells[6].Controls[0]).Text;
        string tipousuario = ((System.Web.UI.WebControls.TextBox)row.Cells[7].Controls[0]).Text;

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // Atualiza Usuario
            string sqlUsuario = "UPDATE Usuario SET username=@username, tipousuario=@tipousuario WHERE id_usuario=@id_usuario";
            SqlCommand cmdUsuario = new SqlCommand(sqlUsuario, con);
            cmdUsuario.Parameters.AddWithValue("@Username", username);
            cmdUsuario.Parameters.AddWithValue("@tipousuario", tipousuario);
            cmdUsuario.Parameters.AddWithValue("@id_usuario", id_usuario);
            cmdUsuario.ExecuteNonQuery();

            // Atualiza Cliente
            string sqlCliente = @"UPDATE Cliente SET nome=@nome, email=@email, cpf=@cpf, sexo=@sexo, telefone=@telefone
                                      WHERE id_cliente = (SELECT id_cliente FROM Usuario WHERE id_usuario=@id_usuario)";
            SqlCommand cmdCliente = new SqlCommand(sqlCliente, con);
            cmdCliente.Parameters.AddWithValue("@nome", nome);
            cmdCliente.Parameters.AddWithValue("@email", email);
            cmdCliente.Parameters.AddWithValue("@cpf", cpf);
            cmdCliente.Parameters.AddWithValue("@sexo", sexo);
            cmdCliente.Parameters.AddWithValue("@telefone", telefone);
            cmdCliente.Parameters.AddWithValue("@id_usuario", id_usuario);
            cmdCliente.ExecuteNonQuery();
        }

        gridUsuarios.EditIndex = -1;
        visualizarUsuarios();
    }

    protected void gridUsuarios_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id_usuario = Convert.ToInt32(gridUsuarios.DataKeys[e.RowIndex].Value);

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // Primeiro deleta Cliente
            string sqlCliente = @"DELETE FROM Cliente WHERE id_cliente = (SELECT id_cliente FROM Usuario WHERE id_usuario=@id_usuario)";
            SqlCommand cmdCliente = new SqlCommand(sqlCliente, con);
            cmdCliente.Parameters.AddWithValue("id_usuario", id_usuario);
            cmdCliente.ExecuteNonQuery();

            // Depois deleta Usuario
            string sqlUsuario = "DELETE FROM Usuario WHERE id_usuario=@id_usuario";
            SqlCommand cmdUsuario = new SqlCommand(sqlUsuario, con);
            cmdUsuario.Parameters.AddWithValue("@id_usuario", id_usuario);
            cmdUsuario.ExecuteNonQuery();
        }

        visualizarUsuarios();
    }
}