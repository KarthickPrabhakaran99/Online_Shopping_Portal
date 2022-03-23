<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- css -->
<link rel="stylesheet" href="css/styles.css?v=1.1">
<!-- MDB -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"> -->

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Fasthand&display=swap"
	rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">

<title>Products</title>
</head>
<body class="vh-100 gradient-custom">



<%





 
 
 MysqlConnection mysqlConnection  = new MysqlConnection();
 HttpSession httpSession = request.getSession();
 String user="Guest";
 if(httpSession.getAttribute("UserId") !=null){
  int id= (int)httpSession.getAttribute("UserId");
 	ResultSet resultSet = mysqlConnection.customerInformationRetrival(id);
 	user = resultSet.getString("name");
 
 
 }



%>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>
	<!-- MDB -->

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
					
						<li class="nav-item"><a class="order-admin-button  link-dark " href="#"
							tabindex="-1" aria-disabled="true"><%=user%></a></li>
						</li>
						
						<%
						
						request.removeAttribute("User");
						%>
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
	
	
	
	
	<!-- Product list -->
	
	<Section id="product-list">
	
	<% 
	
	
	
	ResultSet  resultSet =     mysqlConnection.productRetrivalCategory(request.getParameter("categoryId"));
	
	session.setAttribute("categoryName", request.getParameter("categoryId"));
	System.out.println(request.getParameter("categoryId"));
	
	%>
	
	<div class="categories-title text-uppercase " align="center"><%=request.getParameter("categoryId") %> Laptops </div>
	
	<div class="products-list row row-cols-1 row-cols-md-4 g-4">
	<%while(resultSet.next()){ %>
  <div class="col">
  
    <div class="card shadow">
      <img src="images/<%=resultSet.getString("product_id")%>.jpg" width="500" height="500"  class="card-img-top img-thumbnail rounded" alt="...">
      <div class="card-body">
        <h5 class="card-title text-uppercase product-names"> <%= resultSet.getString("product_name") %> </h5>
        <h5 class="card-title product-names">Rs.<%=resultSet.getFloat("product_price") %></h5>


<a href="checkoutData.jsp?id=<%=resultSet.getInt("product_id") %>" class="back-to-home-page link-light"><button type="submit" class=" buy-button btn  btn-success " name="<%=resultSet.getString("product_name") %>" value=""> BUY</button></a>
<a href="cartAdd.jsp?id=<%=resultSet.getInt("product_id") %>" class="back-to-home-page link-dark"><button type="button" class=" chart-button btn  btn-warning ">ADD TO CART</button></a>

      </div>
    </div>
  </div>
 

  
  <%
  }%>
  
  
 
</Section>






	<script type='module' src="login.js"></script>
</body>
</html>