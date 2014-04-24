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
            <th scope="col" class="rounded">Product</th>
            <th scope="col" class="rounded">Details</th>
            <th scope="col" class="rounded">Price</th>
            <th scope="col" class="rounded">Date</th>
        </tr>
    </thead>
        
    <tbody>
    	<tr>
            <td>Product name</td>
            <td>details</td>
            <td>150$</td>
            <td>12/05/2010</td>
        </tr>
    </tbody>
</table>
    <div style=" text-align:right">
<asp:Button ID="button1" runat="server" class="AddNewItemButton" 
        Text="Add"  />
<asp:Button ID="button2" runat="server" class="AddNewItemButton" 
        Text="Update"  />
<asp:Button ID="button3" runat="server" class="DeleteItemButton" 
        Text="Delete"  />
</div>
</asp:Content>

