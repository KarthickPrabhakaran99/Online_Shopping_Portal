<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin route</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css?v=1.1">
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif&family=Quintessential&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="styles.css?v=1.1">
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/11ad952d21.js"
	crossorigin="anonymous"></script>

</head>
<body class="vh-100 gradient-custom">

	<%
	String userName = (String) session.getAttribute("User");
	%>
	<div class="categories-title text-uppercase " align="center">
		Welcome
		<%=userName%>
		(Admin)
	</div>

	<a class="back-to-home-page " href="logout.jsp"><button
			type="button"
			class="btn btn-danger logout-admin-button text-uppercase shadow ">Log
			out</button></a>
	<div class=" go-to-text  text-uppercase shadow">
		<h1 class="">Categories</h1>
		</br> <a class="back-to-home-page link-dark" href="CategoriesAdmin.jsp">
			<button type="button " class="btn btn-success text-uppercase shadow">categories</button>
		</a>

	</div>
	<div class=" go-to-text  text-uppercase shadow">
		<h1 class="">Products</h1>
		</br> <a class="back-to-home-page link-dark" href="ProductAdmin.jsp"><button
				type="button" class="btn btn-success text-uppercase shadow">products</button></a>
	</div>

	<div class=" go-to-text  text-uppercase shadow ">
		<h1 class="">Order</h1>
		</br> <a class="back-to-home-page link-dark" href="OrdersAdmin.jsp">
			<button type="button " class="btn btn-success text-uppercase shadow">
				orders</button>
		</a>

	</div>
	<div class=" go-to-text  text-uppercase shadow ">
		<h1 class="">Reports</h1>
		</br> <a class="back-to-home-page link-dark" href="ReportsAdmin.jsp">
			<button type="button " class="btn btn-success text-uppercase shadow">
				reports</button>
		</a>

	</div>


</body>

</html>