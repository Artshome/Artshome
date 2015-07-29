<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%foreach(Table_News _news in newslist){ %>
    <div class="newsBox">
        <a href="<%="readNews.aspx?newsid="+_news.Id.ToString() %>" class="newsTitle"><%=_news.Title %></a>
        <span class="newsDate"><%=_news.Date.ToString("MM/dd/yyyy") %></span><br />
        <span><%=_news.Body.Length>200?_news.Body.Substring(0, 200)+"...":_news.Body %></span><br />
        <hr style="width:100%;border-style:dashed;border-width:1px"/>
    </div>
    <%} %>
</asp:Content>

