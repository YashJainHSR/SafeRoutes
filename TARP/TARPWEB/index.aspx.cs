using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TARPWEB
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TarpConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 0;
                conn.Open();
                string qr1 = "select count(*) from login where LoginId ='" + loginid.Text + "' and Password ='" + password.Text + "'";
                SqlCommand cmd1 = new SqlCommand(qr1, conn);
                count = (int)cmd1.ExecuteScalar();
                if (count == 1)
                {
                    string id = "", login = "";
                    string qr = "select Id,LoginId from login where LoginId ='" + loginid.Text + "' and Password ='" + password.Text + "'";
                    SqlCommand cmd = new SqlCommand(qr, conn);
                    SqlDataReader log;
                    log = cmd.ExecuteReader();
                    Session["Login"] = loginid.Text;
                    while (log.Read())
                    {
                        id = log.GetValue(0).ToString();
                        login = log.GetValue(1).ToString();
                    }
                    Session["ID"] = id;
                    Session["LoginID"] = login;
                    Response.Redirect("loggedin.aspx");
                }
                else
                {
                    Label1.Visible = true;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: '{0}'", ex);
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}