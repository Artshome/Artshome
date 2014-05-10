<%@ Page Language="C#" masterpagefile="~/MasterPage.master"AutoEventWireup="true" CodeFile="collections.aspx.cs" Inherits="collections" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //imgcentering script
            $('.imgset1 img').imgCentering();
            $('.imgset2 img').imgCentering({ 'forceWidth': true, 'bgColor': '#000' });
            $('.imgset3 img').imgCentering({ 'forceHeight': true, 'bgColor': '#000' });
            $('.imgset4 img').imgCentering({ 'forceSmart': true });
            });
    </script>
</asp:Content>     
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%Dbc dbc = new Dbc();
  List<Collection> collectionslist = dbc.GetALLCollection(); 
%>
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
