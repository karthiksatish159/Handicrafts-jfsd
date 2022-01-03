<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  

    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
<section class="home-section">
<div class="top-sales box">
          <div class="title">Top Seling Product</div>
          <ul class="top-sales-details">
           <#list ol as o>
            <li>
            <a href="#">
              <img src="${o.image}" alt="">
              <span class="product">${o.pname}</span>
            </a>
            <span class="price">${o.count}</span>
          </li>
          </#list>
          </ul>
        </div>
</section>
</body>