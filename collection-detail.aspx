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
        <h1><%=collection.Name %></h1>
	    <span><%=collection.Description %></span>
    </div>
    <div>
	  <table class="imgset1 collectionTable clearfix">
        <tr>
        <th>VISUAL</th>
        <th>SIZE</th>
        <th>CODE</th>
        </tr>
        <%
            foreach(Product product in productslist)
            {
                %>
                <tr>
                    <td class="td1"><p><a href="<%=product.ImageUrl %>" rel="lightbox"><img src="<%=product.ImageUrl %>" alt="" /></a></p></td>            
                    <td class="td2"><%=product.Size %></td>
                    <td class="td1"><%=product.Code %></td>
                </tr>
                <%
                }
          %>

    </table>
	</div>
	

</asp:Content>