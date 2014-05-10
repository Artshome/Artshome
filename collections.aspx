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
                foreach(Collection collection in collectionslist)
                {
                    %>
                    <li><a href="collection-detail.aspx?collectionName=<%=collection.Name %>"><img src="<%=collection.ImageUrl %>" alt="" /><%=collection.Name %></a></li>
                    <%                                                                                               
                }
            %>
		</ul>
	</div>

</asp:Content>
