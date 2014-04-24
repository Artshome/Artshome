<%@ Page Language="C#" masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="chinaz">
    <ul class="51buypic">
        <li><a href="Default.aspx" target="_blank"><img src="images/991453595.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/2.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/3.jpg" alt="picture" /></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/4.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/1.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/2.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/3.jpg" alt="picture"/></a></li>
        <li><a href="Default.aspx" target="_blank"><img src="images/4.jpg" alt="picture"/></a></li>
    </ul>
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>
    <div class="num">
    	<ul></ul>
    </div>
</div>
<div class="paragraph">
    <h1>Welcome To KESS InHouse</h1>
    <span>We are a unique team of designers and artists that strive to spread art throughout the home. Our goal is to empower each artist and their story, portrayed through our products. We pride ourselves on affordable pricing for quality artistc products that add lift to any home. KESS puts their own twist on anything from pillows & bedding to shower curtains and canvases! The wide variety of options at KESS allows our customer base to customize their homes with cultivated and creative flare!</span>
    <div class="facebookLike">
        <img src="images/8.png" alt="like" />
        <span><a href="http://facebook.com" target="_blank">Ria Choi</a>, <a href="http://facebook.com" target="_blank">Nika Martinez</a> and 42,153 others like this.</span>
    </div>
</div>
<div class="paragraph">
    <h1>COLLECTIONS</h1>
    <script type="text/javascript">
        $(document).ready(function () {

            var posters1 = new posters('posters1', { className: "posters" },
        [
        { "img": "images\/LONDON.jpg", "url": "images\/LONDON.jpg" },
        { "img": "images\/NY.jpg", "url": "images\/NY.jpg" },
        { "img": "images\/ROYALGUARD.jpg", "url": "images\/ROYALGUARD.jpg" },
        { "img": "images\/STOCKHOLM.jpg", "url": "images\/STOCKHOLM.jpg" },
        { "img": "images\/PARIS.jpg", "url": "images\/PARIS.jpg" },
        { "img": "images\/11.png", "url": "images\/11.png" },
        { "img": "images\/12.png", "url": "images\/12.png" },
        ]
        );
        });
	</script>
    <center><div id="posters1"></div></center>
</div>

</asp:Content>

