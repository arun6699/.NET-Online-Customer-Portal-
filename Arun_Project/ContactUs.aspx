<%@ Page Title="" Language="C#" MasterPageFile="~/mobile.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Arun_Project.ContactUs" %>
<%@ MasterType VirtualPath="~/mobile.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
   

     <style type="text/css">
        

        .auto-style1 {
            height: 36px;
            width: 291px;
        }
        .auto-style2 {
            width: 291px;
        }
        .auto-style4 {
            height: 49px;
        }
        .auto-style5 {
            height: 49px;
            width: 291px;
        }

          </style>
  
            <h5>How to Contact Us</h5>

            <p>If Ypu have any queries about the products please  feel free to contact us</p>
         
      
   <table >
        <tr>
            <td class="auto-style1">
               <asp:Label ID="lblPhone" runat="server" Text="Phone:" Font-Bold="True"></asp:Label>
                <br />
            </td>
            <td style="height: 36px">
                1-888-555-2222<br />
                Weekdays, 8 to 5 PM
                Saturday, 8 to 2 PM <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:HyperLink CssClass="hyperlink" runat="server" NavigateUrl="mailto:themobilestore@mobile.com"> 
                themobilestore@mobile.com</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblFax" runat="server" Text="Fax:" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style4">
                1-7584-444-8585<br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblAdress" runat="server" Text="Address:" Font-Bold="True"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                The Mobile store, Inc.<br />
                1400 N. Franklin Street<br />
                California 93710</td>
        </tr>
        </table>


      </asp:Content>
