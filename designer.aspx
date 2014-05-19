<%@ Page Language="C#"  masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="designer.aspx.cs" Inherits="designer" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<hr class="hr1" />
<div class="designer">
    <img src="<%=_designer.imageUrl %>" alt="error"/>

    <div>
    <h1><%=_designer.name %></h1>
    <div class="description">
    <span>
    <%=_designer.description %>
    </span>
    </div>
    </div>
</div>
<hr class="hr1" />
     <div class="holeder">
		<ul class="imageHolder">
            <% foreach(Table_Collection collection in collections){ %>
			<li><a href="collection-detail.aspx"><img src="<%=collection.imageUrl %>" alt="" align="absmiddle"/><%=collection.name %></a></li>
            <%} %>
        </ul>
     </div>

</asp:Content>