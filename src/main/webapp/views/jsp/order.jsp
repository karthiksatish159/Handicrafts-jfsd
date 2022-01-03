<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>All Products - Red store</title>
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
    .button {
    display: block;
    width: 115px;
    height: 25px;
    background: black;
    padding: 15px;
    text-align: center;
    border-radius: 5px;
    color: orange;
    font-weight: bold;
    line-height: 5px;
}
*:focus { border: 0; outline: 0; }
.wrapper {
  margin: 50px auto;
  width: 100px;
}
.button-block {
  width: 70px;
  height: 70px;
  border-radius: 100%; /* TODO: prefix */
  margin: 0 auto;
  position: relative;
  display: block;
  position: relative;
  border: 35px solid #F0544E;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-border-radius: 100%;
  -moz-border-radius: 100%;
  box-sizing: border-box;
  -webkit-transition: border 600ms ease-in-out;
  -moz-transition: border 600ms ease-in-out;
  -ms-transition: border 600ms ease-in-out;
  -o-transition: border 600ms ease-in-out;
  transition: border 600ms ease-in-out;
}
.button-block button {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 30px;
  height: 30px;
  background: transparent;
  border: 0;
  margin: -15px 0 0 -15px;
  cursor: pointer;
}
.mark {
  background-color: #fff;
  position: absolute;
  height: 30px;
  width: 4px;
  display: block;
  top: 0;
  -webkit-transition: all 600ms ease-in-out;
  -moz-transition: all 600ms ease-in-out;
  -ms-transition: all 600ms ease-in-out;
  -o-transition: all 600ms ease-in-out;
  transition: all 600ms ease-in-out;
}
.mark.x  { 
  right: 14px; 
  transform:rotate(45deg); /* TODO: prefix */
}
.mark.xx { 
  left: 12px; 
  transform:rotate(-45deg); /* TODO: prefix */
}
.button-block.canceled  {
  border-width: 4px;
  border-color: #1ABC9C;
}
.button-block.canceled .mark { background-color: #1ABC9C; }
.button-block.canceled .mark.x {
  right: 5px;
  top: -3px;
  height: 35px;
}
.button-block.canceled .mark.xx {
  height: 15px;
  top: 15px;
  left: 5px;
}
    </style>
  </head>
  <body>
    <div class="container">
      <div class="navbar">
        <div class="logo">
          <a href="index.html">
            <img src="images/logo.png" alt="" width="125px"
          /></a>
        </div>
        <nav>
          <ul id="MenuItems">
            <li><a href="#">Home</a></li>
            <li><a href="/producthome">Products</a></li>
            <li><a href="">About</a></li>
            <li><a href="">Contact</a></li>
            <li><a href="/logout">Logout</a></li>
            <!-- TODo: 22:20 -->
          </ul>
        </nav>
    
        <img
          src="images/menu.png"
          alt=""
          class="menu-icon"
          onclick="menutoggle()"
        />
      </div>
    </div>

    <!-- Cart Items Details -->
    <div class="small-container cart-page">
      <table>
        <tr>
          <th>Product</th>
          <th>Quantity</th>
          <th>Status</th>
          <th>Cancel</th>
        </tr>
       
        <c:forEach var="product" items="${order1}">
        <tr>
          <td>
            <div class="cart-info">
              <img src="${product.image}" alt="" />
              <div>
                <p>${product.pname}</p>
                <br />
              </div>
            </div>
          </td>
          <td><input type="nunber" value="${product.count}" /></td>
          <td>${product.status}</td>
          <c:if test="${product.status=='On Process' }">
          <td><a href="cancel/${product.oid}"><div class="wrapper">
       
  <div class="button-block">
    <button type="button">
      <i class="mark x"></i>
      <i class="mark xx"></i>
    </button>
  </div>
</div></a></td>   </c:if>
        </tr>
		</c:forEach>
      </table>
      </div>
    </div>
    <!-- Footer -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="footer-col-1">
            <h3>Download Our App</h3>
            <p>
              Download App for Android <br />
              and ios mobile phone
            </p>
            <div class="app-logo">
              <img src="images/play-store.png" alt="" />
              <img src="images/app-store.png" alt="" />
            </div>
          </div>
          <div class="footer-col-2">
            <img src="images/logo-white.png" alt="" />
            <p>
              Lorem, ipsum dolor sit amet consectetur <br />adipisicing elit.
              Porro, eum?
            </p>
          </div>
          <div class="footer-col-3">
            <h3>Useful Links</h3>
            <ul>
              <li>Coupons</li>
              <li>Blog Post</li>
              <li>Return Policy</li>
              <li>Join Affiliate</li>
            </ul>
          </div>

          <div class="footer-col-4">
            <h3>Follow us</h3>
            <ul>
              <li>Facebook</li>
              <li>Twitter</li>
              <li>Instagram</li>
              <li>YouTube</li>
            </ul>
          </div>
        </div>
        <hr />
        <p class="copyright">Copyright 2021 - introidx</p>
      </div>
    </div>
    <!-- JS for Toggle menu -->
    <script>
      var MenuItems = document.getElementById("MenuItems");

      MenuItems.style.maxHeight = "0px";

      function menutoggle() {
        if (MenuItems.style.maxHeight == "0px") {
          MenuItems.style.maxHeight = "200px";
        } else {
          MenuItems.style.maxHeight = "0px";
        }
      }
    </script>
  </body>
</html>
    