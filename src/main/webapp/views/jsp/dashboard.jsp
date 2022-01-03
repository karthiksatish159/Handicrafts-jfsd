<head>
<style>
@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");
* {
  box-sizing: border-box;
}
body {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0;
  background-color: #f7f8fc;
  font-family: "Roboto", sans-serif;
  color: #10182f;
}
.container {
  display: flex;
  width: 1040px;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
.card {
  margin: 10px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  width: 300px;
}
.card-header img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}
.card-body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 20px;
  min-height: 250px;
}

.tag {
  background: #cccccc;
  border-radius: 50px;
  font-size: 12px;
  margin: 0;
  color: #fff;
  padding: 2px 10px;
  text-transform: uppercase;
  cursor: pointer;
}
.tag-teal {
  background-color: #47bcd4;
}
.tag-purple {
  background-color: #5e76bf;
}
.tag-pink {
  background-color: #cd5b9f;
}

.card-body p {
  font-size: 13px;
  margin: 0 0 40px;
}
.user {
  display: flex;
  margin-top: auto;
}

.user img {
  border-radius: 50%;
  width: 40px;
  height: 40px;
  margin-right: 10px;
}
.user-info h5 {
  margin: 0;
}
.user-info small {
  color: #545d7a;
}

</style>
</head>
<body>
<div class="container">
  <div class="card">
    <div class="card-header">
      <img src="https://previews.123rf.com/images/sputanski/sputanski1403/sputanski140300028/26752476-positive-business-sales-graph-on-wood.jpg" alt="rover" />
    </div>
    <div class="card-body">
      <span class="tag tag-teal" onclick="window.location='/chart1'">Sales</span>
      <h4>
       Category Vs Customer
      </h4>
     
    </div>
  </div>
  <div class="card">
    <div class="card-header">
      <img src="https://image.shutterstock.com/image-vector/world-map-blue-vector-modern-260nw-1710046639.jpg" alt="ballons" />
    </div>
    <div class="card-body">
      <span class="tag tag-purple" onclick="window.location='/chart2'">Map</span>
      <h4>
      Continent Wise Product Sales
      </h4>
   
      
    </div>
  </div>
  <div class="card">
    <div class="card-header">
      <img src="https://images6.alphacoders.com/312/thumb-1920-312773.jpg" alt="city" />
    </div>
    <div class="card-body">
      <span class="tag tag-pink">Design</span>
      <h4>
 
      </p>
      
    </div>
  </div>
  </body>