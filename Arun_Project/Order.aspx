<%@ Page Title="" Language="C#" MasterPageFile="~/mobile.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Arun_Project.Order" %>
<%@ MasterType VirtualPath="~/mobile.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <div class="row"><%-- row 1: drop-down list --%>
        <div class="form-group">
            <div ">
                <label >Please select a product:</label>
                <div >
                    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="name" 
                        DataValueField="productID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
                        SelectCommand="SELECT [productID], [name], [shortdescription], 
                        [longdescription], [image], [price] FROM [mobile1] 
                        ORDER BY [name]">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div><%-- end of row 1 --%>

    <div class="row"><%-- row 2: FormView control --%>
        <asp:FormView ID="FormView1" runat="server" 
            DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <div class="col-sm-8"><%-- info column --%>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h4><asp:Label Text='<%# Eval("name") %>' runat="server" /></h4>
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label Text='<%# Eval("shortdescription") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label Text='<%# Eval("longdescription") %>' runat="server" />
                        </div></div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label ID="lblUnitPrice" ClientIDMode="Static" 
                                Text='<%# Eval("price", "{0:c} each") %>' runat="server" />
                        </div></div>
                </div>
                <div class="col-sm-4"><%-- product image column --%>
                    <asp:Image ID="imgProduct" runat="server" 
                        ImageUrl='<%# Eval("image", "Images/Products/{0}") %>' />
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" 
            ConnectionString='<%$ ConnectionStrings:HalloweenConnection %>' 
            SelectCommand="SELECT [productID], [name], [shortdescription], 
                [longdescription], [image], [price] 
                FROM [mobile1] 
            WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProducts" Name="ProductID" 
                    PropertyName="SelectedValue" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div><%-- end of row 2 --%>

    <div class="row"><%-- row 3: quantity, buttons --%>
        <div class="col-sm-12">
            <div class="form-group">
                <label class="col-sm-1">Quantity:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtQuantity" runat="server" 
                        CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                        runat="server" ControlToValidate="txtQuantity" Display="Dynamic" 
                        ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger" 
                        ControlToValidate="txtQuantity" Display="Dynamic" 
                        ErrorMessage="Quantity must range from 1 to 500."
                        MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator></div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" 
                        onclick="btnAdd_Click" CssClass="btn" />
                    <asp:Button ID="btnCart" runat="server" Text="Go to Cart" 
                        PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn" />
                </div>
            </div>
        </div>
    </div><%-- end of row 3 --%>

</asp:Content>