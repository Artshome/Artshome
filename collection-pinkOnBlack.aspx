<%@ Page Language="C#" masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="collection-pinkOnBlack.aspx.cs" Inherits="Default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a[rel*=lightbox]').lightBox();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="paragraph">
        <h1>详细的某类Pink on back。。</h1>
	    <span>静纯应该没有弄错了。。</span>
    </div>
    <div>
	  <table class="imgset1 collectionTable clearfix">
        <tr>
        <th>VISUAL</th>
        <th>SIZE</th>
        <th>CODE</th>
        </tr>
        
      <tr>
        <td class="td1">
			<p><a href="images/1.jpg" rel="lightbox"><img src="images/1.jpg" alt="" /></a></p></td>            
            <td class="td2">Taylor Swift</td>
            <td class="td1">Taylor Swift1</td>
       </tr>
            
       <tr>
            <td class="td1"> 
			<p><a href="images/1.jpg" rel="lightbox"><img src="images/1.jpg" alt="" /></a></p></td>
            <td class="td2">Taylor Swift</td>
            <td class="td1">Taylor Swift2</td>
       </tr>
            
       <tr>
            <td class="td1"> 
			<p><a href="images/1.jpg" rel="lightbox"><img src="images/1.jpg" alt="" /></a></p></td>
            <td class="td2">Taylor Swift</td>
            <td class="td1">Taylor Swift3</td>
        </tr>
    </table>
	</div>
	

</asp:Content>