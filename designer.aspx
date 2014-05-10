<%@ Page Language="C#"  masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="designer.aspx.cs" Inherits="designer" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<hr class="hr1" />
<div class="designer">
    <img src="<%=_designer.ImageUrl %>" alt="error"/>

    <div>
    <h1><%=_designer.Name %></h1>
    <div class="description">
    <span>
    <%=_designer.Description %>
    </span>
    </div>
    </div>
</div>
<hr class="hr1" />
     <div class="holeder">
		<ul class="imageHolder">
            <% foreach(Collection collection in collections){ %>
			<li><a href="collection-detail.aspx"><img src="<%=collection.ImageUrl %>" alt="" align="absmiddle"/><%=collection.Name %></a></li>
            <%} %>
        </ul>
     </div>

</asp:Content>