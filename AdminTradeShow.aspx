<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMasterPage.master" CodeFile="AdminTradeShow.aspx.cs" Inherits="AdminTradeShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Trade Show Information Settings</h2>            
<table id="rounded-corner" >
    <thead>
    	<tr>
            <th scope="col" class="rounded">Name</th>
            <th scope="col" class="rounded">Date</th>
            <th scope="col" class="rounded">Location</th>
            <th scope="col" class="rounded">Link</th>
            <th scope="col" class="rounded">image</th>
        </tr>
    </thead>
        
    <% foreach (Table_TradeShow tradeshow in tradeshows)
       {
           %>
    <tbody>
    	<tr>
            <td><%=tradeshow.name%></td>
            <td><%=tradeshow.date%></td>
            <td><%=tradeshow.location%></td>
            <td><%=tradeshow.link%></td>
            <td><%=tradeshow.image%></td>
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
    <asp:Label runat="server" ID="Label1" Text="Add New Trade Show" style="font-size:large" /><br /><br />

    <asp:Label runat="server" ID="Label2" Text="Name" /><asp:Label ID="Label6" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox1" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />

    <asp:Label runat="server" ID="Label3" Text="Date" />&nbsp;&nbsp; <asp:Label runat="server" ID="Label26" Text="Input style:MM-dd-yyyy" /><asp:Label ID="Label7" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox2" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />

    <asp:Label runat="server" ID="Label23" Text="Location" /><asp:Label ID="Label24" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox3" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label9" Text="Link" /><asp:Label ID="Label25" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox6" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label4" Text="ImageUrl" /><asp:Label ID="Label8" runat="server"  ForeColor="Red" /><br />
    <asp:FileUpload runat="server" ID="FileUpload1" Width="300px" /><br /><br />
    <asp:Button ID="button4" runat="server" class="AddNewItemButton" 
        Text="Save" onclick="button4_Click" /><br />
</div>
</asp:Panel>

<asp:Panel ID="panel2" Visible="false" runat="server">
<div style="margin-left:20px;">
    <asp:Label runat="server" ID="Label10" Text="Select a Trade Show to Update" style="font-size:large" /><br /><br />
    <asp:Label runat="server" ID="Label11" Text="Name" /><br />
    <asp:DropDownList runat="server" ID="DropDownList1" 
        style="width:150px;margin-left:0px;" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
    </asp:DropDownList>
    <br /><br />
    
    <asp:Label runat="server" ID="Label5" Text="Date" /><asp:Label ID="Label14" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox4" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label18" Text="Location" /><asp:Label ID="Label22" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox5" MaxLength="16" style="width:150px;margin-left:0px;" /><br /><br />
    
    <asp:Label runat="server" ID="Label17" Text="Link" /><asp:Label ID="Label16" runat="server"  ForeColor="Red" /><br />
    <asp:TextBox runat="server" ID="textbox7" MaxLength="32" style="width:150px;margin-left:0px;" /><br /><br />
    
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
