<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMasterPage.master" CodeFile="AdminTradeShow.aspx.cs" Inherits="AdminTradeShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Trade Show Information Settings</h2>            
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" DataKeyNames="id" DataSourceID="LinqDataSource1" Width="600px">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
        <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
        <asp:BoundField DataField="date_end" HeaderText="date_end" SortExpression="date_end" />
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
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DataClassesDataContext" EntityTypeName="" TableName="Table_TradeShow">
    </asp:LinqDataSource>
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
    <asp:Label runat="server" ID="Label1" Text="Add New Trade Show" style="font-size:large" /><br /><br />

    <asp:Label runat="server" ID="Label2" Text="Name" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox1" style="width:150px;margin-left:0px;" /><br /><br />

    <asp:Label runat="server" ID="Label3" Text="Date Start" /><asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar><br /><br />
    <asp:Label runat="server" ID="Label26" Text="Date End" /><br />
    <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <br /><br />
    <asp:Label runat="server" ID="Label23" Text="Location" /><asp:Label ID="Label24" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox3" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label9" Text="Link" /><asp:Label ID="Label25" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox6" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label4" Text="ImageUrl" /><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br />
    <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" /><br /><br />
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select a Trade Show to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="Id" /><br />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    <asp:Label runat="server" ID="Label28" Text="Name" /><br />
    <asp:TextBox runat="server" ID="textbox2" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label5" Text="Date Start" /><asp:Label ID="Label14" runat="server"  ForeColor="Red" /><br />
    <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar><br /><br />
    <asp:Label runat="server" ID="Label27" Text="Date End" /><br />
    <asp:Calendar ID="Calendar4" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar><br /><br />
    <asp:Label runat="server" ID="Label18" Text="Location" /><asp:Label ID="Label22" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox5" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label17" Text="Link" /><asp:Label ID="Label16" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox7" style="width:150px;margin-left:0px;" /><br /><br />
    
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
    <asp:Label runat="server" ID="Label12" Text="Select an Trade Show to Delete" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label19" Text="Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList2" 
        style="width:150px;margin-left:0px;" >
    </asp:DropDownList>
    <br /><br />
    <asp:Button ID="button6" runat="server" class="DeleteItemButton" 
        Text="Delete" onclick="button6_Click" />
</div>
</asp:Panel>

</asp:Content>
