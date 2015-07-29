<%@ Page Language="C#" masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="chinaz">
    <ul class="51buypic">
        <li><img src="<%=_banners.pic1Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic2Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic3Url %>" alt="picture" /></li>
        <li><img src="<%=_banners.pic4Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic5Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic6Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic7Url %>" alt="picture"/></li>
        <li><img src="<%=_banners.pic8Url %>" alt="picture"/></li>
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
    
</div>
<div class="paragraph">
    <h1>COLLECTIONS</h1>
    <script type="text/javascript">
        $(document).ready(function () {

            var posters1 = new posters('posters1', { className: "posters" },
        [
        <%=images%>
        ]
        );
        });
	</script>
    <center><div id="posters1"></div></center>
</div>

</asp:Content>

