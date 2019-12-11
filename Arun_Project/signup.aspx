<%@ Page Title="" Language="C#" MasterPageFile="~/mobile.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Arun_Project.signup" %>
<%@ MasterType VirtualPath="~/mobile.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">


            <h2>REGISTER YOUR ACCOUNT</h2>
    <br />
    <br />
     <div>
        <table style="width: 100%">
            <tr>
                <td style="width: 148px">FirstName :</td>
                <td>
                    <asp:TextBox ID="fname" runat="server" CssClass="highlight" placeholder="First name here.."
                        Height="24px" Width="175px"></asp:TextBox>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname"
                         ErrorMessage="Please enter first name">*</asp:RequiredFieldValidator>
                       <br />
                    <br />
                     
                </td>
            </tr>
             <tr>
                <td style="width: 148px; height: 22px">LastName :</td>
                <td style="height: 22px">
                    <asp:TextBox ID="lname"  runat="server" CssClass="highlight" placeholder="Last name here.."
                        Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname"
                         ErrorMessage="Please enter last name ">*</asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 148px">Gender  :</td>
                <td>
                    <asp:DropDownList ID="gender_dd" runat="server" CssClass="highlight" Height="24px" Width="119px">
                        <asp:ListItem Value="" Text="Select One"/>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gender_dd"
                         ErrorMessage="Please select one">*</asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 148px">DateOfBirth :</td>
                <td>
                    <asp:TextBox ID="date" TextMode="Date" runat="server" CssClass="highlight" Height="24px" Width="175px"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="date"
                         ErrorMessage="Please enter your birthday">*</asp:RequiredFieldValidator>
                    
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="date"
                        ErrorMessage="Please enter a valid date" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                    
                    <br />
                    <br />
                   </td>
                  </tr>
                  <tr>
                <td style="width: 148px">Email_Id :</td>
                <td>
                    <asp:TextBox ID="email"  runat="server" CssClass="highlight" placeholder="Type Email adress .."
                         
                        Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="email"
                        ErrorMessage="Please enter email_id">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email"
      ErrorMessage="enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 148px">Password :</td>
                <td>
                    <asp:TextBox ID="password" TextMode="Password" runat="server" CssClass="highlight" placeholder="Type password here.."
                         Height="24px" Width="175px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="password"
                        ErrorMessage="Please enter password">*</asp:RequiredFieldValidator>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="width: 148px"> </td>
                <td>
                    
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                    <br />
                    <asp:Button OnClick="registerBtn_Click1" ID="registerbtn" runat="server" Text="Register" CssClass="link-button red" />
                    <br />
                    <br />
                    <asp:Label ID="outputlabel" runat="server"></asp:Label>
                    <br />
                </td>
            </tr>
        </table></div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
     </asp:Content>
