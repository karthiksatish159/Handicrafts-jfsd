<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
const createNav = () => {
    let nav = document.querySelector('.navbar');

    nav.innerHTML = `
        <div class="nav">
            <img src="img/dark-logo.png" class="brand-logo" alt="">
            <div class="nav-items">
                <div class="search">
                    <input type="text" class="search-box" placeholder="search brand, product">
                    <button class="search-btn">search</button>
                </div>
                <a href="/profile"><img src="img/user.png" alt=""></a>
                <a href="/myCart"><img src="img/cart.png" alt=""></a>
                <a href="logout"><img src="img/logout.png" alt=""></a>
            </div>
        </div>
        <ul class="links-container">
            <li class="link-item"><a href="#" class="link">home</a></li>
            <li class="link-item"><a href="#" class="link">women</a></li>
            <li class="link-item"><a href="#" class="link">men</a></li>
            <li class="link-item"><a href="#" class="link">kids</a></li>
            <li class="link-item"><a href="#" class="link">accessories</a></li>
        </ul>
    `;
}

createNav();
</script>
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
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'roboto', sans-serif;
}

.navbar{
    position: sticky;
    top: 5px;
    left: 0;
    width: 100%;
    background: #f5f5f5;
    z-index: 9;
}

.nav{
    padding: 10px 10vw;
    display: flex;
    justify-content: space-between;
}

.brand-logo{
    height: 100px;
    width: 100px;
}

.nav-items{
    display: flex;
    align-items: center;
}

.search{
    width: 500px;
    display: flex;
}

.search-box{
    width: 80%;
    height: 40px;
    padding: 10px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    border: 1px solid #d1d1d1;
    text-transform: capitalize;
    background: none;
    color: #a9a9a9;
    outline: none;
}

.search-btn{
    width: 20%;
    height: 40px;
    padding: 10px 20px;
    border: none;
    outline: none;
    cursor: pointer;
    background: #383838;
    color: #fff;
    text-transform: capitalize;
    font-size: 15px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}

.search-box::placeholder{
    color: #a9a9a9;
}

.nav-items a{
    margin-left: 20px;
}

.nav-items a img{
    width: 30px;
}
.links-container{
    width: 100%;
    display: flex;
    padding: 10px 10vw;
    justify-content: center;
    list-style: none;
    border-top: 1px solid #d1d1d1;
}

.link{
    text-transform: capitalize;
    padding: 0 10px;
    margin: 0 5px;
    text-decoration: none;
    color: #383838;
    opacity: 0.5;
    transition: .5s;
}

.link:hover{
    opacity: 1;
}
</style>
</head>
<body>
<nav class="navbar">
<div class="nav">
    <img src="img/dark-logo.png" class="brand-logo" alt="">
    <div class="nav-items">
        <div class="search">
           <div class='search_container'>
			<!-- Search box-->
			<input type='text' id='speechText' > &nbsp; <button style="font-size:24px"  id='start' onclick='startRecording();' ><i class="fa fa-microphone"></i></button>
		</div>
            
            <button class="search-btn">search</button>
        </div>
        <a href="/profile/${id}"><img src="img/user.png" alt=""></a>
        <a href="/myCart"><img src="img/cart.png" alt=""></a>
              <a href="logout"><img src="img/logout.png" alt=""></a>
    </div>
</div>
<ul class="links-container">
    <li class="link-item"><a href="#" class="link">home</a></li>
    <li class="link-item"><a href="#" class="link">women</a></li>
    <li class="link-item"><a href="#" class="link">men</a></li>
    <li class="link-item"><a href="#" class="link">kids</a></li>
    <li class="link-item"><a href="#" class="link">accessories</a></li>
</ul>
</nav>
</body>
</html>