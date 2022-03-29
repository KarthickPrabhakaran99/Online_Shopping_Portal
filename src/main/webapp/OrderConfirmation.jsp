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
</head>
<body class="vh-100 gradient-custom">
<%!
public int productData(String productName,String typeOfData)throws Exception{
	MysqlConnection mysqlConnection  = new MysqlConnection();
	
	ResultSet resultset   = mysqlConnection.productRetrival(productName);
	int productId = resultset.getInt("product_id");
	int productPrice = (int)resultset.getFloat("product_price");
	int productQuantity =resultset.getInt("product_quantity");
	switch(typeOfData){
		
		case "productId":
			return productId;
		
		case "productPrice": return productPrice;
		
		case "productQuantity": return productQuantity;
		
	
		
		default : return 0;
		
	}
	
}
public String productName(int productId) throws Exception{
	MysqlConnection mysqlConnection  = new MysqlConnection();
	ResultSet resultSet = mysqlConnection.productNameRetrival(productId);
	
	return resultSet.getString("product_name");
	
	
}


%>

<%
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){



}else{
		response.sendRedirect("html/HomePage.html");
	 }
int id = (int)session.getAttribute("UserId");
String cardName = request.getParameter("card-name");
int currentProductId = (int)session.getAttribute("CurrentProductId");
 
String cardNumber =request.getParameter("card-number").replaceAll("\\s", "");
int cvv =   Integer.parseInt(  request.getParameter("cvv"))     ;
String cardExpiry =  request.getParameter("card_expiry_date");
MysqlConnection mysqlConnection = new MysqlConnection();
mysqlConnection.cardDetailsUpdate(cardName, cardNumber, cvv, cardExpiry, id);
String orderId = (int)(Math.random()*(1000000000-0+1)+0)+"";  
String productName = productName(currentProductId);
float productPrice = productData(productName, "productPrice");


mysqlConnection.orderUpdate(orderId, id, currentProductId, productPrice, LocalDate.now().toString(), 1);
%>

%>

<div class=" logout-text alert alert-success" role="alert">
  <h1 class="">Your Order is complete!!!!!</h1>
  <h3><Strong>Order ID:</Strong><%=orderId %></h3>
  <a class="back-to-home-page"href="HomePageAfterLogin.jsp"> Go to back to homepage</a>
</div>



</body>
</html>