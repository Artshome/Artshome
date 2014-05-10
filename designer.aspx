<%@ Page Language="C#"  masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="designer.aspx.cs" Inherits="designer" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%Dbc dbc = new Dbc();
  Designer designer = dbc.GetDesignerByName(Request["designerName"]);
  List<Collection> collections = dbc.GetCollectionByDesignerName(Request["desigerName"]);
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
     <div class="holeder">
		<ul class="imageHolder">
			<li><a href="collection-detail.aspx"><img src="images/PARIS.jpg" alt="" align="absmiddle"/><p>PARIS</p></a></li>
			<li><a href="collections.aspx"><img src="images/LONDON.jpg" alt="" align="absmiddle"/><p>LONDON</p></a></li>
            <li><a href="collections.aspx"><img src="images/NY.jpg" alt="" align="absmiddle"/><p>NEW YORK</p></a></li>
			<li><a href="collections.aspx"><img src="images/ROYALGUARD.jpg" alt="" align="absmiddle"/><p>ROYAL GUARD</p></a></li>
			<li><a href="collections.aspx"><img src="images/STOCKHOLM.jpg" alt="" align="absmiddle"/><p>STOCKHOLM</p></a></li>
        </ul>
     </div>

</asp:Content>