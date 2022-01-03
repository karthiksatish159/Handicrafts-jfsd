<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkout.js"></script>
</head>
<body>
<div class='container'>
  <div class='window'>
    <div class='order-info'>
      <div class='order-info-content'>
        <h2>Order Summary</h2>
                <div class='line'></div>
        <table class='order-table'>
      
          <tbody>
           <c:forEach var="product" items="${carts}"> 
            <tr>
              <td><img src="${product.image}" class='full-width'></img>
              </td>
              <td>
                <br> <span class='thin'>${product.pname}</span>
                <br> ${product.category}<br> <span class='thin small'>QTY: ${product.count}<br></span>
                <span class='thin small'>Price: <fmt:formatNumber value="${product.price*product.count}" type="number" /></span>
               
                
              </td>
            </tr>
            </c:forEach>
          </tbody>
	
        </table>
        <div class='line'></div>
        <div class='total'>
          <span style='float:left;'>
            <div class='thin dense'>TAX 2%</div>
       
            TOTAL
          </span>
          <span style='float:right; text-align:right;'>
            <div class='thin dense'><fmt:formatNumber value = "${total*0.02}" type="number"/></div>
           	${(total*0.02)+total}
          </span>
        </div>
</div>
</div>
        <div class='credit-info'>
          <div class='credit-info-content'>
            <table class='half-input-table'>
              <tr><td>Please select your card: </td><td><div class='dropdown' id='card-dropdown'><div class='dropdown-btn' id='current-card'>Visa</div>
                <div class='dropdown-select'>
                <ul>
                  <li>Master Card</li>
                  <li>American Express</li>
                  </ul></div>
                </div>
               </td></tr>
            </table>
            <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img>
            Card Number
            <input class='input-field' required></input>
            Card Holder
            <input class='input-field' required></input>
            <table class='half-input-table'>
              <tr>
                <td> Expires
                  <input class='input-field' required></input>
                </td>
                <td>CVC
                  <input class='input-field' required></input>
                </td>
              </tr>
            </table>
            <a href="/payment">
            <button class='pay-btn'>Pay</button>
            </a>

          </div>

        </div>
      </div>
</div>
</body>
</html>