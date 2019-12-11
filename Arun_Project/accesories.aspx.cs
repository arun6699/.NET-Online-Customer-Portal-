using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Arun_Project
{
    public partial class accesories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Order.aspx", "Home");

            string header = "Accesories";
            string catID = Request.QueryString["catID"];

            // assign data source based on whether there's a catID query string value
            if (string.IsNullOrEmpty(catID))
            {
                Repeater1.DataSourceID = "SqlDataSourceAll";
                Master.AddCurrentPage("Products");
            }
            else
            {
                Repeater1.DataSourceID = "SqlDataSourceByCategory";
                Master.AddBreadcrumbLink("/accesories.aspx", "-accesories");

                // amend header string to include category 
                switch (catID)
                {
                    case "headphone":
                        header += " - headphone";
                        Master.AddCurrentPage("headphone");
                        break;
                    case "speaker":
                        header += " - JBL";
                        Master.AddCurrentPage("JBL");
                        break;
                    
                }
            }

            // set page header text 
            Master.HeaderText = header;
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

    

        protected void buybtn_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {


                Response.Redirect("Order.aspx");
            }
        }

    }


}