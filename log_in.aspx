<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="log_in.aspx.cs" Inherits="WebApplication2.log_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>SB Admin - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>

  <!-- Custom styles for this template-->
  <link href="css/Design3.css" rel="stylesheet"/>

</head>

<body style="background-image: url('medical-techonlogy-conceptsmart-doctor-hand-working-with-modern-in-picture-id698602794-compressor.jpg'); background-size: cover;">
    
  <div class="container">
    <div style="opacity: 0.9;" class="card card-login mx-auto mt-5">
      <div style="background-color:white;" class="card-header">Login</div>
      <div class="card-body">
        <form runat="server">
          <div class="form-group">
            
                 <asp:TextBox ID="username1"  Name="username" runat="server" class="form-control " placeholder="Username" autofocus="autofocus" ></asp:TextBox>
                    
           
            
          </div>
          <div class="form-group">
            
             <asp:TextBox ID="password1" TextMode="Password" runat="server" class="form-control" placeholder="Password" ></asp:TextBox>
             
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <asp:CheckBox ID="remember" runat="server" />
                Remember Password
              </label>
            </div>
          </div>
            <asp:Button ID="Button0" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="Button0_Click1"  />
          
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="sign_up1.aspx">Register an Account</a>
          <a class="d-block small" href="forgot-password.aspx">Forgot Password?</a>
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
