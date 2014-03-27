<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_jdgd0zp2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<title>
    Artshome
</title>
<link href="css/Base.css" rel="stylesheet" type="text/css" />
<link href="css/Reveal.css" rel="stylesheet" type="text/css" />
<script src="script/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="script/jquery.cycle.all.min.js" type="text/javascript"></script>
<script src="script/jquery.reveal.js" type="text/javascript"></script>
<!-------------------导航栏初始化------------------->
<script type="text/javascript">
    var timeout = 500;
    var closetimer = 0;
    var ddmenuitem = 0;
    function topnav_open() {
        topnav_canceltimer();
        topnav_close();
        ddmenuitem = $(this).find('ul').eq(0).css('display', 'block');
        try {
            $(this).find('a.topoff').addClass('on');
        }
        catch (err) {
        }
    }
    function topnav_close() {
        try {
            if (ddmenuitem) ddmenuitem.css('display', 'none');
            if ($('a.on')) $('a.on').SwitchClass("on", "topoff");
        }
        catch (err) {
        }
    }
    function topnav_timer()
    { closetimer = window.setTimeout(topnav_close, timeout); }
    function topnav_canceltimer() {
        if (closetimer) {
            window.clearTimeout(closetimer);
            closetimer = null;
        }
    }
    $(document).ready(function () {
        $('#topnav > li').bind('mouseover', topnav_open).bind('mouseout', topnav_timer);
    });
    document.onclick = topnav_close;
</script>
<!-------------------多图切换初始化------------------->
<script type="text/javascript">
    $(function () { $('#slideshow').cycle({ fx: 'fade', speed: 1200, timeout: 3000 }); });
