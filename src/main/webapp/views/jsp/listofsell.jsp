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
            <li><a href="/sellerhome">View my main page</a></li>
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
        <th>image</th>
          <th>Product</th>
          <th>price</th>
       	  <th>Given discount</th>
        </tr>
       
        <c:forEach var="product" items="${sell}">
        <tr>
          <td>
            <div class="cart-info">
              <img src="${product.image}" alt="" />
              <div>
                <p></p>
                <small></small>
                <br />
             
              </div>
            </div>
          </td>
          <td>${product.pname}</td>
          <td>Price:Rs ${product.unitinstock}</td>
          <td>${product.discount*100}</td>
        </tr>
		</c:forEach>
      </table>

      <div class="total-price">
      
      
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
        <p class="copyright">Copyright 2020 - introidx</p>
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
