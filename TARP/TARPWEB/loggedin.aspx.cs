using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TARPWEB
{
    public partial class loggedin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"] == null)
            {
                var page = HttpContext.Current.CurrentHandler as Page;
                ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('Session is Over/Logged Out');window.location ='index.aspx';", true);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}