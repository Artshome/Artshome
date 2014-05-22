<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminProduct.aspx.cs" Inherits="AdminProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% 
   if (Session["productPermission"] == null || Session["productPermission"].ToString() == "false")
   {
       Response.Redirect("AdminDefault.aspx");
   }
%>
<h2>Products Categories Settings</h2>            
<table id="rounded-corner" >
    <thead>
    	<tr>
            <th scope="col" class="rounded">ProductCode</th>
            <th scope="col" class="rounded">sharp</th>
            <th scope="col" class="rounded">size</th>
            <th scope="col" class="rounded">collectionname</th>
            <th scope="col" class="rounded">image</th>
        </tr>
    </thead>
        
    <% foreach (Table_Product product in products)
       {
           %>
    <tbody>
    	<tr>
            <td><%=product.code %></td>
            <td><%=product.shape %></td>
            <td><%=product.size %></td>
            <td><%=product.collection %></td>
            <td><%=product.imageUrl %></td>
        </tr>
    </tbody>
    <%}%>
</table>
<div style=" text-align:right">
<asp:Button ID="button1" runat="server" class="AddNewItemButton" 
        Text="Add" onclick="button1_Click" />
<asp:Button ID="button2" runat="server" class="AddNewItemButton" 
        Text="Update" onclick="button2_Click" />
<asp:Button ID="button3" runat="server" class="DeleteItemButton" 
        Text="Delete" onclick="button3_Click" />
</div>
<asp:Panel ID="panel4" Visible="false" runat="server">
    <div class="valid_box">
         <asp:Label runat="server" ID="Label20" Text="" />
    </div>
</asp:Panel>
<asp:Panel ID="panel5" Visible="false" runat="server">
    <div class="error_box">
         <asp:Label runat="server" ID="Label21" Text="" />
    </div>
</asp:Panel>
<asp:Panel ID="panel1" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label1" Text="Add New Product" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label2" Text="Product Code" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox1" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label3" Text="Product Sharp" /><asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox2" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label23" Text="Product Size" /><asp:Label ID="Label26" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox3" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label9" Text="Collection Name" />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" >
    </asp:DropDownList><br /><br />
    <asp:Label runat="server" ID="Label4" Text="ImageUrl" /><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br />
    <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" /><br /><br />
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select a Product to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="Product Code" /><br />
    <asp:DropDownList runat="server" ID="DropDownList2" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label5" Text="Sharp" /><asp:Label ID="Label14" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox4" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label18" Text="Size" /><asp:Label ID="Label22" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox5" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label17" Text="Collection Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList3" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label13" Text="ImageUrl" /><asp:Label ID="Label15" runat="server"  ForeColor="Red" /><br />
    
    <asp:CheckBox runat="server" ID="checkbox1" Text="Use default image" 
        Checked="true" AutoPostBack="true" oncheckedchanged="checkbox1_CheckedChanged"/><br />
    <asp:FileUpload runat="server" ID="FileUpload2" Width="300px" />
    <br /><br />
    <asp:Button ID="button5" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button5_Click" /><br />
</div>
</asp:Panel>

<asp:Panel ID="panel3" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label12" Text="Select an Product to Delete" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label19" Text="Product Code" /><br />
    <asp:DropDownList runat="server" ID="DropDownList4" 
        style="width:150px;margin-left:0px;" >
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="button6" runat="server" class="DeleteItemButton" 
        Text="Delete" onclick="button6_Click" />
</div>
</asp:Panel>

</asp:Content>

