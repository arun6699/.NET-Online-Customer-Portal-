<%@ Page Title="" Language="C#" MasterPageFile="~/mobile.Master" AutoEventWireup="true" CodeBehind="signin.aspx.cs" Inherits="Arun_Project.signin" %>
<%@ MasterType VirtualPath="~/mobile.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">

     <table style="width: 100%">
                <tr>
                    <td style="width: 163px">UserName:</td>
                    <td>
                        <asp:TextBox ID="userbox" runat="server" CssClass="form-poshytip" placeholder="enter username"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 163px">Password:</td>
                    <td>
                        <asp:TextBox ID="passwordbox" TextMode="Password" runat="server" CssClass="form-poshytip" placeholder="enter password"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 163px"> </td>
                    <td>
                        <asp:Button OnClick="registerBtn_Click1"    ID="submitbtn" runat="server" Text="Submit" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

                         <asp:Button ID="btnContinue1" runat="server"
                        PostBackUrl="~/Products.aspx" Text="Continue Shopping"  />
                    &nbsp;
                        <asp:Label ID="errorlbl" runat="server" ForeColor="Red"></asp:Label>

                         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                     </td>
                </tr>
            </table>
</asp:Content>
