<%@ Page Title="" Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="DiagnosisCreation.aspx.cs" Inherits="WebApplication2.DiagnosisCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Diagnosis
            </div>
            <div class="card-body">
                <pre><asp:TextBox ID="TextBox5" runat="server" disabled="disabled"></asp:TextBox>   <asp:TextBox ID="TextBox1" runat="server" disabled="disabled"></asp:TextBox>    <asp:TextBox ID="TextBox2" runat="server" disabled="disabled"></asp:TextBox>    <asp:TextBox ID="TextBox6" runat="server" disabled="disabled"></asp:TextBox>    <asp:TextBox ID="TextBox3" runat="server" placeholder="Complain" autofocus="autofocus" MaxLength="30" required="required"></asp:TextBox></pre>
                <hr />
                <textarea id="TextArea1" rows="10" style="width: 100%;" runat="server" required="required" class="mb-2"></textarea>
                <p>
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button2" runat="server" Text="Back"/>
                    &nbsp;
                    <asp:Button OnClick="Confirm" class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button1" runat="server" Text="Create" />
                    &nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Request lab report" OnClick="Report_Create" class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" /></p>
            </div>

        </div>

    



</asp:Content>
