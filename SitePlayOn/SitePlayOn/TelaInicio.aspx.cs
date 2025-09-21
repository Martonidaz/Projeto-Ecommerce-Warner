using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TelaInicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_click(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tipousuario"] == null || Session["tipousuario"].ToString() != "Usuario")
            {
                Response.Redirect("~/Login.aspx");
            }
            else if (Session["tipousuario"] == null || Session["tipousuario"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
            }

        }
    }
}