<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="WebApplication2.WelcomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    p{
        font-size:x-large;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large"></asp:Label>
    <hr>
    <p > <asp:LinkButton style="color:black;" ID="LinkButton1" runat="server" OnClick="complete_registration_Click">Click here to proceed with the registration process</asp:LinkButton></p>
</asp:Content>
