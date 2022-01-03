
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="css/style2.css">  
</head>
<body>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<title> Handicrafts Login </title>
</head>
<body>
  <body>
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>LOGIN</h3>
            <p>Please enter your credentials to login.</p>
          </div>
        </div>
        <form action="/auth" class="login-form" method="post" >
          <input type="text" name="username" placeholder="username"/>
          <input type="password" name="password" placeholder="password"/>
          <button>login</button>
          <p class="message">Not registered? <a href="#">Create an account</a></p>
          <p class="message"><a href="forgot">ForgotPassword ?</a></p>
        </form>
      </div>
    </div>
</body>
</body>
</html>
</body>
</html>