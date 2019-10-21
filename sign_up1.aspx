<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign_up1.aspx.cs" Inherits="WebApplication2.sign_up1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>SB Admin - Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template-->
    <link href="css/Design3.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body style="background-image: url('medical-techonlogy-conceptsmart-doctor-hand-working-with-modern-in-picture-id698602794-compressor.jpg'); background-size: cover;">

    <div class="container">
        <div style="opacity: 0.9;" class="card card-register mx-auto mt-5">
            <div class="card-header">Register an Account</div>
            <div class="card-body">
                <form runat="server">
                    <div class="form-group">
                        <div class="form-row" style="margin-bottom: -1.5rem;">
                            <div class="col-md-6">
                                <div class="form-label-group">
                                    <asp:TextBox ID="username" Name="username" runat="server" class="form-control " placeholder="Username" autofocus="autofocus" AutoPostBack="true" OnTextChanged="username_TextChanged"></asp:TextBox>
                                    <label for="username">Username</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="username"
                                        runat="server" Display="Dynamic" />
                                    <asp:Label ID="Label9" runat="server" ForeColor="red"></asp:Label>
                                </div>

                            </div>

                            <div class="col-md-6">

                                <asp:DropDownList ID="type_user" runat="server" class="form-control" Style="height: 50px">
                                    <asp:ListItem Text="Select type" Value="select" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Patient" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Doctor" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Lab" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RangeValidator ID="rvclass" runat="server" ForeColor="Red" ControlToValidate="type_user"
                                    ErrorMessage="Enter your type" MaximumValue="3"
                                    MinimumValue="1" Type="Integer"></asp:RangeValidator>

                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <asp:TextBox ID="email" runat="server" class="form-control " placeholder="Email"></asp:TextBox>
                            <label for="email">Email address</label>
                            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="email" runat="server" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="email" ForeColor="Red" ErrorMessage="Invalid Email Address" />
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="form-row" style="margin-bottom: -1.5rem;">
                            <div class="col-md-6">
                                <div class="form-label-group">
                                    <asp:TextBox ID="password" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                                    <label for="password">Password</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="password"
                                        runat="server" />
                                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="^.*(?=.{8,})(?=.*[\d])(?=.*[\W]).*$"
                                        ControlToValidate="password" ForeColor="Red" ErrorMessage="Invalid password (contains at least 8 characters,at least one digit and at least one special character)." />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label-group">
                                    <asp:TextBox ID="re_password" runat="server" TextMode="Password" class="form-control" placeholder="ConfirmPassword"></asp:TextBox>
                                    <label for="re_password">Confirm password</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="re_password"
                                        runat="server" />
                                    <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="password"
                                        ControlToValidate="re_password" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="dvCaptcha" style="margin-bottom: 1rem;">
                    </div>
                    <asp:TextBox ID="txtCaptcha" runat="server" Style="display: none" />
                    <asp:RequiredFieldValidator ID="rfvCaptcha" ErrorMessage="Captcha validation is required." ControlToValidate="txtCaptcha"
                        runat="server" ForeColor="Red" Display="Dynamic" />

                    <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="Button1_Click" />

                    <a style="text-align: center;" class="d-block small mt-2" href="log_in.aspx">Login Page</a>
                    <a style="text-align: center;" class="d-block small" href="forgot-password.aspx">Forgot Password?</a>

                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async="async" defer="defer"></script>
    <script type="text/javascript">
        var onloadCallback = function () {
            grecaptcha.render('dvCaptcha', {
                'sitekey': '<%=ReCaptcha_Key %>',
            'callback': function (response) {
                $.ajax({
                    type: "POST",
                    url: "sign_up1.aspx/VerifyCaptcha",
                    data: "{response: '" + response + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var captchaResponse = jQuery.parseJSON(r.d);
                        if (captchaResponse.success) {
                            $("[id*=txtCaptcha]").val(captchaResponse.success);
                            $("[id*=rfvCaptcha]").hide();
                        } else {
                            $("[id*=txtCaptcha]").val("");
                            $("[id*=rfvCaptcha]").show();
                            var error = captchaResponse["error-codes"][0];
                            $("[id*=rfvCaptcha]").html("RECaptcha error. " + error);
                        }
                    }
                });
            }
        });
        };
     </script>
</body>
</html>
