<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Main page_d.Master" AutoEventWireup="true" CodeBehind="ReportCreation.aspx.cs" Inherits="WebApplication2.ReportCreation" %>

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
        .mystyle {
            display: unset;
        }

        textarea {
            border-radius: 5px;
        }
    </style>


    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card card-register mx-auto mt-1">
            <div class="card-header">Lab test request form</div>
            <div class="card-body">
                <label style="font-size: 1rem; font-weight: 500;">Lab of choice:</label>&nbsp
                <asp:DropDownList ID="lab_name" runat="server" CssClass="form-control" Style="width: 489.35px;">
                    <asp:ListItem Text="Select lab" Value="select" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <hr />

                <h6>Patient Details</h6>
                <hr />
                <asp:Label runat="server">Full name:</asp:Label>&nbsp
                    <asp:TextBox ID="patient_name" runat="server" class="form-control-plaintext mb-2" disabled="disabled" Style="width: 517.42px; display: unset;"></asp:TextBox>

                <asp:Label runat="server" Style="width: 93.08px;">Date of birth:</asp:Label>&nbsp
                    <asp:TextBox ID="dob" runat="server" class="form-control-plaintext mb-2" disabled="disabled" Style="width: 300px;"></asp:TextBox>
                <asp:Label Style="width: 55.22px;" runat="server">Gender:</asp:Label>&nbsp
                    <asp:TextBox Style="width: 100px;" ID="gender" runat="server" class="form-control-plaintext mb-2" disabled="disabled"></asp:TextBox>

                <h6>Referral Details</h6>
                <hr />

                <asp:Label Style="width: 82.14px;" runat="server">Doctor's ID:</asp:Label>&nbsp
                    <asp:TextBox Style="width: 507.09px;" ID="doctor_id" runat="server" class="form-control-plaintext mb-2" disabled="disabled"></asp:TextBox>


                <asp:Label runat="server">Full name:</asp:Label>&nbsp
                    <asp:TextBox ID="doctor_name" runat="server" class="form-control-plaintext mb-2" Style="width: 517.42px; display: unset;" disabled="disabled"></asp:TextBox>


                <asp:Label runat="server">Phone number:</asp:Label>&nbsp
                    <asp:TextBox ID="phone_number" runat="server" class="form-control-plaintext mb-2" Style="display: unset; width: 481.34px;" disabled="disabled"></asp:TextBox>

                <asp:Label runat="server">Required tests:</asp:Label>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="TestSelect">Click here to make selections for the tests to perform</asp:LinkButton>
                <textarea id="TextArea4" runat="server" style="width: 100%;" rows="4" required="required" disabled="disabled" class="mb-2"></textarea>


                <h6>Sample details</h6>
                <hr />
                <asp:Label runat="server">Sample Type:</asp:Label>&nbsp
                    <asp:TextBox ID="sample_type" runat="server" class="form-control mb-2" Style="display: unset; width: 496.29px;" required="required"></asp:TextBox>

                <asp:Label runat="server">Date of sample collection:</asp:Label>&nbsp
                    <asp:TextBox ID="txtDatePicker" runat="server" class="form-control mb-2" required="required" Style="display: unset; width: 406.71px;"></asp:TextBox>


                <h6>Clinical details</h6>
                <hr />
                <asp:Label runat="server">Results of previous related tests (if applicable):</asp:Label>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="PrevTestAdd">Click here to add or edit tests</asp:LinkButton>
                <textarea id="TextArea3" runat="server" style="width: 100%;" rows="4" disabled="disabled" class="mb-2"></textarea>


                <asp:Label runat="server">Family history:</asp:Label>&nbsp
                    <textarea id="TextArea1" runat="server" style="width: 100%;" rows="4" required="required"></textarea>

                <asp:Label runat="server">Reason of referral:</asp:Label>&nbsp
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control mb-2" Style="display: unset; width: 461.34px;" required="required"></asp:TextBox>

                <asp:Label runat="server">Recently taken medications that could affect test results:</asp:Label>&nbsp
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control mb-2" Style="display: unset;"></asp:TextBox>

                <asp:Label runat="server">Additional notes:</asp:Label>
                <textarea id="TextArea2" runat="server" style="width: 100%;" rows="4" class="mb-2"></textarea>

                <p>
                    <asp:Button class="btn btn-info" Style="color: white; background-color: #007bff; width: auto; height: auto;" ID="Button1" runat="server" Text="Cancel" />
                    &nbsp
                        <asp:Button ID="Button2" runat="server" Text="Confirm request" class="btn btn-info" Style="color: white; background-color: #007bff;" OnClick="Confirm" />
                </p>
            </div>
        </div>
        <div class="card-footer small text-muted">
                <label runat="server" id="message"></label>
        </div>
    </div>
</asp:Content>
