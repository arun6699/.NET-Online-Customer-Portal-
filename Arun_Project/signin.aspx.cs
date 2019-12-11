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
    public partial class signin : System.Web.UI.Page
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

                string uservalid = "You have Sucessfully Logged in";
                string error1 = "Invalid User";
                Label2.Text = "";
                errorlbl.Text = "";
                string checkDatabase = "SELECT * FROM Users WHERE Email_Id = @em AND Password = @pas";
                SqlCommand command = new SqlCommand(checkDatabase, myConnection);
                command.Parameters.AddWithValue("@em", userbox.Text);
                command.Parameters.AddWithValue("@pas", passwordbox.Text);
                command.ExecuteNonQuery();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    Label2.Text = uservalid;
                    reader.Close();
                }


                else
                {
                    try
                    {


                        myConnection.Open();
                        myConnection.Close();

                    }
                    catch (Exception ex)
                    {
                        myConnection.Close();
                        string query = "Insert into Users (FirstName,LastName,Gender,DateOfBirth,Email_Id,Password) Values (@fn,@ln,@gen,@dob,@em,@pas)";

                        SqlCommand insertCommand = new SqlCommand(query, myConnection);

                        myConnection.Open();

                        myConnection.Close();

                        
                        errorlbl.Text = error1;
                        
                    }






                    finally { myConnection.Close(); }
                }

            }
        }


    }
}