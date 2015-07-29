<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminBanners.aspx.cs" Inherits="AdminBanners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left: 20px">
        <h2>Banners Settings</h2> 
        Picture 1:<br />
        <asp:CheckBox runat="server" ID="checkbox1" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox1_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 2:<br />
        <asp:CheckBox runat="server" ID="checkbox2" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox2_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload2" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 3:<br />
        <asp:CheckBox runat="server" ID="checkbox3" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox3_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload3" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 4:<br />
        <asp:CheckBox runat="server" ID="checkbox4" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox4_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload4" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 5:<br />
        <asp:CheckBox runat="server" ID="checkbox5" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox5_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload5" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 6:<br />
        <asp:CheckBox runat="server" ID="checkbox6" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox6_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload6" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 7:<br />
        <asp:CheckBox runat="server" ID="checkbox7" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox7_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload7" Width="300px" Visible="false"/>
        <br />
        <br />
        Picture 8:<br />
        <asp:CheckBox runat="server" ID="checkbox8" Text="Use default image"
            Checked="true" AutoPostBack="true" OnCheckedChanged="checkbox8_CheckedChanged" /><br />
        <asp:FileUpload runat="server" ID="FileUpload8" Width="300px" Visible="false"/>
        <br />
        <br />
        <asp:Button ID="button1" runat="server" class="AddNewItemButton"
            Text="Update" OnClick="button1_Click" />
        </div>
</asp:Content>

