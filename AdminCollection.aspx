<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminCollection.aspx.cs" Inherits="AdminCollection" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<% 
    if (Session["collectionPermission"] == null || Session["collectionPermission"].ToString() == "false")
   {
       Response.Redirect("AdminDefault.aspx");
   }
%>
</asp:Content>

