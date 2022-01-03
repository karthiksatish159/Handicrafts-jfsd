<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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
            <li><a href="#">Account</a></li>
            <!-- TODo: 22:20 -->
          </ul>
        </nav>
        <a href="cart.html"
          ><img src="images/cart.png" alt="" width="30px" height="30px"
        /></a>
        <img
          src="images/menu.png"
          alt=""
          class="menu-icon"
          onclick="menutoggle()"
        />
      </div>
    </div>

    <!-- Single Products Detail -->
    <div class="small-container single-product">
      <div class="row">
        <div class="col-2">
          <img src="${pro.image}" width="100%" id="ProductImg" />

          <div class="small-img-row">
            <div class="small-img-col">
              <img src="${pro.image}" class="small-img" />
            </div>
            <div class="small-img-col">
              <img src="${pro.image}" class="small-img" />
            </div>
            <div class="small-img-col">
              <img src="${pro.image}" class="small-img" />
            </div>
            <div class="small-img-col">
              <img src="${pro.image}" class="small-img" />
            </div>
          </div>
        </div>
        <div class="col-2">
          <p>${pro.category}</p>
          <h2>${pro.pname}</h2>
          <h4>${pro.unitinstock}</h4>
          <select name="" id="">
            <option value="">Select Size</option>
            <option value="">XXL</option>
            <option value="">XL</option>
            <option value="">Large</option>
            <option value="">Medium</option>
            <option value="">Small</option>
          </select>
          <input type="number" value="1" />
          <a href="/addingcart/${pro.pid}" class="btn">Add to Cart</a>
           <a href="/sellerproducts/${pro.sname}" class="btn">View all products from this seller</a>
          <h3>Product Details<i class="fa fa-indent"></i></h3>
          <br />
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit nemo
            nam magnam rerum sunt explicabo! Distinctio ipsam doloremque nostrum
            ipsum?
          </p>
        </div>
      </div>
    </div>

    <!-- Title -->
    <div class="small-container">
      <div class="row row-2">
        <h2>Related Products</h2>
        <p>View More</p>
      </div>
    </div>

    <!-- Similar Products -->

    <div class="small-container">
      <div class="row">
       <c:forEach var="cat" items="${cat123}">	
        <div class="col-4">
          <img src="${cat.image}" alt="" />
          <h4>${cat.pname}</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-o"></i>
          </div>
          <p> actual price:<strike>Rs: ${cat.unitinstock}</strike></p>
          <p>Rs: ${cat.unitinstock*cat.discount}</p>
        </div>
    </c:forEach>
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

    <!-- js for product gallery -->
    <script>
      var ProductImg = document.getElementById("ProductImg");
      var smallImg = document.getElementsByClassName("small-img");
      smallImg[0].onclick = function () {
        ProductImg.src = smallImg[0].src;
      };
      smallImg[1].onclick = function () {
        ProductImg.src = smallImg[1].src;
      };
      smallImg[2].onclick = function () {
        ProductImg.src = smallImg[2].src;
      };
      smallImg[3].onclick = function () {
        ProductImg.src = smallImg[3].src;
      };
    </script>
  </body>
</html>
    