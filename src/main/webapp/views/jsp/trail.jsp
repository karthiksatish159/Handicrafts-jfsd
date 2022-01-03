<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trail1.css" />
          <link rel="stylesheet" href="${pageContext.request.contextPath}/css/trail2.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome-all.css">
       <!--   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" /> -->
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
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

                        function startRecording() {
                            recognition.start();
                        }

                        // Search Posts
                        function searchPosts(saidText) {

                            $.ajax({
                                url: '/php/getData.php',
                                type: 'post',
                                data: {
                                    speechText: saidText
                                },
                                success: function(response) {
                                    $('.container').empty();
                                    $('.container').append(response);
                                }
                            });
                        }
                    </script>

                    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                    <script>
                        $(function() {
                            $("#speechText").autocomplete({
                                source: function(request, response) {
                                    $.ajax({
                                        url: "/asearch",
                                        dataType: "json",
                                        data: {
                                            q: request.term
                                        },
                                        success: function(data) {
                                            //alert(data);
                                            console.log(data);
                                            response(data);
                                        }
                                    });
                                },
                                minLength: 2
                            });
                        });
                    </script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
         <div class="navbar">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="img/dark-logo.png" alt="" width="125px" /></a>

                                </div>
                                <form action="/search" method="post">
                                    <div class="container">
                                        <div class="row height d-flex justify-content-center align-items-center">
                                            <div class="col-md-6">
                                                <div class="form"> <i class="fa fa-search"></i> <input type="text" id='speechText' name="search" margin: auto; class="form-control form-input" placeholder="Search anything..."> <span class="left-pan"><i class="fa fa-microphone"><button type="button"  id='start' onclick='startRecording();' ></button></i></span>                                                    <button type="submit"><i class="fa fa-search"></i></button></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--  <legend>Search Here</legend>
			<p>
				<input type="text" name="search" id="searchBox"
					style="width: 560px; margin: auto;" />
			</p>-->
                                    <!-- 
 <input id="Plant_ID" type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" name="plantId" field="{plantId}"> -->

                                </form>

                                <nav>
                                    <ul id="MenuItems">
                                        <li><a href="index.html">Home</a></li>
                                        <li><a href="/producthome">Products</a></li>
                                        <li><a href="/profile/${id}">Profile</a></li>
                                        <li><a href="/logout">Logout</a></li>
                                        <li><a href="account.html">Account</a></li>
                                        <!-- TODo: 22:20 -->
                                    </ul>
                                </nav>
                                <a href="/myCart"><img src="${pageContext.request.contextPath}/img/cart.png" alt="" width="30px" height="30px" /></a>
                                <img src="images/menu.png" alt="" class="menu-icon" onclick="menutoggle()" />
                            </div>
                        </div>
        <div class="dashboard-header">
        
        </div>

        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="row">
                        <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                            <div class="row">
                                <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                    <div class="product-thumbnail">
                                        <div class="product-img-head">
                                            <div class="product-img">
                                                <img src="assets/images/eco-product-img-1.png" alt="" class="img-fluid"></div>
                                            <div class="ribbons"></div>
                                            <div class="ribbons-text">New</div>
                                            <div class=""><a href="#" class="product-wishlist-btn"><i class="fas fa-heart"></i></a></div>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-content-head">
                                                <h3 class="product-title">T-Shirt Product Title</h3>
                                                <div class="product-rating d-inline-block">
                                                    <i class="fa fa-fw fa-star"></i>
                                                    <i class="fa fa-fw fa-star"></i>
                                                    <i class="fa fa-fw fa-star"></i>
                                                    <i class="fa fa-fw fa-star"></i>
                                                    <i class="fa fa-fw fa-star"></i>
                                                </div>
                                                <div class="product-price">$49.00</div>
                                            </div>
                                            <div class="product-btn">
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                                <a href="#" class="btn btn-outline-light">Details</a>
                                                <a href="#" class="btn btn-outline-light"><i class="fas fa-exchange-alt"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item active"><a class="page-link " href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                            <div class="product-sidebar">
                                <div class="product-sidebar-widget">
                                    <h4 class="mb-0">E-Commerce Filter</h4>
                                </div>
                                <div class="product-sidebar-widget">
                                    <h4 class="product-sidebar-widget-title">Category</h4>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cat-1">
                                        <label class="custom-control-label" for="cat-1">Categories #1</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cat-2">
                                        <label class="custom-control-label" for="cat-2">Categories #2</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cat-3">
                                        <label class="custom-control-label" for="cat-3">Categories #3</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cat-4">
                                        <label class="custom-control-label" for="cat-4">Categories #4</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="cat-5">
                                        <label class="custom-control-label" for="cat-5">Categories #5</label>
                                    </div>
                                </div>
                                <div class="product-sidebar-widget">
                                    <h4 class="product-sidebar-widget-title">Size</h4>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="size-1">
                                        <label class="custom-control-label" for="size-1">Small</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="size-2">
                                        <label class="custom-control-label" for="size-2">Medium</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="size-3">
                                        <label class="custom-control-label" for="size-3">Large</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="size-4">
                                        <label class="custom-control-label" for="size-4">Extra Large</label>
                                    </div>
                                </div>
                                <div class="product-sidebar-widget">
                                    <h4 class="product-sidebar-widget-title">Brand</h4>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="brand-1">
                                        <label class="custom-control-label" for="brand-1">Brand Name #1</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="brand-2">
                                        <label class="custom-control-label" for="brand-2">Brand Name #2</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="brand-3">
                                        <label class="custom-control-label" for="brand-3">Brand Name #3</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="brand-4">
                                        <label class="custom-control-label" for="brand-4">Brand Name #4</label>
                                    </div>
                                </div>
                                <div class="product-sidebar-widget">
                                    <h4 class="product-sidebar-widget-title">Color</h4>
                                    <div class="custom-control custom-radio custom-color-blue ">
                                        <input type="radio" id="color-1" name="customRadio" class="custom-control-input">
                                        <label class="custom-control-label" for="color-1">Blue</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-color-red ">
                                        <input type="radio" id="color-2" name="customRadio" class="custom-control-input">
                                        <label class="custom-control-label" for="color-2">Red</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-color-yellow ">
                                        <input type="radio" id="color-3" name="customRadio" class="custom-control-input">
                                        <label class="custom-control-label" for="color-3">Yellow</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-color-black ">
                                        <input type="radio" id="color-4" name="customRadio" class="custom-control-input">
                                        <label class="custom-control-label" for="color-4">Black</label>
                                    </div>
                                </div>
                                <div class="product-sidebar-widget">
                                    <h4 class="product-sidebar-widget-title">Price</h4>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="price-1">
                                        <label class="custom-control-label" for="price-1">$$</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="price-2">
                                        <label class="custom-control-label" for="price-2">$$$</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="price-3">
                                        <label class="custom-control-label" for="price-3">$$$$</label>
                                    </div>
                                </div>
                                <div class="product-sidebar-widget">
                                    <a href="#" class="btn btn-outline-light">Reset Filter</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <div class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="text-md-right footer-links d-none d-sm-block">
                                    <a href="javascript: void(0);">About</a>
                                    <a href="javascript: void(0);">Support</a>
                                    <a href="javascript: void(0);">Contact Us</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- end wrapper  -->
            <!-- ============================================================== -->
        </div>
    </div>
        <!-- ============================================================== -->
        <!-- end main wrapper  -->
        <!-- ============================================================== -->
        <!-- Optional JavaScript -->
        <!-- jquery 3.3.1 -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
        <!-- bootstap bundle js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script>
        <!-- slimscroll js -->
        <script src="${pageContext.request.contextPath}/js/jquery.slimscroll.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/main-js.js"></script>
</body>
 
</html>