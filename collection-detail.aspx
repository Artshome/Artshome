<%@ Page Language="C#" masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="collection-detail.aspx.cs" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a[rel*=lightbox]').lightBox();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<div class="paragraph">
        <h1><%=collection.name %></h1>
	    <span><%=collection.description %></span>
    </div>
    <div>
	  <table class="imgset1 collectionTable clearfix">
        <tr>
        <th>VISUAL</th>
        <th>SIZE</th>
        <th>CODE</th>
        </tr>
        <%
            foreach(Table_Product product in productslist)
            {
                %>
                <tr>
                    <td class="td1"><p><a href="<%=product.imageUrl %>" rel="lightbox"><img src="<%=product.imageUrl %>" alt="" /></a></p></td>            
                    <td class="td2"><%=product.size %></td>
                    <td class="td1"><%=product.code %></td>
                </tr>
                <%
                }
          %>

    </table>
	</div>
	

</asp:Content>