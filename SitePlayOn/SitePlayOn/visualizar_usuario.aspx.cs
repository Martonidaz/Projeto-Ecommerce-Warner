using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class visualizar_usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica se usuário é admin antes de carregar (evita NullReference)
        if (Session["tipousuario"] != null && Session["tipousuario"].ToString() == "admin")
        {
            if (!IsPostBack)
                visualizarUsuarios();
        }
        else
        {
            // redirecione ou trate o acesso não autorizado conforme sua aplicação
            Response.Redirect("Login.aspx");
        }
    }

    private void visualizarUsuarios()
    {
        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sqlVerifica = @"SELECT u.id_usuario, u.username, c.nome, c.cpf, c.sexo, c.telefone, c.email, u.tipousuario 
                                    FROM Usuario u 
                                    INNER JOIN Cliente c On u.id_cliente = c.id_cliente";

            SqlCommand cmdVerifica = new SqlCommand(sqlVerifica, con);
            con.Open();

            SqlDataReader dr = cmdVerifica.ExecuteReader();
            gridUsuarios.DataSource = dr;
            gridUsuarios.DataBind();
        }
    }

    protected void gridUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridUsuarios.EditIndex = e.NewEditIndex;
        visualizarUsuarios();
    }

    protected void gridUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridUsuarios.EditIndex = -1;
        visualizarUsuarios();
    }

    protected void gridUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id_usuario = Convert.ToInt32(gridUsuarios.DataKeys[e.RowIndex].Value);
        var row = gridUsuarios.Rows[e.RowIndex];

        // Observação: dependendo de como o template/BoundField renderiza, a posição Controls[0] pode variar.
        // Se tiver template fields, adapte para encontrar o TextBox corretamente.
        string username = ((TextBox)row.Cells[1].Controls[0]).Text;
        string nome = ((TextBox)row.Cells[2].Controls[0]).Text;
        string cpf = ((TextBox)row.Cells[3].Controls[0]).Text;
        string sexo = ((TextBox)row.Cells[4].Controls[0]).Text;
        string telefone = ((TextBox)row.Cells[5].Controls[0]).Text;
        string email = ((TextBox)row.Cells[6].Controls[0]).Text;
        string tipousuario = ((TextBox)row.Cells[7].Controls[0]).Text;

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // Atualiza Usuario
            string sqlUsuario = "UPDATE Usuario SET username=@username, tipousuario=@tipousuario WHERE id_usuario=@id_usuario";
            SqlCommand cmdUsuario = new SqlCommand(sqlUsuario, con);
            cmdUsuario.Parameters.AddWithValue("@username", username);
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

    protected void gridUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id_usuario = Convert.ToInt32(gridUsuarios.DataKeys[e.RowIndex].Value);

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conexao))
        {
            con.Open();

            // Primeiro deleta Cliente
            string sqlCliente = @"DELETE FROM Cliente WHERE id_cliente = (SELECT id_cliente FROM Usuario WHERE id_usuario=@id_usuario)";
            SqlCommand cmdCliente = new SqlCommand(sqlCliente, con);
            cmdCliente.Parameters.AddWithValue("@id_usuario", id_usuario);
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
