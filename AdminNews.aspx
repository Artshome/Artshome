<%@ Page ValidateRequest="false" Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminNews.aspx.cs" Inherits="AdminNews" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="script/ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>News Settings</h2>            
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" DataKeyNames="Id" DataSourceID="LinqDataSource1" OnDataBound="GridView1_DataBound" Width="600px">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Body" HeaderText="Body" SortExpression="Body" />
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="Table_News">
    </asp:LinqDataSource>
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
    <asp:Label runat="server" ID="Label1" Text="Add News" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label2" Text="Title" /><br />
    <asp:TextBox runat="server" ID="textbox1" style="width:150px;margin-left:0px;" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label3" Text="Body" /><br />
    <textarea class="ckeditor" name="editor1" runat="server" id="textarea1"></textarea>
    <asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br /><br />
   
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
    <asp:Label ID="Label9" runat="server"  ForeColor="Red" />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">

<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select a News to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="News Id" /><br />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label13" Text="Title" /><br />
    <asp:TextBox runat="server" ID="textbox3" style="width:150px;margin-left:0px;" /><asp:Label ID="Label4" runat="server"  ForeColor="Red" /><br /><br />
    <asp:Label runat="server" ID="Label5" Text="Body" /><br />
    <textarea class="ckeditor" name="editor1" runat="server" id="textarea2"></textarea><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br /><br />
   <asp:Button ID="button5" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button5_Click" /><br />
    <asp:Label ID="Label18" runat="server"  ForeColor="Red" />
</div>
</asp:Panel>

<asp:Panel ID="panel3" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label12" Text="Select an News to Delete" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label19" Text="News Id" /><br />
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


</asp:Content>

