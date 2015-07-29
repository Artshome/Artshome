<%@ Page Language="C#" masterpagefile="~/MasterPage.master"AutoEventWireup="true" CodeFile="tradeshow.aspx.cs" Inherits="tradeshow" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<p class="tradeshow">We will be at</p>

 <%
     foreach (Table_TradeShow tradeshow in tradeshowlist)
     {
      %>
        <div class="tsTable">
        <ul>
        <li><strong><%=tradeshow.name %></strong></li>
        <li><strong><%=tradeshow.date.ToString("MM/dd/yyyy")+"~"+tradeshow.date_end.ToString("MM/dd/yyyy") %></strong></li>
        <li><strong><%=tradeshow.location %></strong></li>
        <li><img class="tsImg" src="<%=tradeshow.image %>" alt=" " /></li>
        <li>More details about</li>
        <li><a href="<%=tradeshow.link %>"><%=tradeshow.name %></a></li>
        </ul>
        </div>
    <%
     }
  %>

</asp:Content>
