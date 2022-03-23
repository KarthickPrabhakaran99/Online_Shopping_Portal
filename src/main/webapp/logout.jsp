<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/11ad952d21.js"></script>
</head>
<body class="vh-100 gradient-custom">



<div class="logout-text shadow">
<div class=" categories-title text-uppercase" role="alert"  align="center">
 <i class="fas fa-check-circle"></i>Logout successful</div>
  <div class=" logout-text categories-title text-uppercase" role="alert"  align="center">

  <a href="html/HomePage.html" class="category-links link-dark text-uppercase"> home page</a> 
  
</div>

<% 

HttpSession httpSession = request.getSession();
httpSession.removeAttribute("User");

%>

	
</body>
</html>