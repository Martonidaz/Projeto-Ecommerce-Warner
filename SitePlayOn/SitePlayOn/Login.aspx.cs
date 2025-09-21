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
        string conexao = System.Configuration.ConfigurationManager.ConnectionStrings["LojaDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(conexao))

        if (String.IsNullOrEmpty(txtLogin.Text))
        {
            lblValida.Text = "Login é obrigatório";
            return;
        }

        if (String.IsNullOrEmpty(txtSenha.Text))
        {
            lblValida.Text = "Senha é obrigatória";
            return;
        }

        if(String.IsNullOrEmpty(txtLogin.Text) || String.IsNullOrEmpty(txtSenha.Text))
        {
            lblValida.Text = "Login e senha são obrigatórios";
            return;
        }

        string sql = "SELECT COUNT(*) FROM Usuario WHEREA Login=@login AND Senha=@senha";

    }
}