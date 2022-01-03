<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
    
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,200&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
<style>
.btn {
  border: none;
  font-family: 'Lato';
  font-size: inherit;
  color: inherit;
  background: none;
  cursor: pointer;
  padding: 25px 80px;
  display: inline-block;
  margin: 15px 30px;
  text-transform: uppercase;
  letter-spacing: 1px;
  font-weight: 700;
  outline: none;
  position: relative;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  transition: all 0.3s;
}

.btn:after {
  content: '';
  position: absolute;
  z-index: -1;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  transition: all 0.3s;
}

/* Pseudo elements for icons */
.btn:before {
  font-family: 'FontAwesome';
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  position: relative;
  -webkit-font-smoothing: antialiased;
}


/* Icon separator */
.btn-sep {
  padding: 25px 60px 25px 120px;
}

.btn-sep:before {
  background: rgba(0,0,0,0.15);
}

/* Button 1 */
.btn-1 {
  background: #3498db;
  color: #fff;
}

.btn-1:hover {
  background: #2980b9;
}

.btn-1:active {
  background: #2980b9;
  top: 2px;
}

.btn-1:before {
  position: absolute;
  height: 100%;
  left: 0;
  top: 0;
  line-height: 3;
  font-size: 140%;
  width: 60px;
}

/* Button 2 */
.btn-2 {
  background: #2ecc71;
  color: #fff;
}

.btn-2:hover {
  background: #27ae60;
}

.btn-2:active {
  background: #27ae60;
  top: 2px;
}

.btn-2:before {
  position: absolute;
  height: 100%;
  left: 0;
  top: 0;
  line-height: 3;
  font-size: 140%;
  width: 60px;
}

/* Button 3 */
.btn-3 {
  background: #e74c3c;
  color: #fff;
}

.btn-3:hover {
  background: #c0392b;
}

.btn-3:active {
  background: #c0392b;
  top: 2px;
}

.btn-3:before {
  position: absolute;
  height: 100%;
  left: 0;
  top: 0;
  line-height: 3;
  font-size: 140%;
  width: 60px;
}

/* Button 3 */
.btn-4 {
  background: #34495e;
  color: #fff;
}

.btn-4:hover {
  background: #2c3e50;
}

.btn-4:active {
  background: #2c3e50;
  top: 2px;
}

.btn-4:before {
  position: absolute;
  height: 100%;
  left: 0;
  top: 0;
  line-height: 3;
  font-size: 140%;
  width: 60px;
}

/* Icons */

.icon-cart:before {
  content: "\f07a";
}

.icon-heart:before {
  content: "\f55a";
}

.icon-info:before {
  content: "\f05a";
}

.icon-send:before {
  content: "\f1d8";
}

</style>
<body>
<%
String uname = (String) request.getSession().getAttribute("uname");
%>
 <div class="header">
      <div class="container">
        <div class="navbar">
          <div class="logo">
            <a href="index.html">
              <img src="images/logo.png" alt="" width="125px"
            /></a>
          </div>
          <nav>
            <ul id="MenuItems">
              <li><a href="/">Home</a></li>
              <li><a href="/producthome">Products</a></li>
              <li><a href="">About</a></li>
              <li><a href="">Contact</a></li>
              <li><a href="account.html">Account</a></li>
              <!-- TODo: 22:20 -->
            </ul>
          </nav>
          <a href="/myCart"
            ><img src="${pageContext.request.contextPath}/img/cart.png" alt="" width="30px" height="30px"
          /></a>
          <img
            src="images/menu.png"
            alt=""
            class="menu-icon"
            onclick="menutoggle()"
          />
        </div>
      </div>
    </div>

<a href="/selleradd"><button class="btn btn-3 btn-sep icon-heart">Add Products</button></a>
<a href="/sellerview"><button class="btn btn-4 btn-sep icon-send">View Added products</button></a>
<a href="/sellerchart"><button class="btn btn-4 btn-sep icon-send">View your insights</button></a>
</body>

</html>