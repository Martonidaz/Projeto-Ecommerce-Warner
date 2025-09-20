using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


string connStr = ConfigurationManager.ConnectionStrings["MinhaConexao"].ConnectionString;

using (SqlConnection con = new SqlConnection(connStr))

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}