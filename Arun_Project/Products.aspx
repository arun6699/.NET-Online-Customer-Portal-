<%@ Page Title="" Language="C#" MasterPageFile="~/mobile.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Arun_Project.Products" %>
<%@ MasterType VirtualPath="~/mobile.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row">
        
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="thumbnail">
                        <img src='/Images/Products/<%# Eval("image") %>' 
                            alt='<%# Eval("name") %>' />
                        <div class="caption">
                            <h3><%# Eval("name") %></h3>
                            <p><b>Price: <%# Eval("price", "{0:c}") %></b>
                            <br><br><%# Eval("longdescription") %></p>
                              
                            <asp:Button ID="buybtn" runat="server" Text="Buy" onclick="buybtn_Click"  />
                         
                   
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceByCategory"
        ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>'
        SelectCommand="SELECT [productID], [name], [longdescription], 
        [price], [image] FROM [mobile1] 
        WHERE ([categoryID] = @CategoryID) ORDER BY [name]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="catID" 
                Name="CategoryID" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceAll"
        ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>'
        SelectCommand="SELECT [productID], [name], [longdescription], 
        [price], [image] FROM [mobile1] ORDER BY [name]">
    </asp:SqlDataSource>
    <img src="Images/pixel3banner.jpg" />
</asp:Content>
