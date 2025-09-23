using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tipousuario"] == null)
        {
            Response.Redirect("TelaInicio.aspx");
        }
        lblWelcome.Text = "Bem Vindo " + Session["username"].ToString();
    }
    protected void btnLogout_click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/TelaInicio.aspx");
    }
}