<%@ Page Language="C#" masterpagefile="~/MasterPage.master" AutoEventWireup="true" CodeFile="bespoke.aspx.cs" Inherits="bespoke" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="bespoke">
    <img src="<%=bespoke1.imageUrl %>" />
    <h1>BESPOKE</h1>
    <%=bespoke1.contentText %>
   </div>


</asp:Content>