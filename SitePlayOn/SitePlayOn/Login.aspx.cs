using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEntrar_Click(object sender, EventArgs e)
    {

        if (String.IsNullOrEmpty(txtLogin.Text))
        {
            lblValida.Text = "Login é obrigatório";
        }

        if (String.IsNullOrEmpty(txtSenha.Text))
        {
            lblValida.Text = "Senha é obrigatória";
        }

        if (String.IsNullOrEmpty(txtLogin.Text) || String.IsNullOrEmpty(txtSenha.Text))
        {
            lblValida.Text = "Login e senha são obrigatórios";
        }

        string username = txtLogin.Text;
        string senha = txtSenha.Text;

        string conexao = ConfigurationManager.ConnectionStrings["BancoLoja"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))
        {
            string sql = "SELECT tipousuario FROM Usuario WHERE Username=@Username AND Senha=@Senha";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Senha", senha);

            con.Open();
            object tipousuario = cmd.ExecuteScalar();

            if (tipousuario != null)
            {
                Session["tipousuario"] = tipousuario.ToString();
                Session["username"] = username;

                //if(tipousuario.ToString() == "admin")
                //Alteração para ignorar espaços em branco
                if (tipousuario.ToString().Trim().Equals("admin", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("Home_admin.aspx");
                    
                } else
                {
                    Response.Redirect("Home_cliente.aspx");
                    lblValida.Text = Session["username"].ToString();
                }
            } else
            {
                lblValida.Text = "Usuário invalido";
            }
        }
    }
}