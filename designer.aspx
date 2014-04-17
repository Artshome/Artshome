<%@ Page Language="C#"  masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="designer.aspx.cs" Inherits="designer" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<hr class="hr1" />
<div class="designer">
    <h1>ANNA VIKTORSSON</h1>
    <img src="images/1.jpg" width="300" height="150" style="float:right"/><br/>
    <p> </p>
    <span>
    Swedish designer Anna Viktorsson studied<br/> 
	BA(hons) Design at HDK in Gothenburg and at<br/>
	University of the Arts in London. Anna is driven<br/> 
	by a desire to create design that tells a story.<br/> 
	Her designs have a strong Scandinavian feel and<br/> 
	are recognised by bold colours and playfulness.<br/>
    </span>
</div>
<hr class="hr1" />
	
<div class="holder">
		<ul class="imageHolder">
			<li><a href="collection-pinkOnBlack.aspx"><img src="images/PARIS.jpg" alt="" align="absmiddle"/></a><p>PARIS</p></li>
			<li><a href="collections.aspx"><img src="images/LONDON.jpg" alt="" align="absmiddle"/></a><p>LONDON</p></li>
            <li><a href="collections.aspx"><img src="images/NY.jpg" alt="" align="absmiddle"/></a><p>NEW YORK</p></li>
			<li><a href="collections.aspx"><img src="images/ROYALGUARD.jpg" alt="" align="absmiddle"/></a><p>ROYAL GUARD</p></li>
			<li><a href="collections.aspx"><img src="images/STOCKHOLM.jpg" alt="" align="absmiddle"/></a><p>STOCKHOLM</p></li>
		</ul>
    </div>
</asp:Content>