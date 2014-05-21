<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="paragraph">
        <br /><br />
        <img class="infoIcon" src="images/3247.png" alt="address" />
        <span><%=info.ContactAddress %></span>
        <br />
        <img class="infoIcon" src="images/3289.png" alt="Attn" />
        <span><%=info.ContactRole %></span>
        <br />
        <img class="infoIcon" src="images/4932.png" alt="Tel" />
        <span><%=info.ContactPhone %></span>
        <br />
        <img class="infoIcon" src="images/phone.jpg" alt="Mobile" />
        <span><%=info.ContactMobie %></span>
        <br />
        <img class="infoIcon" src="images/skype.png" alt="skype" />
        <span><%=info.ContactSkype %></span>
        </div>
</asp:Content>

