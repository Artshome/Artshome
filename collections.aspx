<%@ Page Language="C#" masterpagefile="~/MasterPage.master"AutoEventWireup="true" CodeFile="collections.aspx.cs" Inherits="collections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>     
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<hr class="hr1" />
    <div class="paragraph">
        <h1>Collection</h1>
    </div>
    <br />
	
	<div class="holder">
		<ul class="imageHolder">
            <%
                foreach(Table_Collection collection in collectionslist)
                {
                    %>
                    <li><a href="collection-detail.aspx?collectionName=<%=collection.name %>"><img src="<%=collection.imageUrl %>" alt="" /><%=collection.name %></a></li>
                    <%                                                                                               
                }
            %>
		</ul>
	</div>

</asp:Content>
