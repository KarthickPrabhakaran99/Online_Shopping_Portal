
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<!-- bootstrap CSS -->
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
<!-- css -->
<link rel="stylesheet" href="css/styles.css?v=1.1">
</head>

<body class="vh-100 gradient-custom ">

<%



MysqlConnection mysqlConnection  = new MysqlConnection();
HttpSession httpSession = request.getSession();
String user="Guest";
int id= (int)httpSession.getAttribute("UserId");
if(httpSession.getAttribute("UserId") !=null){
 
	ResultSet resultSet = mysqlConnection.customerInformationRetrival(id);
	user = resultSet.getString("name");
 
 } 
else{
		response.sendRedirect("html/HomePage.html");
	 }



%>
	<!-- navigation Bar -->
	<section id="navigation-bar">
		<nav class="navbar navbar-custom navbar-expand-lg navbar-dark ">
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
				<div class="collapse navbar-collapse text-uppercase" id="navbarTogglerDemo03">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="order-admin-button  link-dark " aria-current="page"
							href="HomePageAfterLogin.jsp">Home</a></li>

					<li class="nav-item"><a class="order-admin-button  link-dark " href="index.jsp"
							tabindex="-1" aria-disabled="true">Categories</a></li>	
				<li class="nav-item"><a class="order-admin-button  link-dark " href="MyOrders.jsp"
							tabindex="-1" aria-disabled="true">Orders</a></li>
						<li class="nav-item"><a class="order-admin-button  link-dark " href="contact.jsp"
							tabindex="-1" aria-disabled="true">Contact</a></li>
						</li>
					
						<li class="nav-item"><a class="order-admin-button  link-dark " href="#"
							tabindex="-1" aria-disabled="true"><%=user%></a></li>
						</li>
						
						<%
						
						request.removeAttribute("User");
						%>
						
						
							<li class="nav-item"><a class=" link-light" href="logout.jsp"
							tabindex="-1" aria-disabled="true" name="logout"><i class="fas fa-sign-out-alt"></i></a></li>
						</li>
					</ul>

				</div>

			</div>
		</nav>
	</section>

<div class="categories-title text-uppercase " align="center"> Carts </div>
<div class="container-fluid order-admin-container   shadow ">
 

<table class="table  table-striped table-hover table-responsive table-light ">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
    
      <th scope="col" class="cart-text">Product Id</th>
      <th scope="col" class="cart-text">Product name</th>
      <th scope="col" class="cart-text">Product price</th>
      <th scope="col" class="cart-text">Quantity</th>
       <th scope="col" class="cart-text">Total price</th>
       
        
            <th scope="col" class="cart-text">Delete</th>
    </tr>
  </thead>
    <%

MysqlConnection mysqlConnection2 = new MysqlConnection();
ResultSet resultSet =mysqlConnection.cartRetrival(id);
int serialNumber =0;
float totalAmount =0;
while(resultSet.next())
{
serialNumber++;
%>
  <tbody>
  

    <tr>
      <th scope="row" class="cart-text"><%=serialNumber %></th>
       <td class="cart-text"><%=resultSet.getInt("product_id") %></td>
      <td class="cart-text"><%=resultSet.getString("product_name") %></td>
      <td class="cart-text"><%=resultSet.getFloat("product_price") %></td>
      <td class="cart-text" >  <a href="incDecQuantity.jsp?id=<%=resultSet.getInt("product_id") %>&quantity=inc"><i class="fas fa-plus-circle"></i></a> <%=resultSet.getInt("Quantity")%><a href="incDecQuantity.jsp?id=<%=resultSet.getInt("product_id") %>&quantity=dec"><i class="fas fa-minus-circle"></i></a></td>
       <td class="cart-text"><%=resultSet.getInt("Quantity")*resultSet.getFloat("product_price")%></td>
      
       
     
         <td><a  href="DeleteCart.jsp?id=<%=resultSet.getInt("product_id") %>" class="link-light order-admin-button" ><button type="button" class="btn btn-danger shadow">Remove <i class="far fa-trash-alt"></i></button></a></td>
         
    </tr>
   

    <% 
    totalAmount =totalAmount+resultSet.getFloat("product_price")*resultSet.getInt("Quantity");
     httpSession.setAttribute("productId", resultSet.getInt("product_id"))  ; 

}%>
   <tr>
      <th scope="row"><%=++serialNumber %></th>
    <td><a  href="index.jsp" class="link-light order-admin-button" ><button type="button" class="btn btn-warning shadow"><i class="fas fa-plus"></i></button></a></td>
      <td>xxxxx</td>
        <td>xxxx</td>
      <td>xxxx</td>
       <td>xxxx</td>
       <td>xxxx</td>
  
      
       
         
         
    </tr>
  </tbody>

</table>
<div class="cart-text text-light"><h2 align="right">Grand Total: Rs. <%=totalAmount %> </h2></div>
<a  href="cartCheckout.jsp" class="link-light order-admin-button shadow" ><button  type="button" class="btn btn-success">MOVE TO CHECKOUT-></button></a></td>
 </div>



<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>
</body>

</html>