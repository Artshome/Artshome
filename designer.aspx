<%@ Page Language="C#"  masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="designer.aspx.cs" Inherits="designer" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%Dbc dbc = new Dbc();
  Designer designer = dbc.GetDesignerByName(Request["designerName"]); 
    %>
<hr class="hr1" />
<div class="designer">
    <img src="<%=designer.ImageUrl %>" alt="error"/>

    <div>
    <h1><%=designer.Name %></h1>
    <div class="description">
    <span>
    <%=designer.Description %>
    </span>
    </div>
    </div>
</div>
<hr class="hr1" />
		<ul class="imageHolder">
			<li><a href="collection-pinkOnBlack.aspx"><img src="images/PARIS.jpg" alt="" align="absmiddle"/></a><p>PARIS</p></li>
			<li><a href="collections.aspx"><img src="images/LONDON.jpg" alt="" align="absmiddle"/></a><p>LONDON</p></li>
            <li><a href="collections.aspx"><img src="images/NY.jpg" alt="" align="absmiddle"/></a><p>NEW YORK</p></li>
			<li><a href="collections.aspx"><img src="images/ROYALGUARD.jpg" alt="" align="absmiddle"/></a><p>ROYAL GUARD</p></li>
			<li><a href="collections.aspx"><img src="images/STOCKHOLM.jpg" alt="" align="absmiddle"/></a><p>STOCKHOLM</p></li>
        </ul>

</asp:Content>