<%@ Page Title="" Language="C#" MasterPageFile="~/edit_info.Master" AutoEventWireup="true" CodeBehind="edit_p.aspx.cs" Inherits="WebApplication2.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">  
        $(function () {
            $('#<%= txtDatePicker.ClientID %>').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
    })
    </script>
    <style>
        .vertical-menu {
            width: 250px;
            height: 300px;
            overflow-y: auto;
        }

            .vertical-menu a {
                background-color: #eee;
                color: black;
                display: block;
                padding: 12px;
                text-decoration: none;
            }

                .vertical-menu a:hover {
                    background-color: #ccc;
                }

                .vertical-menu a.active {
                    background-color: #000000;
                    color: white;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Style="color: green;"></asp:Label>
    <div class="card card-register mx-auto mt-1">
        <div class="card-header">&nbsp;Edit Personal Information (Patient)</div>
        <div class="card-body">

            <asp:TextBox ID="username" Name="username" runat="server" class="form-control" placeholder="Username" autofocus="autofocus" AutoPostBack="true" OnTextChanged="username_TextChanged1"></asp:TextBox>

            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="username"
                runat="server" />

            <asp:Label ID="Label9" runat="server" Style="color: red;"></asp:Label>

            <asp:TextBox ID="email" runat="server" class="form-control" placeholder="E-mail"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="email" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid email address." />

            <asp:TextBox ID="ssn" runat="server" class="form-control" placeholder="SSN"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="ssn" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^[0-9]{10}$" ControlToValidate="ssn" ForeColor="Red" ErrorMessage="Invalid ssn." />

            <asp:TextBox ID="fname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname" runat="server" />

            <asp:TextBox ID="lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="lname" runat="server" />

            <asp:TextBox ID="phone" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="phone" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$" ControlToValidate="phone" ForeColor="Red" ErrorMessage="Invalid phone number." />

            <asp:TextBox ID="txtDatePicker" runat="server" class="form-control" placeholder="data of birth"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDatePicker" runat="server" />

            <asp:DropDownList ID="blood_type" runat="server" class="form-control">
                <asp:ListItem Text="Select type" Value="select" Selected="True"></asp:ListItem>
                <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                <asp:ListItem Text="AB+" Value="AB+"></asp:ListItem>
                <asp:ListItem Text="AB-" Value="AB-"></asp:ListItem>
                <asp:ListItem Text="O+" Value="O+"></asp:ListItem>
                <asp:ListItem Text="O-" Value="O-"></asp:ListItem>
            </asp:DropDownList>
            <br />




            <hr />
            <asp:Button ID="Button1" runat="server" Text="Back" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Button1_Click" />

            <asp:Button ID="Button2" runat="server" Text="Save" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Button2_Click" />
        </div>
    </div>


</asp:Content>

