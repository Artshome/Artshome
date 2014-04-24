<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%
        Dbc dbc = new Dbc();
        Designer d = new Designer();
        d.Name = "Gandalf";
        d.Description = "Gandalf is a fictional characters in J. R. R. Tolkiens novels The Hobbit and The Lord of the Rings. He is a wizard, member of the Istari order, as well as leader of the Fellowship of the Ring and the army of the West. In The Lord of the Rings, he is initially known as Gandalf the Grey, but returns from death as Gandalf the White.";
        d.ImageUrl = "images/designer/Gandalf.jpg";
        
        
        %>
        <%=dbc.UpdateDesigner(d).ToString() %>
    </div>
    </form>
</body>
</html>
