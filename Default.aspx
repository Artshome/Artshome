<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Default, App_Web_nwtheo5c" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="chinaz">
    <ul class="51buypic">
        <li><a href="Default.aspx" target="_blank"><img src="images/1.jpg" alt="picture"/></a></li>
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
<div class="homepageParagraph">
    <h1>Welcome To KESS InHouse</h1>
    <span>We are a unique team of designers and artists that strive to spread art throughout the home. Our goal is to empower each artist and their story, portrayed through our products. We pride ourselves on affordable pricing for quality artistc products that add lift to any home. KESS puts their own twist on anything from pillows & bedding to shower curtains and canvases! The wide variety of options at KESS allows our customer base to customize their homes with cultivated and creative flare!</span>
    <div class="facebookLike">
        <img src="images/261.png" alt="like" />
        <span><a href="http://facebook.com" target="_blank">Ria Choi</a>, <a href="http://facebook.com" target="_blank">Nika Martinez</a> and 42,153 others like this.</span>
    </div>
</div>
<div class="homepageParagraph">
    <h1>COLLECTIONS</h1>
    <script type="text/javascript">
        $(document).ready(function () {

            var posters1 = new posters('posters1', { className: "posters" },
        [
        { "img": "images\/1.jpg", "url": "images\/1.jpg" },
        { "img": "images\/2.jpg", "url": "images\/2.jpg" },
        { "img": "images\/3.jpg", "url": "images\/3.jpg" },
        { "img": "images\/4.jpg", "url": "images\/4.jpg" },
        { "img": "images\/1.jpg", "url": "images\/1.jpg" },
        { "img": "images\/2.jpg", "url": "images\/2.jpg" },
        { "img": "images\/3.jpg", "url": "images\/3.jpg" },
        { "img": "images\/4.jpg", "url": "images\/4.jpg" },
        ]
        );
        });
	</script>
    <center><div id="posters1"></div></center>
</div>

</asp:Content>

