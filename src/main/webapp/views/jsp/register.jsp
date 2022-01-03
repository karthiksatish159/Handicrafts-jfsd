
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html> 
  <jsp:include page="nav.jsp"></jsp:include>
  <html lang="en"> 

    <head>  

      <meta charset="UTF-8">  

      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Registration Form With Html & Css</title>  

      <link rel="stylesheet"  type="text/css" href="css/style1.css">  

      <meta name="viewport" content="width=device-width, initial-scale=1"> 

    </head>

    <body> 

        <div>   

          <form action="/saveuser" method="post" modelAttribute="user">    

            <h4 class="text-warning text-center pt-5">Registration Page</h4>  

             <label>     
              <input type="text"  class="input"  name="username"  placeholder="USERNAME"></input>       
              <div class="line-box">         
               	 <div class="line"></div>        
              </div>    
            </label>   

            <label>     

              <input type="text" class="input"  name="email" placeholder="EMAIL"/>                   <div class="line-box">          

              <div class="line"></div>        

              </div>    

            </label>     

              <label>     
              <input type="number" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" class="input"   name="mobile"  placeholder="phone number"/>        
              <div class="line-box">         
                <div class="line"></div>        
              </div>    
            </label>  
            <label>     

              <input 

                     type="password" 

                     class="input" 
					
                     name="password" 

                     placeholder="PASSWORD"/>        

              <div class="line-box">          

                <div class="line"></div>        

              </div>    

            </label>     
            <label>     
              <input 

                     type="password" 

                     class="input" 

                     name="confirm" 

                     placeholder="CONFIRM PASSWORD"/>      

              <div class="line-box">        

                <div class="line"></div>      

              </div>    

            </label>     

            

            <button type="submit">submit</button>  

          </form> 

      </div> 

    </body> 

</html>