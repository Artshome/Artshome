<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminCollection.aspx.cs" Inherits="AdminCollection" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% 
    if (Session["collectionPermission"] == null || Session["collectionPermission"].ToString() == "false")
   {
       Response.Redirect("AdminDefault.aspx");
   }
%>

<h2>Collection Settings</h2> 
<table id="rounded-corner">
    <thead>
    	<tr>
            <th scope="col" class="rounded">Collection Name</th>
            <th scope="col" class="rounded">Description</th>
            <th scope="col" class="rounded">DesignerName</th>
            <th scope="col" class="rounded">ImageUrl</th>
        </tr>
    </thead>
    <% foreach (Table_Collection collection in collections)
       {
           %>
    <tbody>
    	<tr>
            <td><%=collection.name%></td>
            <td><%=collection.description.Length > 100 ? collection.description.Substring(0, 100) + "..." : collection.description%></td>
            <td><%=collection.designer %></td>
            <td><%=collection.imageUrl%></td>
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
    <asp:Label runat="server" ID="Label1" Text="Add New Collection" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label2" Text="Collection Name" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox1" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label9" Text="Designer Name" /><asp:Label ID="Label16" runat="server"  ForeColor="Red" /><br />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" >
    </asp:DropDownList><br /><br />
    <asp:Label runat="server" ID="Label3" Text="Description" /><asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox2" MaxLength="800" TextMode="MultiLine" Rows="7" style="width:300px;margin-left:0px;" /><br /><br />
    <asp:Label runat="server" ID="Label4" Text="ImageUrl" /><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br />
    <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" /><br /><br />
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select a Collection to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="Collection Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList2" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList2_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label17" Text="Designer Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList3" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label5" Text="Description" /><asp:Label ID="Label14" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox3" MaxLength="800" TextMode="MultiLine" Rows="7" style="width:300px;margin-left:0px;" /><br /><br />
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
    <asp:Label runat="server" ID="Label12" Text="Select an Collection to Delete" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label19" Text="Collection Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList4" 
        style="width:150px;margin-left:0px;" >
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="button6" runat="server" class="DeleteItemButton" 
        Text="Delete" onclick="button6_Click" />
</div>
</asp:Panel>


</asp:Content>

