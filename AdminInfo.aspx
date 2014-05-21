<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminInfo.aspx.cs" Inherits="AdminInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="script/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:20px">
        Company Name:<br />
        <asp:TextBox ID="TextBox1" runat="server" Columns="50"/><br /><br />
        Description:<br />
        <textarea class="ckeditor" name="editor1" runat="server" id="textarea1"></textarea><br /><br />
        Contact Address:<br />
        <asp:TextBox ID="TextBox2" runat="server"  Columns="50"/><br /><br />
        Contact Role:<br />
        <asp:TextBox ID="TextBox3" runat="server"  Columns="50"/><br /><br />
        Contact Phone:<br />
        <asp:TextBox ID="TextBox4" runat="server"  Columns="50"/><br /><br />
        Contact Mobie:<br />
        <asp:TextBox ID="TextBox5" runat="server"  Columns="50"/><br /><br />
        Contact Skype:<br />
        <asp:TextBox ID="TextBox6" runat="server"  Columns="50"/><br /><br />
        <asp:Button ID="button1" runat="server" class="AddNewItemButton" 
        Text="Update" onclick="button1_Click" />
    </div>
</asp:Content>

