<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="WebApplication2.forgot_password" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Forgot Password</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/Design3.css" rel="stylesheet">

</head>

<body class="bg-dark">
    

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Reset Password</div>
      <div class="card-body">
        <div class="text-center mb-4">
            <asp:Label ID="heading" runat="server" class="h4"></asp:Label>
          <br />
            <asp:Label ID="paragraph" runat="server"></asp:Label>
        </div>
        <form runat="server">
          <div class="form-group">
            <div class="form-label-group">
              
              <input runat="server" type="email" id="inputEmail" class="form-control" placeholder="Enter email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Enter email address</label>
            </div>
          </div>
          <asp:Button class="btn btn-primary btn-block" onclick="Reset" ID="Button1" runat="server" Text="Send Password" />
          <%--<a class="btn btn-primary btn-block" onclick="Reset">Send Password</a>--%>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="sign_up1.aspx">Register an Account</a>
          <a class="d-block small" href="log_in.aspx">Login Page</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        
</body>

</html>

