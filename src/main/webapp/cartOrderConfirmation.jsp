<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css?v=1.1">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>
</head>
<body class="vh-100 gradient-custom">


<%
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){


}
else{
		response.sendRedirect("html/HomePage.html");
	 }
int id = (int)session.getAttribute("UserId");
MysqlConnection mysqlConnection = new MysqlConnection();
String AddressCheck = request.getParameter("AddressCheck");
if(AddressCheck.equals("true")){
String addressLine1 = request.getParameter("address-line1");
String addressLine2 = request.getParameter("address-line2");
String country = request.getParameter("country");
String state = request.getParameter("state");

int pincode =Integer.parseInt(request.getParameter("pincode"));

mysqlConnection.registeredDataUpdate(addressLine1, addressLine2, country, state, pincode, id);
}
String cardName = request.getParameter("card-name");

 
String cardNumber =request.getParameter("card-number").replaceAll("\\s", "");
int cvv =   Integer.parseInt(  request.getParameter("cvv"))     ;
String cardExpiry =  request.getParameter("card_expiry_date");

mysqlConnection.cardDetailsUpdate(cardName, cardNumber, cvv, cardExpiry, id);
String orderId = (int)(Math.random()*(1000000000-0+1)+0)+"";  
ResultSet resultSet = mysqlConnection.cartRetrival(id);
float totalAmount=0;
while(resultSet.next()){
	mysqlConnection.addUserProduct(orderId, id, resultSet.getInt("product_id"), resultSet.getInt("Quantity"));
	totalAmount = totalAmount+resultSet.getFloat("product_price")*resultSet.getInt("Quantity");
}


mysqlConnection.cartOrderUpdate(orderId, id, totalAmount, LocalDate.now().toString());
%>


<div class="logout-text shadow">
<div class=" categories-title text-uppercase" role="alert"  align="center">
  <i class="fas fa-shopping-bag"></i> Your Order is complete!!!!!</div>
  <div class=" logout-text categories-title text-uppercase" role="alert"  align="center">
  Order ID:</Strong><%=orderId %></div><br>
  <a href="index.jsp" class="category-links link-dark text-uppercase">back to homepage</a> </h5>
  
</div>



</body>
</html>