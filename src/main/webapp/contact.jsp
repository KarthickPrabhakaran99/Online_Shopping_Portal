
        
<!DOCTYPE html>
<%@page import="com.database.MysqlConnection"%>
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

<title>Contact</title>
</head>
<body class="gradient-custom ">

<%
MysqlConnection mysqlConnection = new MysqlConnection();
int id = (int)session.getAttribute("UserId");
String user = mysqlConnection.customerInformationRetrival(id).getString("name");

if(request.getParameter("submit")!=null){

	String firstName = request.getParameter("first-name");
	String lastName = request.getParameter("last-name");
	String email = request.getParameter("email");
	String message = request.getParameter("message");
	String additionalDetails = request.getParameter("additional-details");
	
mysqlConnection.addreport(id, firstName, lastName, email, message, additionalDetails);

%>

<script>  
    alert("Report Submitted");          
</script>
<%  
	
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

			
							<li class="nav-item"><a class="order-admin-button  link-dark " href="MyOrders.jsp"
							tabindex="-1" aria-disabled="true">Orders</a></li>
						
					<li class="nav-item"><a class="order-admin-button  link-dark " href="index.jsp"
							tabindex="-1" aria-disabled="true">Categories</a></li>
						
						
							
						<li class="nav-item"><a class="order-admin-button  link-dark " href="#"
							tabindex="-1" aria-disabled="true"><%=user%></a></li>
					
						
<li class="nav-item"><a class="  link-warning " href="cart.jsp"
							tabindex="-1" aria-disabled="true"><i class="fa fa-cart-plus "></i></a></li>	
					
							<li class="nav-item"><a class=" link-danger" href="logout.jsp"
							tabindex="-1" aria-disabled="true" name="logout"><i class="fas fa-sign-out-alt"></i></a></li>
						</li>
					</ul>

				</div>

			</div>
		</nav>
	</section>
	<section>
	<div class="categories-title  " align="center"> Contact Us </div>
	<div class=" contact-div shadow " >
  
   </br>
  <%
  
  HttpSession httpSession = request.getSession();
  
  if(httpSession.getAttribute("UserId") !=null){

  
  }
 else{
 		response.sendRedirect("html/HomePage.html");
 	 }
  
  %> 
  
  <form action="" method="POST" class="contact-form">
  <div class="form-row">
    <div class="col contact-name">
    <label for="First-Name">First Name:</label>
      <input type="text" class="form-control contact-inputs" name="first-name" id="First-Name" required/>
    </div>
    <div class="col contact-name">
    <label for="Last-Name">Last Name:</label>
      <input type="text" class="form-control contact-inputs" name ="last-name" id="Last-Name" required/>
    </div>
    <div class="col contact-email">
    <label for="Email">Email:</label>
      <input type="text" class="form-control contact-inputs" name = "email" id="Email" required/>
    </div>
    <div class="col contact-email">
    <label for="Email">Message:</label>
      <input type="text" class="form-control contact-inputs" name="message" id="Message" required/>
    </div>
      <div class="col contact-email">
    <label for="exampleFormControlTextarea1">Additional Details:</label>
    <textarea class="form-control contact-inputs" id="exampleFormControlTextarea1" name ="additional-details" rows="5" required></textarea>
  </div>
  </div>
 
<button  type="submit" name="submit" class="btn btn-success text-uppercase shadow contact-submit-button">SEND</button>

</form>

	</section>
	
	



	
</body>
</html>