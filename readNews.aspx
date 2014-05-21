<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="readNews.aspx.cs" Inherits="readNews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="newsBox">
        <span class="newsTitle"><%=news.Title %></span>
        <span class="newsDate"><%=news.Date.ToShortDateString() %></span><br /><br />
        <span><%=news.Body %></span><br />

    </div>
    
</asp:Content>

