<%@ Page Title="" Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="edit_d.aspx.cs" Inherits="WebApplication2.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Style="color: green;"></asp:Label>

    <div class="card card-register mx-auto mt-1">
        <div class="card-header">Edit Personal Information (Doctor)</div>
        <div class="card-body">

            <asp:TextBox ID="username" Name="username" runat="server" class="form-control " placeholder="Username" autofocus="autofocus" AutoPostBack="true" OnTextChanged="username_TextChanged"></asp:TextBox>

            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="username"
                runat="server" />

            <asp:Label ID="Label9" runat="server" Style="color: red;"></asp:Label>




            <asp:TextBox ID="email" runat="server" class="form-control " placeholder="E-mail"></asp:TextBox>

            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red"
                ControlToValidate="email" runat="server" />

            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid email address." />



            <br />



            <%--<div class="form-label-group">--%>
            <asp:TextBox ID="ssn" Name="SSN" runat="server" class="form-control " placeholder="SSN"></asp:TextBox>
            <%--<label for="SSN">ssn</label>--%>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="ssn" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^[0-9]{10}$" ControlToValidate="ssn" ForeColor="Red" ErrorMessage="Invalid ssn." />

            <%-- </div>--%>




            <asp:TextBox ID="fname" runat="server" class="form-control " placeholder="First Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="fname" runat="server" />

            <asp:TextBox ID="lname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="lname" runat="server" />

            <asp:TextBox ID="phone" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="phone" runat="server" /><asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$" ControlToValidate="phone" ForeColor="Red" ErrorMessage="Invalid phone number." />

            <asp:DropDownList ID="specialization1" runat="server" class="form-control">
                <asp:ListItem Text="Select type" Value="select" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Internal Medicine" Value="Internal Medicine"></asp:ListItem>
                <asp:ListItem Text="Endocrinology" Value="Endocrinology"></asp:ListItem>
                <asp:ListItem Text="Cardiology" Value="Cardiology"></asp:ListItem>
                <asp:ListItem Text="Gastroenterology" Value="Gastroenterology "></asp:ListItem>
                <asp:ListItem Text="Obstetrics and Gynecology" Value="Obstetrics and Gynecology"></asp:ListItem>
                <asp:ListItem Text="Ophthalmology" Value="Ophthalmology"></asp:ListItem>
                <asp:ListItem Text="Neurology" Value="Neurology"></asp:ListItem>
                <asp:ListItem Text="nephrology" Value="nephrology"></asp:ListItem>
                <asp:ListItem Text="Oncology" Value="Oncology"></asp:ListItem>
                <asp:ListItem Text="Allergy and immunology" Value="Allergy and immunology"></asp:ListItem>
                <asp:ListItem Text="Hematology" Value="Hematology"></asp:ListItem>
                <asp:ListItem Text="General Practitioner" Value="General Practitioner"></asp:ListItem>
                <asp:ListItem Text="Pediatrics" Value="Pediatrics"></asp:ListItem>
                <asp:ListItem Text="(Ear, nose and throat (ENT)" Value="(Ear, nose and throat (ENT)"></asp:ListItem>
                <asp:ListItem Text="Urology" Value="Urology"></asp:ListItem>
                <asp:ListItem Text="Dermatology" Value="Dermatology"></asp:ListItem>
                <asp:ListItem Text="Psychiatry" Value="Psychiatry"></asp:ListItem>
                <asp:ListItem Text="Dentistry" Value="Dentistry"></asp:ListItem>
                <asp:ListItem Text="Endocrinology" Value="Endocrinology"></asp:ListItem>
                <asp:ListItem Text="Hepatology" Value="Hepatology"></asp:ListItem>
                <asp:ListItem Text="plastic surgery" Value="plastic surgery"></asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:TextBox ID="unionnumber" runat="server" class="form-control" placeholder="Union Number"></asp:TextBox><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="unionnumber" runat="server" />

            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6">
                        <asp:DropDownList ID="City" runat="server" AutoPostBack="True" class="form-control" OnSelectedIndexChanged="City_SelectedIndexChanged">
                            <asp:ListItem Text="Select City" Value="select"></asp:ListItem>
                            <asp:ListItem Text="عمان" Value="1"></asp:ListItem>
                            <asp:ListItem Text="الزرقاء" Value="2"></asp:ListItem>
                            <asp:ListItem Text="معان" Value="3"></asp:ListItem>
                            <asp:ListItem Text="اربد" Value="4"></asp:ListItem>
                            <asp:ListItem Text="المفرق" Value="5"></asp:ListItem>
                            <asp:ListItem Text="البلقاء" Value="6"></asp:ListItem>
                            <asp:ListItem Text="الطفيلة" Value="7"></asp:ListItem>
                            <asp:ListItem Text="الكرك" Value="8"></asp:ListItem>
                            <asp:ListItem Text="مأدبا" Value="9"></asp:ListItem>
                            <asp:ListItem Text="جرش" Value="10"></asp:ListItem>
                            <asp:ListItem Text="عجلون" Value="11"></asp:ListItem>
                            <asp:ListItem Text="العقبة" Value="12"></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <br /><br />
                    <div class="col-md-6">
                        <asp:DropDownList ID="Area" runat="server" class="form-control">
                            <asp:ListItem Text="Select Area" Value="select"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <textarea placeholder="Full Address" id="address_doc" cols="20" rows="3" class="form-control" runat="server"></textarea><asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="address_doc" runat="server" />



            <hr />
            <asp:Button ID="Button1" runat="server" Text="Back" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Button1_Click" />

            <asp:Button ID="Button2" runat="server" Text="Save" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Button2_Click" />

        </div>
    </div>
</asp:Content>
