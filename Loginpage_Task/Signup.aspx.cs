using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Loginpage_Task
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string connectionString = @"Data Source=SIDH;Initial Catalog=UserManagementDB ;persist security info=False;integrated security=SSPI;";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string checkEmailQuery = "SELECT COUNT(1) FROM Users WHERE Email = @Email";
                    SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, con);
                    checkEmailCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                    con.Open();
                    int emailCount = Convert.ToInt32(checkEmailCmd.ExecuteScalar());

                    if (emailCount > 0)
                    {
                        // Email already exists, show a message to the user
                        lblError.Text = "This email is already registered. Please use a different email.";
                        lblError.ForeColor = System.Drawing.Color.Red;
                        lblError.Visible = true;
                        con.Close(); // Close the connection and prevent further processing
                        return;
                    }

                    string query = "INSERT INTO Users (UserName, Email, Phone, PasswordHash) VALUES (@UserName, @Email, @Phone, @PasswordHash)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@PasswordHash", FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1"));

                    cmd.ExecuteNonQuery();

                    SendWelcomeEmail(txtEmail.Text, txtUserName.Text);
                    Response.Redirect("Login.aspx");
                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Send a welcome email after registration
                    SendWelcomeEmail(txtEmail.Text.Trim(), txtUserName.Text.Trim());

                    // Redirect the user to the login page
                    Response.Redirect("Login.aspx");
                }
            }
        }
        private void SendWelcomeEmail(string email, string username)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.Subject = "Welcome to Our Site!";
            mail.Body = $"Hello {username}, welcome to our platform!";
            mail.From = new MailAddress("sidharthkv.app@gmail.com");

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);  // Port 587 for TLS
            smtp.EnableSsl = true;  // Enable SSL/TLS
            smtp.Credentials = new System.Net.NetworkCredential("sidharthkv.app@gmail.com", "puei fykx kxaq vldr");
            smtp.Send(mail);
        }

    }
}