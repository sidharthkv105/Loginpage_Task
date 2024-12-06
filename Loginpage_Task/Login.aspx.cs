using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Loginpage_Task
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=SIDH;Initial Catalog=UserManagementDB ;persist security info=False;integrated security=SSPI;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT UserName FROM Users WHERE UserName = @UserName AND PasswordHash = @PasswordHash";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@PasswordHash", FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1"));

                con.Open();
                var result = cmd.ExecuteScalar();
                if (result != null)
                {
                    Session["UserName"] = txtUserName.Text;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password!";
                }
            }
        }
    }
}