</script>
</head>
<body>
<div id="Wrapper">
<div id="Head">
<!------------------- LOGO ------------------->
<a href="Default.aspx"><img src="images/logo.jpg" border="0" alt="Artshome" class="logo" /></a>
<!------------------- 登陆注册,FACEBOOK按钮 ------------------->
<a class="trade" data-reveal-id="myModal1">Trade Login</a>
<a class="register" data-reveal-id="myModal2">Register</a>
<a href="Default.aspx" target="_blank"><img src="images/button-facebook2.png" id="imgFacebook" border="0" class="facebook" alt="Facebook" /></a>
<!------------------- 导航栏 ------------------->
<ul id="topnav">
<li class="first"><a href="" class="topon" target="_self">Home</a></li>
<li><a href="Default.aspx" class="topoff" target="_self">Collections</a>
<ul class="fix-z-index">
<li><a href="/en/collections/spring-news-2014/" target="_self">Spring news 2014</a></li>
<li><a href="/en/collections/anna-viktorsson/" target="_self">Anna Viktorsson</a></li>
<li><a href="/en/collections/asta-barrington/" target="_self">Asta Barrington / Alabasta</a></li>
<li><a href="/en/collections/bantie/" target="_self">Bantie</a></li>
<li><a href="/en/collections/bessie-johanson/" target="_self">Bessie Johanson</a></li>
<li><a href="/en/collections/bluebellgray/" target="_self">Bluebellgray</a></li>
<li><a href="/en/collections/clare-jordan/" target="_self">Clare Jordan</a></li>
<li><a href="/en/collections/cornelia-waldersten-arfors/" target="_self">Cornelia Waldersten Årfors</a></li>
<li><a href="/en/collections/ella-doran/" target="_self">Ella Doran</a></li>
<li><a href="/en/collections/emil-i-lonneberga/" target="_self">Emil i Lönneberga</a></li>
<li><a href="/en/collections/lush-designs/" target="_self">Lush Designs</a></li>
<li><a href="/en/collections/michael-angove/" target="_self">Michael Angove</a></li>
<li><a href="/en/collections/pippi-longstocking/" target="_self">Pippi Longstocking</a></li>
<li><a href="/en/collections/plingsulli/" target="_self">Plingsulli</a></li>
<li><a href="/en/collections/sam-pickard/" target="_self">Sam Pickard</a></li>
<li><a href="/en/collections/tina-backman/" target="_self">Tina Backman</a></li>
<li><a href="/en/collections/victoria-and-albert-museum/" target="_self">Victoria and Albert museum</a></li>
<li><a href="/en/collections/ulrica-hydman-vallien/" target="_self">Ulrica Hydman Vallien</a></li>
<li><a href="/en/collections/lasse-aberg/" target="_self">Lasse Åberg</a></li>
<li><a href="/en/collections/table-stand/" target="_self">Table stand</a></li>
<li><a href="/en/collections/tray-display/" target="_self">Tray Display</a></li>
</ul></li>
<li><a href="/en/designers/" class="topoff" target="_self">Designers</a>
<ul class="fix-z-index">
<li><a href="/en/designers/anna-viktorsson/" target="_self">Anna Viktorsson</a></li>
<li><a href="/en/designers/asta-barrington/" target="_self">Asta Barrington</a></li>
<li><a href="/en/designers/bessie-johanson/" target="_self">Bessie Johanson</a></li>
<li><a href="/en/designers/bjorn-berg/" target="_self">Björn Berg</a></li>
<li><a href="/en/designers/blubellgray/" target="_self">Blubellgray</a></li>
<li><a href="/en/designers/cornelia-waldersten-arfors/" target="_self">Cornelia Waldersten Årfors</a></li>
<li><a href="/en/designers/clare-jordan/" target="_self">Clare jordan</a></li>
<li><a href="/en/designers/ella-doran/" target="_self">Ella Doran</a></li>
<li><a href="/en/designers/ingrid-vang-nyman/" target="_self">Ingrid Vang Nyman</a></li>
<li><a href="/en/designers/lush-designs/" target="_self">Lush designs</a></li>
<li><a href="/en/designers/michael-angove/" target="_self">Michael Angove</a></li>
<li><a href="/en/designers/sam-pickard/" target="_self">Sam Pickard</a></li>
<li><a href="/en/designers/tina-backman/" target="_self">Tina Backman</a></li>
<li><a href="/en/designers/victoria-amp-albert-museum/" target="_self">Victoria &amp; Albert Museum</a></li>
<li><a href="/en/designers/ulrica-hydman-vallien/" target="_self">Ulrica Hydman Vallien</a></li></ul></li>
<li><a href="/en/bespoke/" class="topoff" target="_self">Bespoke</a>
<ul class="fix-z-index">
<li><a href="/en/bespoke/bespoke/" target="_self">Bespoke</a></li>
<li><a href="/en/bespoke/display/" target="_self">Display</a></li></ul></li>
<li><a href="/en/news/" class="topoff" target="_self">News</a></li>
<li><a href="/en/press/" class="topoff" target="_self">Press</a></li>
<li><a href="/en/information/about-ary-trays/" class="topoff" target="_self">Information</a>
<ul class="fix-z-index">
<li><a href="/en/information/about-ary-trays/" target="_self">About Ary Trays</a></li>
<li><a href="/en/information/product-information/" target="_self">Product Information</a></li>
<li><a href="/en/information/delivery-information/" target="_self">Delivery Information</a></li>
<li><a href="/en/information/trade-shows/" target="_self">Trade Shows</a></li>
<li><a href="/en/information/iso-14001-certificate/" target="_self">ISO 14001 Certificate</a></li></ul></li>
<li><a href="/en/contact/" class="topoff" target="_self">Contact</a></li></ul>
<div class="searchBar">
<img src="images/searchbar.png" alt="" />
<input name="tbxTopSearch" type="text" id="tbxTopSearch" class="tbxon" onkeydown="if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {__doPostBack(&#39;btnTopSearch&#39;,&#39;&#39;);return false;}} else {return true}; " />
<input type="submit" name="btnTopSearch" value="" id="btnTopSearch" class="btn" />
<input type="hidden" name="TBWE2_ClientState" id="TBWE2_ClientState" />
</div>
</div>
<div id="Content">
<!-------------------多图切换------------------->
<div>
<ul id="slideshow" style="width:890px; height:455px; overflow:hidden; padding:0; margin:0; list-style:none;">
<li class="slide"><a href="index.html" target="_self"><img src="images/1252036977.jpg" alt="" /></a></li>
<li class="slide"><a href="index.html" target="_self"><img src="images/126118383.jpg" alt="" /></a></li>
<li class="slide"><a href="index.html" target="_self"><img src="images/611151394.jpg" alt="" /></a></li>
</ul>
</div>
<!-------------------下部------------------->
<div style="padding-top:10px;">
<div id="ctl08_divHtml" style="float:left;">
<table style="width: 100%;" border="0">
<tr>
<td align="left" valign="top">
<h1>blabla<span style="white-space: pre;"> </span></h1>
<br />
<p style="text-align: justify;">&Aring;ry&nbsp;have been manufacturing <strong>birch wood trays</strong> at the original site in Sweden for over 60 years. We have always invested in the best raw materials with the highest environmental credentials and we continue to innovate whilst retaining <strong>hand crafted</strong> techniques.</p>
<p style="text-align: justify;">&Aring;ry&nbsp;Trays are individually hand made from the finest <strong>Scandinavian birch wood</strong>. Specifically sourced for its fine grain and rare width - the trays have no joins and are made from single sheets of birch so providing a high quality finish and&nbsp;longevity of use. Hygiene is an important consideration for trays because they are used with food, therefore all our trays are dishwasher safe.</p>
</td>
<td style="width: 20px;"><span style="white-space: pre;"> </span></td>
<td valign="top">
<h1 style="text-align: center;"><a href="index.html">See us at</a></h1>
<p><a href="index.html"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/maison_et_objet.jpg" alt="" width="115" height="115" /><br /></a></p>
<p><a href="index.html"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/ambiente_logo.jpg" alt="" width="150" height="50" /></a></p>
<p><br /><a href="index.html"><img src="images/2014_showlogo_dates.jpg" alt="" width="150" height="63" /></a></p>
<p>&nbsp;</p>
<p><a style="text-decoration: underline;" href="index.html"><img style="display: block; margin-left: auto; margin-right: auto;" src="images/72.jpg" alt="" width="75" height="123" /></a></p>
<h3 style="text-align: center;"><span style="color: #888888;">LONDON</span></h3>
</td>
<td style="width: 20px;">&nbsp;</td>
<td style="width: 250px;" align="left" valign="top">
<h1><a href="index.html">NEWS</a></h1>
<p>&nbsp;</p>
<p><a href="index.html">Collection from&nbsp;Sam Pickard</a></p>
<img src="images/bild_2.jpg" alt="" width="350" height="215" /><br /></td>
</tr>
</tbody>
</table>
<div style="clear:both;"></div>
</div>
<div style="clear:both;"></div>
</div>
<!--/ ******************* END ******************* /-->
</div>
<div id="InnerFooter">
<div class="Inner">
<div class="Right">
© Åry Trays
</div>
<div cl        </div>NDIVIDUALLY HAND CRAFTED FROM SCANDINAVIAN BIRCH WOOD
</div>
</div>
</div>
<div id="Footer">
<a href="/en/information/terms-and-conditions/">TERMS & CONDITIONS</a> | 
<a href="/en/information/privacy-policy/">PRIVACY POLICY</a> | 
<a href="/en/sitemap/">SITE MAP</a>
<br />Design by EaK Design
</div>
<!-------------------登陆模块------------------->
<div  id="myModal1" class="reveal-modal">
	<h1>Login</h1>
            <p><strong>Enter your e-mailaddress and password to login.</strong></p>
            <table style="margin:50px 0 0 60px;">
                <tr>
                    <td align="right" style="padding-bottom:5px;"><span style="color:#f00;">*</span>Email:</td>
                    <td width="10px">&nbsp;</td>
                    <td style="padding-bottom:5px;"><input name="tbxLoginEmail" type="text" id="tbxLoginEmail" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right"><span style="color:#f00;">*</span>Password:</td>
                    <td width="10px">&nbsp;</td>
                    <td><input name="tbxLoginPassword" type="password" id="tbxLoginPassword" onkeydown="if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {__doPostBack(&#39;btnLogin&#39;,&#39;&#39;);return false;}} else {return true}; " style="width:250px;" /></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td style="padding:10px 0;"><a href='/url/tradelogin.aspx?l1=2&iframe=true&width=430&height=280&e1=recovery'>Forgotten your login details?</a></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td><input type="submit" name="btnLogin" value="Submit" id="btnLogin" /></td>
                </tr>
            </table>
	<a class="close-reveal-modal">×</a> 
