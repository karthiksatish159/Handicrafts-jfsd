
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.example.demo.Backend.Backend123,com.example.demo.Model.product,java.util.*,java.io.*,org.springframework.beans.factory.annotation.Autowired" %>
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
<title> Handicrafts Reset Password </title>
</head>
<body>
  <body>
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h3>Forgot Password</h3>
            <p>Please enter your New password.</p>
          </div>
        </div>
        <form action="/sendemail" class="login-form" method="post" >
          <input type="text" name="username" placeholder="xyz@gmail.com"/>
          <button>Reset</button>
        </form>
      </div>
    </div>
</body>
</body>
</html>
</body>
</html>