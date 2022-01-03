<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css" />
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
</head>
    <div class="container">
      <div class="navbar">
        <div class="logo">
          <a href="index.html">
            <img src="img/dark-logo.png" alt="" width="125px"
          /></a>
         
        </div>
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
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Username</label><input type="text" class="form-control" placeholder="first name" value="${user.username}"></div>

                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Phone number</label><input type="text" class="form-control" placeholder="enter phone number" value="${user.mobile }"></div>
                    
                    
                  
                    <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="enter email id" value="${user.email}"></div>
 
                </div>
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
            </div>
        </div>
       
    </div>
</div>
</div>
</div>