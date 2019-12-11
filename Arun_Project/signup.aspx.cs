using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Arun_Project
{
    public partial class signup : System.Web.UI.Page


    {

        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerBtn_Click1(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                myConnection.Open();

                string userInvalid = "You have already registered, please click to login.";

                string checkDatabase = "SELECT * FROM Users WHERE Email_Id = @em AND Password = @pas";
                SqlCommand command = new SqlCommand(checkDatabase, myConnection);
                command.Parameters.AddWithValue("@em", email.Text);
                command.Parameters.AddWithValue("@pas", password.Text);
                command.ExecuteNonQuery();
                SqlDataReader reader = command.ExecuteReader();
                

                if (reader.HasRows)
                {
                    outputlabel.Text = userInvalid;
                    reader.Close();
                }


                else
                {
                    try
                    {


                        myConnection.Open();
                    }
                    catch (Exception ex)
                    {
                        myConnection.Close();
                        string query = "Insert into Users (FirstName,LastName,Gender,DateOfBirth,Email_Id,Password) Values (@fn,@ln,@gen,@dob,@em,@pas)";

                        SqlCommand insertCommand = new SqlCommand(query, myConnection);

                        myConnection.Open();

                        insertCommand.Parameters.AddWithValue("@fn", fname.Text);
                        insertCommand.Parameters.AddWithValue("@ln", lname.Text);
                        insertCommand.Parameters.AddWithValue("@gen", gender_dd.SelectedItem.Text);
                        insertCommand.Parameters.AddWithValue("@dob", date.Text);
                        insertCommand.Parameters.AddWithValue("@em", email.Text);
                        insertCommand.Parameters.AddWithValue("@pas", password.Text);

                        insertCommand.ExecuteNonQuery();





                        myConnection.Close();
                        Response.Redirect("signin.aspx");
                    }


                    finally { myConnection.Close(); }
                }

            }
        }


    }
}
        