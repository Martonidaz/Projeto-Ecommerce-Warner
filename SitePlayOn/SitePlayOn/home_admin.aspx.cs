using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tipousuario"] == null || Session["tipousuario"].ToString() == "cliente")
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnCadastroUsuario_Click(object sender, EventArgs e)
    {

    }

    protected void btnVisualizarUsuarios_Click(object sender, EventArgs e)
    {
        Response.Redirect("visualizar_usuario.aspx");
    }

    protected void btnSairAdmin_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/TelaInicio.aspx");
    }

    protected void btnCadastrarJogo_Click(object sender, EventArgs e)
    {
        Response.Redirect("/cadastro_jogos.aspx");
    }

    protected void btnTelaCliente_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Home_cliente.apsx");
    }
}