<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminAdmin.aspx.cs" Inherits="AdminAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% 
    if (Session["superPermission"] == null || Session["superPermission"].ToString() == "false")
   {
       Response.Redirect("AdminDefault.aspx");
   }
%>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<%
    Dbc dbc = new Dbc();
    List<Admin> admins = dbc.GetALLAdmin();
%>
<h2>Admin Settings</h2>            
<table id="rounded-corner">
    <thead>
    	<tr>
            <th scope="col" class="rounded">Admin Name</th>
            <th scope="col" class="rounded">Password</th>
            <th scope="col" class="rounded">Product Permission</th>
            <th scope="col" class="rounded">Collection Permission</th>
            <th scope="col" class="rounded">Designer Permission</th>
            <th scope="col" class="rounded">Super Permission</th>
        </tr>
    </thead>
    <% foreach(Admin admin in admins){
           %>
    <tbody>
    	<tr>
            <td><%=admin.Name %></td>
            <td><%=admin.Password %></td>
            <td><%=admin.ProductPermission == 1 ? "Yes" : "No" %></td>
            <td><%=admin.CollectionPermission == 1 ? "Yes" : "No" %></td>
            <td><%=admin.DesignerPermission == 1 ? "Yes" : "No" %></td>
            <td><%=admin.SuperPermission == 1 ? "Yes" : "No" %></td>
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

<asp:Panel ID="panel1" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label1" Text="Add New Admin" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label2" Text="Admin Name" /><br />
    <asp:TextBox runat="server" ID="textbox1" MaxLength="16" style="width:150px;margin-left:0px;" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label3" Text="Password" /><br />
    <asp:TextBox runat="server" ID="textbox2" MaxLength="16" TextMode="Password" style="width:150px;margin-left:0px;" /><asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label4" Text="Password Confirm" /><br />
    <asp:TextBox runat="server" ID="textbox3" MaxLength="16" TextMode="Password" style="width:150px;margin-left:0px;" /><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label5" Text="Permissions" /><br />
    <asp:CheckBox runat="server" ID="checkbox1" Text="Product Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox2" Text="Collection Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox3" Text="Designer Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox4" Text="Super Permission"  ForeColor="Red"/><br />
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
    <asp:Label ID="Label9" runat="server"  ForeColor="Red" />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select an Admin to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="Admin Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label13" Text="Password" /><br />
    <asp:TextBox runat="server" ID="textbox4" MaxLength="16" TextMode="Password" style="width:150px;margin-left:0px;" /><asp:Label ID="Label14" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label15" Text="Password Confirm" /><br />
    <asp:TextBox runat="server" ID="textbox5" MaxLength="16" TextMode="Password" style="width:150px;margin-left:0px;" /><asp:Label ID="Label16" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label17" Text="Permissions" /><br />
    <asp:CheckBox runat="server" ID="checkbox5" Text="Product Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox6" Text="Collection Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox7" Text="Designer Permission" /><br />
    <asp:CheckBox runat="server" ID="checkbox8" Text="Super Permission"  ForeColor="Red"/><br />
    <asp:Button ID="button5" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button5_Click" /><br />
    <asp:Label ID="Label18" runat="server"  ForeColor="Red" />
</div>
</asp:Panel>

<asp:Panel ID="panel3" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label12" Text="Select an Admin to Delete" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label19" Text="Admin Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList2" 
        style="width:150px;margin-left:0px;" >
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="button6" runat="server" class="DeleteItemButton" 
        Text="Delete" onclick="button6_Click" />
</div>
</asp:Panel>
<asp:Panel ID="panel4" Visible="false" runat="server">
    <div class="valid_box">
         <asp:Label runat="server" ID="Label20" Text="" />
    </div>
</asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

