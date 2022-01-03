<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.demo.Backend.Backend123,com.example.demo.Model.product,java.util.*,java.io.*,org.springframework.beans.factory.annotation.Autowired" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en" >
  <head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap.min.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product Page - Admin HTML Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
	<style>
	.button4 {
	border-radius: 12px;
	border: 2px solid #4CAF50;
	padding: 10px 24px;
	 color: red;
	}
	</style>
  </head>

  <body id="reportsPage">
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="index.html">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
            <li class="nav-item">
              <a class="nav-link" href="/dash">
                <i class="fas fa-tachometer-alt"></i> Dashboard
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false">
                <i class="far fa-file-alt"></i>
                <span> Reports <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Daily Report</a>
                <a class="dropdown-item" href="#">Weekly Report</a>
                <a class="dropdown-item" href="#">Yearly Report</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/pro">
                <i class="fas fa-shopping-cart"></i> Products
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="/accounts">
                <i class="far fa-user"></i> Accounts
              </a>
            </li>
            <li class="nav-item dropdown">
                <a
                  class="nav-link active"
                  href="/getorders"
                  id="navbarDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <img src="https://img.icons8.com/external-inipagistudio-mixed-inipagistudio/64/000000/external-order-digital-marketing-strategy-inipagistudio-mixed-inipagistudio.png"/>
                  <span> Orders <i class="bi bi-sort-up"></i> </span>
                </a>
              
              </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="/admin">
                Admin, <b>Logout</b>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container mt-5">
      <div class="row tm-content-row">
        <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
          <div class="tm-bg-primary-dark tm-block tm-block-products">
            <div class="tm-product-table-container">
              <table class="table table-hover tm-table-small tm-product-table">
                <thead>
                  <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">PRODUCT NAME</th>
                    <th scope="col">Prics</th>
                    <th scope="col">Category</th>
                    <th scope="col">Images</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>

                <tbody>
        <c:set var="count" value="0" scope="page"></c:set>
        <c:forEach var="o" items="${orders}">
        <c:set var="count" value="${count + 1}" scope="page"></c:set>
            <tr>
            
                <td>${count}</td>
                <td>${o.pname}</td>
            
			<th scope="row"><img alt="" src="${o.image}" style="width: 100px;height: 100px;"></th>
                <td>${o.cuid}</td>
                <td>${o.status}</td>
                <c:if test="${o.status=='On Process'}">
                <td><a href="/changetosucc/${o.oid}" class="btn btn-info text-right" target="_blank">Accept</a></td>
                </c:if>
                 <td><a href="/changetoreject/${o.oid}" class="button4"  target="_blank">Reject</a></td>
            </tr>
         </c:forEach>
        </tbody>
              </table>
            </div>
            <!-- table container -->
          
        
          </div>
        </div>
       
    <footer class="tm-footer row tm-mt-small">
      <div class="col-12 font-weight-light">
        <p class="text-center text-white mb-0 px-4 small">
          Copyright &copy; <b>2021</b> All rights reserved. 
          
          Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
        </p>
      </div>
    </footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
 		<script type="text/javascript">
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	</script>
    <script>
    $(document).ready(function() {
        $('#loader').hide();
        $("#submit").on("click", function() {
        	$("#submit").prop("disabled", true);
        	var name = $("#pname").val();
            var file = $("#image").val(); 
            var price = $("#unitinstock").val();
            var description = $("#desc").val();
            var form = $("#form").serialize();
        	var data = new FormData($("#form")[0]);
        	data.append('name', name);
        	data.append('price', price);
        	data.append('description', description); 
        	//alert(data);
            $('#loader').show();
            if (name === "" || file === "" || price === "" || description === "") {
            	$("#submit").prop("disabled", false);
                $('#loader').hide();
                $("#pname").css("border-color", "red");
                $("#image").css("border-color", "red");
                $("#unitinstock").css("border-color", "red");
                $("#desc").css("border-color", "red");
                $("#error_name").html("Please fill the required field.");
                $("#error_file").html("Please fill the required field.");
                $("#error_price").html("Please fill the required field.");
                $("#error_description").html("Please fill the required field.");
            } else {
                $("#pname").css("border-color", "");
                $("#image").css("border-color", "");
                $("#unitinstock").css("border-color", "");
                $("#desc").css("border-color", "");
                $('#error_name').css('opacity', 0);
                $('#error_file').css('opacity', 0);
                $('#error_price').css('opacity', 0);
                $('#error_description').css('opacity', 0);
                        $.ajax({
                            type: 'POST',
                            enctype: 'multipart/form-data',
                            data: data,
                            url: "/product/saveProduct", 
                            processData: false,
                            contentType: false,
                            cache: false,
                            success: function(data, statusText, xhr) {
                            console.log(xhr.status);
                            if(xhr.status == "200") {
                            	$('#loader').hide(); 
                            	$("#form")[0].reset();
                            	$('#success').css('display','block');
                                $("#error").text("");
                                $("#success").html("Product Inserted Succsessfully.");
                                $('#success').delay(2000).fadeOut('slow');
                             }	   
                            },
                            error: function(e) {
                            	$('#loader').hide();
                            	$('#error').css('display','block');
                                $("#error").html("Oops! something went wrong.");
                                $('#error').delay(5000).fadeOut('slow');
                                location.reload();
                            }
                        });
            }
                });
            });
    </script>
  </body>
</html>