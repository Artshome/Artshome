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
    <div class="paragraph">
        <h1>Pink on back</h1>
	    <span>blablablablablablablablablablablabla</span>
    </div>
    <br />
	<div class="divider"></div>	
	
	<div class="holder">
		<ul class="imgset3 imageHolder clearfix">
			<li><a href="collection-pinkOnBlack.aspx"><img src="images/1.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/2.jpg"><img src="images/2.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/3.jpg"><img src="images/3.jpg" alt="" /></a><p>blabla</p></li>
            <li><a href="images/4.jpg"><img src="images/4.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/1.jpg"><img src="images/1.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/2.jpg"><img src="images/2.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/3.jpg"><img src="images/3.jpg" alt="" /></a><p>blabla</p></li>
            <li><a href="images/4.jpg"><img src="images/4.jpg" alt="" /></a><p>blabla</p></li>
		</ul>
	</div>

</asp:Content>