</div>
<!-------------------注册模块------------------->
<div  id="myModal2" class="reveal-modal">
<h1>Register</h1>
            <table style="margin:0 0 0 20px; width:380px; float:left;">
                <tr>
                    <td align="right" >
                        <span style="color:#f00;">*</span>Name:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxName" type="text" id="tbxName" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right">
                        <span style="color:#f00;">*</span>Company:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxCompany" type="text" id="tbxCompany" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right" >Jobtitle:</td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxJobtitle" type="text" id="tbxJobtitle" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right" >
                       
                        <span style="color:#f00;">*</span>Address:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxAddress1" type="text" id="tbxAddress1" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right">
                        <span style="color:#f00;">*</span>Country:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxCountry" type="text" id="tbxCountry" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right" >
                        <span style="color:#f00;">*</span>Email:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td><input name="tbxEmail" type="text" id="tbxEmail" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td align="right" >
                        <span style="color:#f00;">*</span>Telephone:
                    </td>
                    <td width="10px">&nbsp;</td>
                    <td ><input name="tbxTelephone" type="text" id="tbxTelephone" style="width:250px;" /></td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td><input type="submit" name="btnLogin" value="Submit" id="Submit1" /></td>
                </tr>
            </table>
            <a class="close-reveal-modal">×</a> 
</div>
</body>
</html>
