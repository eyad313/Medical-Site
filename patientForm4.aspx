<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="patientForm4.aspx.cs" Inherits="WebApplication2.patientForm4" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Div1" runat="server">

        <!-- <asp:Label ID="Label9" runat="server"></asp:Label> -->

        <div class="card card-register mx-auto mt-5">
            <div class="card-header">Personal Information (Patient)</div>
            <div class="card-body">

                <asp:TextBox ID="ssn" runat="server" class="form-control " placeholder="SSN"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="ssn" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^[0-9]{10}$" ControlToValidate="ssn" ForeColor="Red" ErrorMessage="Invalid ssn." />

                <asp:TextBox ID="fname" runat="server" class="form-control " placeholder="First Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname" runat="server" />

                <asp:TextBox ID="mname" runat="server" class="form-control " placeholder="Middle Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="mname" runat="server" />

                <asp:TextBox ID="lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="lname" runat="server" />

                <asp:TextBox ID="phone" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="phone" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$" ControlToValidate="phone" ForeColor="Red" ErrorMessage="Invalid phone number." />

                <asp:TextBox ID="txtDatePicker" runat="server" class="form-control" placeholder="Date of birth"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDatePicker" runat="server" />

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
                <br />
                <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>

                <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="gender" runat="server" />

                <hr />
                <asp:Button ID="Button2" runat="server" Text="Save" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Button1_Click" />
            </div>
        </div>
    </div>

</asp:Content>

