<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
<script type="text/javascript" src="script/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/niceforms-default.css" />

</head>
<body>
<div id="main_container">

	<div class="header_login">
    <div class="logo"><a href="#"><img src="images/logo.png" alt="" style="border:0;width:200px;height:140px;"/></a></div>
    
    </div>
    <form id="Form1" runat="server" >
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
         <div class="login_form">
         <h3>Admin Panel Login</h3>
                <fieldset>
                    <dl>
                        <dt><label>AdminName:</label></dt>
                        <dd><asp:TextBox ID="textbox1" runat="server" size="30" MaxLength="16"/><asp:Label ID="Label1" runat="server"  ForeColor="Red" /></dd>
                    </dl>
                    <dl>
                        <dt><label>Password:</label></dt>
                        <dd><asp:TextBox ID="textbox2" runat="server" size="30" TextMode="Password" MaxLength="16"/><asp:Label ID="Label2" runat="server"  ForeColor="Red" /></dd>
                    </dl>
                    
                     <dl class="submit">
                        
                        <asp:Button ID="button1"  Text="Login" runat="server" onclick="button1_Click" class="AddNewItemButton"/>
                     </dl>
                     <dl class="submit">
                        <asp:Label ID="Label3" runat="server"  ForeColor="Red" />
                     </dl>
                </fieldset>
                
         
         </div>  
        </ContentTemplate>
        </asp:UpdatePanel>
        </form>
</div>		
</body>
</html>
