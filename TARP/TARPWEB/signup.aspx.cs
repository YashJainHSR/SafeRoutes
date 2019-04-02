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
    public partial class signup : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TarpConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Sign Up";
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int count = 1;
                conn.Open();
                string qr1 = "select count(*) from login where LoginId ='" + logemail.Text + "'";
                SqlCommand cmd1 = new SqlCommand(qr1, conn);
                count = (int)cmd1.ExecuteScalar();
                if (count == 0)
                {
                    string qr = "insert into login(LoginId,Password,Name) values('" + logemail.Text + "','" + pass.Text + "','" + fname.Text + " " + lname.Text + "')";
                    SqlCommand cmd = new SqlCommand(qr, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    var page = HttpContext.Current.CurrentHandler as Page;
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('" + fname.Text + " " + lname.Text + ", Welcome to SafeRoutes.\\n \\tSigned Up Successfully!\\t');window.location ='index.aspx';", true);
                }
                else
                {
                    var page = HttpContext.Current.CurrentHandler as Page;
                    ScriptManager.RegisterStartupScript(page, page.GetType(), "alert", "alert('Account Already Exist, Try Logging in.');window.location ='index.aspx';", true);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: '{0}'", ex);
            }
        }
    }
}