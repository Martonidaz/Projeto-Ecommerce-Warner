using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.ServiceModel.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cadastro_cliente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnConfirma_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtUser.Text))
        {
            lblCadastro.Text = "Defina um nome de usuário";
        }
        else if (string.IsNullOrEmpty(txtSenha.Text))
        {
            lblCadastro.Text = "Defina uma senha";
        }
        else if (String.IsNullOrEmpty(txtUser.Text))
        {
            lblCadastro.Text = "Nome é obrigatório";
        }
        else if (string.IsNullOrEmpty(txtCPF.Text))
        {
            lblCadastro.Text = "CPF é Obrigatório";
        }
        else if (string.IsNullOrEmpty(listgen.Text))
        {
            lblCadastro.Text = "Não informou o genero";
        }
        else if (string.IsNullOrEmpty(txtData.Text))
        {
            lblCadastro.Text = "Data de nascimento é obrigatória";
        }
        else if (string.IsNullOrEmpty(txtTel.Text))
        {
            lblCadastro.Text = "Numero de telefone não informado";
        }
        else if (string.IsNullOrEmpty(txtEmail.Text))
        {
            lblCadastro.Text = "Email é obrigatório";
        }
        else
        {
            string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conexao))
            {
                con.Open();
                string sqlCliente = @"INSERT INTO Cliente (nome, cpf, sexo, data_nascimento, telefone, email, data_cadastro) OUTPUT INSERTED.id_cliente VALUES (@nome, @cpf, @sexo, @data_nascimento, @telefone, @email, @data_cadastro)"; 
                
                SqlCommand cmdCliente = new SqlCommand(sqlCliente, con);

                cmdCliente.Parameters.AddWithValue("@nome",txtNome.Text);
                cmdCliente.Parameters.AddWithValue("@cpf", txtCPF.Text);
                cmdCliente.Parameters.AddWithValue("@sexo", listgen.Text);
                cmdCliente.Parameters.AddWithValue("@data_nascimento", txtData.Text);
                cmdCliente.Parameters.AddWithValue("@telefone", txtTel.Text);
                cmdCliente.Parameters.AddWithValue("@email", txtEmail.Text);
                cmdCliente.Parameters.AddWithValue("@data_cadastro", DateTime.Now);

                int idCliente = (int)cmdCliente.ExecuteScalar();

                string sqlUsuario = @"INSER INTO Usuario (username, senha,id_cliente, tipousuario) VALUES (@username, @senha, @id_cliente, @tipousuario)";

                SqlCommand cmdUsuario = new SqlCommand(sqlUsuario, con);

                cmdCliente.Parameters.AddWithValue("@username", txtUser.Text);
                cmdCliente.Parameters.AddWithValue("@senha", txtSenha.Text);
                cmdCliente.Parameters.AddWithValue("@id_cliente", idCliente);
                cmdCliente.Parameters.AddWithValue("tipousuario", "usuario");

                string sqlVerifica = "SELECT COUNT(*) FROM CLIENTE WHERE email=@email";
                SqlCommand cmdVerifica = new SqlCommand(sqlVerifica, con);

                int count = (int)cmdVerifica.ExecuteScalar();

                if(count > 0)
                {
                    lblCadastro.Text = "Email já existe";
                    return;
                }

                cmdCliente.ExecuteNonQuery();

                Response.Redirect("Login.aspx");
            }
        }
    }
    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        if (Session["tipousuario"] == null || Session["tipousuario"].ToString() != "usuario")
        {
            Response.Redirect("TelaInicio.aspx");
        }
        else if (Session["tipousuario"] != null || Session["tipousuario"].ToString() == "usuario")
        {
            Response.Redirect("Home_cliente.aspx");
        }
    }
}