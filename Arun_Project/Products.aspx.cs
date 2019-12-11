using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Arun_Project
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/Order.aspx", "Home");

            string header = "Our Products";
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
                Master.AddBreadcrumbLink("/Products.aspx", "Products");

                // amend header string to include category 
                switch (catID)
                {
                    case "iphone":
                        header += " - iphone";
                        Master.AddCurrentPage("iphone");
                        break;
                    case "moto":
                        header += " - Motorola";
                        Master.AddCurrentPage("Motorola");
                        break;
                    case "google":
                        header += " - google";
                        Master.AddCurrentPage("google");
                        break;
                    case "htc":
                        header += " - htc";
                        Master.AddCurrentPage("htc");
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