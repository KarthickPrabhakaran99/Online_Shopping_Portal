
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fasthand&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&family=Quintessential&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/styles.css?v=1.1">
</head>

<%





 
 
 MysqlConnection mysqlConnection  = new MysqlConnection();
 HttpSession httpSession = request.getSession();
 String user="Guest";
 int id=0;
 if(httpSession.getAttribute("UserId") !=null){
  id= (int)httpSession.getAttribute("UserId");
 	ResultSet resultSet = mysqlConnection.customerInformationRetrival(id);
 	user = resultSet.getString("name");
 
 
 }
else{
		response.sendRedirect("html/HomePage.html");
	 }


%>
<body class="vh-100 gradient-custom">


	<!-- navigation Bar -->
	<section id="navigation-bar">
		<nav class="navbar navbar-custom navbar-expand-lg navbar-dark  ">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"><i
					class="fas fa-cart-arrow-down"></i>MrK</a>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
					aria-controls="navbarTogglerDemo03" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="search-bar">
					<form class="d-flex">
						<input type="text" placeholder="Search.." name="search"> <i
							class="fa fa-search"></i>
					</form>
				</div>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-uppercase">
						<li class="nav-item">
                                    <a class=" order-admin-button  link-dark" href="HomePageAfterLogin.jsp"> Home  </a>
                                 </li>
	<li class="nav-item"><a class="order-admin-button  link-dark " href="index.jsp"
							tabindex="-1" aria-disabled="true">Categories</a></li>
						
					
						<li class="nav-item"><a class="order-admin-button  link-dark " href="contact.jsp"
							tabindex="-1" aria-disabled="true">Contact</a></li>
					
						<li class="nav-item"><a class="order-admin-button  link-dark " href="#"
							tabindex="-1" aria-disabled="true"><%=user%></a></li>
						
							
						<li class="nav-item"><a class="  link-light " href="cart.jsp"
							tabindex="-1" aria-disabled="true"><i class="fa fa-cart-plus "></i></a></li>	
						
					
							<li class="nav-item"><a class=" link-light" href="logout.jsp"
							tabindex="-1" aria-disabled="true" name="logout"><i class="fas fa-sign-out-alt"></i></a></li>
						</li>

					</ul>

				</div>

			</div>
		</nav>
	</section>
<div class="categories-title text-uppercase " align="center"> My Orders </div>

<div class="container-fluid order-admin-container">


<table class="table table-light table-striped table-hover table-responsive">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
      <th scope="col" class="cart-text">Order Id</th>
       <th scope="col" class="cart-text">Order Date</th>
   
      <th scope="col" class="cart-text">User Name</th>
      <th scope="col" class="cart-text">Product count</th>
      <th scope="col" class="cart-text">Total Amount</th>
        
        <th scope="col" class="cart-text">Product Details</th>
        
        
            
    </tr>
  </thead>
    <%


ResultSet resultSetOrder =mysqlConnection.orderRetrival(id);
ResultSet resultSetUserProduct =mysqlConnection.userProductRetrival(id);



int serialNumber =0;
int productSerialNumber=0;
while(resultSetOrder.next() )
{
serialNumber++;
%>
  <tbody>
  

    <tr>
      <th scope="row"><%=serialNumber %></th>
       <td class="cart-text" ><%=resultSetOrder.getString("order_id") %></td>
<td class="cart-text" ><%=resultSetOrder.getDate("order_date") %></td>     

<td class="cart-text" ><%= mysqlConnection.customerInformationRetrival(resultSetOrder.getInt("user_id") ).getString("name") %></td>
     
      
       
         <td class="cart-text" ><%=mysqlConnection.userProductCountRetrival(resultSetOrder.getString("order_id")).getInt("product_count") %></td>
        <td class="cart-text" ><%=resultSetOrder.getString("amount") %></td>
                
                 <td> 
                 
                 <table class="table table-light table-striped table-hover table-responsive " >
  <thead>
    <tr>
      <th scope="col" class="cart-text" >#</th>
      <th scope="col" class="cart-text" >Product Id</th>
      <th scope="col" class="cart-text" >Product Name</th>
      <th scope="col" class="cart-text" >Product Price</th>
      <th scope="col" class="cart-text" >Product Quantity</th>
    </tr>
  </thead>

  
  
  
  <%
  ResultSet resultSetProduct=   mysqlConnection.userProductRetrival(resultSetOrder.getString("order_id"));
  while(resultSetProduct.next()){
	  productSerialNumber++;
  
  %>
       <tbody>
    
    <tr>
      
    <td class="cart-text" ><%=productSerialNumber %> </td>
  <td class="cart-text"><%=resultSetProduct.getInt("product_id") %> </td>
  <td class="cart-text"> <%=mysqlConnection.productNameRetrival(resultSetProduct.getInt("product_id")).getString("product_name") %></td>
  <td class="cart-text"><%=mysqlConnection.productRetrival(mysqlConnection.productNameRetrival(resultSetProduct.getInt("product_id")).getString("product_name") ).getString("product_price") %> </td>
  <td class="cart-text"> <%=resultSetProduct.getInt("count") %></td>

  </tr>
  
</tbody>
   

    <%
    
  
  }
  productSerialNumber=0;
  %>
 
  
  
  </table></td>  
  
 <% }%>


 
  </tbody>


  </table>
 </div>




</body>
<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>
<script type="module" src="orderAdmin.js"></script>
</html>