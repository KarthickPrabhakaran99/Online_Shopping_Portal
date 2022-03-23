<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<%

int productId = Integer.parseInt(request.getParameter("id")) ;
String quantity = request.getParameter("quantity");
int userId = (int)session.getAttribute("UserId");
MysqlConnection mysqlConnection = new MysqlConnection();
if("inc".equals(quantity)){
	ResultSet resultSet = mysqlConnection.cartRetrivalProduct(userId);
	resultSet.next();
	mysqlConnection.cartQuantityUpdate(userId,productId, resultSet.getInt("Quantity")+1);
	
	
	
}
if("dec".equals(quantity)){
	ResultSet resultSet = mysqlConnection.cartRetrivalProduct(userId);
	resultSet.next();
	mysqlConnection.cartQuantityUpdate(userId,productId, resultSet.getInt("Quantity")-1);

	
}

response.sendRedirect("cart.jsp");
%>
<body>

</body>
</html>