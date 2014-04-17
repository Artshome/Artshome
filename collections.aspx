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
<hr class="hr1" />
    <div class="paragraph">
        <h1>Pink on back</h1>
	    <span>blablablablablablablablablablablabla</span>
    </div>
    <br />
	<div class="divider"></div>	
	
	<div class="holder">
		<ul class="imageHolder">
			<li><a href="collection-pinkOnBlack.aspx"><img src="images/1.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/LONDON.jpg"><img src="images/LONDON.jpg" /></a><p>blabla</p></li>
			<li><a href="images/PARIS.jpg"><img src="images/PARIS.jpg" alt="" /></a><p>blabla</p></li>
            <li><a href="images/NY.jpg"><img src="images/NY.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/ROYALGUARD.jpg"><img src="images/ROYALGUARD.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images//LONDON.jpg"><img src="images/LONDON.jpg" alt="" /></a><p>blabla</p></li>
			<li><a href="images/PARIS.jpg"><img src="images/PARIS.jpg" alt="" /></a><p>blabla</p></li>
            <li><a href="images/NY.jpg"><img src="images/NY.jpg" alt="" /></a><p>blabla</p></li>
		</ul>
	</div>

</asp:Content>
