<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminBespoke.aspx.cs" Inherits="AdminBespoke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="script/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Bespoke Settings</h2> 
    <div style="margin-left: 20px">
        Bespoke Picture:<br />
        <asp:CheckBox runat="server" ID="checkbox1" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox1_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" Visible="false"/>
        <br />
        <br />
        Content:<br />
        <textarea class="ckeditor" name="editor1" runat="server" id="textarea1"></textarea><br />
        <br />
        <asp:Button ID="button1" runat="server" class="AddNewItemButton"
            Text="Update" OnClick="button1_Click" />
    </div>
</asp:Content>

