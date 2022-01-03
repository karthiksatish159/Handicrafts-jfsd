<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <style>
   .off-info .sm-title{
    background: var(--carribean-green);
    color: white;
    display: inline-block;
    padding: 0.5rem;
    position: absolute;
    top: 0;
    left: 0;
    writing-mode: vertical-lr;
    transform: rotate(180deg);
    z-index: 1;
    letter-spacing: 3px;
    cursor: pointer;
}
.product-btns{
    display: flex;
    justify-content: center;
    margin-top: 1.4rem;
    opacity: 0;
    transition: opacity 0.6s ease;
}
.btn-cart, .btn-buy{
    background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    width: 125px;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
}
.btn-cart{
    background: black;
    color: white;
}
.btn-cart:hover{
    background: var(--carribean-green);
}
.btn-buy{
    background: white;
}
.btn-buy:hover{
    background: var(--carribean-green);
    color: #fff;
}

.form {
    position: relative
}

.form .fa-search {
    position: absolute;
    top: 20px;
    left: 20px;
    color: #9ca3af
}

.form span {
    position: absolute;
    right: 17px;
    top: 13px;
    padding: 2px;
    border-left: 1px solid #d1d5db
}

.left-pan {
    padding-left: 7px
}

.left-pan i {
    padding-left: 10px
}

.form-input {
    height: 55px;
    text-indent: 33px;
    border-radius: 10px;
    width:300px
}

.form-input:focus {
    box-shadow: none;
    border: none
    form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}
  </style>
 
<script type='text/javascript'>
		var recognition = new webkitSpeechRecognition();

		recognition.onresult = function(event) { 
			console.log('result');
		  	var saidText = "";
		  	for (var i = event.resultIndex; i < event.results.length; i++) {
		        if (event.results[i].isFinal) {
		            saidText = event.results[i][0].transcript;
		        } else {
		            saidText += event.results[i][0].transcript;
		        }
		    }
		 	
		    document.getElementById('speechText').value = saidText;
		   	
		   	// Search Posts
		   	searchPosts(saidText);
		}

		function startRecording(){
			recognition.start();
		}

		// Search Posts
		function searchPosts(saidText){

			$.ajax({
				url: '/php/getData.php',
				type: 'post',
				data: {speechText: saidText},
				success: function(response){
					$('.container').empty();
					$('.container').append(response);
				}
			});
		}

		</script>
  <body>



        <nav>
          <ul id="MenuItems">
            <li><a href="index.html">Home</a></li>
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

    <div class="small-container">
      <div class="row row-2">
        <h2>All Products</h2>
        <select name="" id="">
          <option value="">Default Sorting</option>
          <option value="">Sort by Price</option>
          <option value="">Sort by Popularity</option>
          <option value="">Sort by Rating</option>
          <option value="">Sort by sales</option>
        </select>
      </div>

      <div class="row">
        <c:set var="count" value="0" scope="page"></c:set>
      <c:forEach var="product" items="${promatch}">	
     
        <div class="col-4">
             
        <p><fmt:formatNumber value = "${product.discount*100}" type="number"/> % off</p>
          <a href="/detailproduct/${product.pid}"><img src="${product.image}"  width="100px" height="100px" alt="" /></a>
          <h4>${product.pname}</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-o"></i>
          </div>
                            <form action="/addingcart/${product.pid}" method="post">
                                <button type = "submit" class = "btn-cart"> add to cart
                                    <span>+</span>
                                </button>
                         
                                <button type = "button" class = "btn-buy"> buy now
                                    <span><i class="fas fa-shopping-cart"></i></span>
                                </button>
                                 </form>
                            <
          <p> actual price:<strike>Rs: ${product.unitinstock}</strike></p>
          <p>Rs: ${product.unitinstock*product.discount}</p>
                         
        </div>
           </c:forEach>

    </div>
          <div class="page-btn">
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
        <span>&#8594;</span>
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
        <p class="copyright">Copyright 2021- introidx</p>
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
    