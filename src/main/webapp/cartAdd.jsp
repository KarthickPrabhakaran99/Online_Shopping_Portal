<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
MysqlConnection mysqlConnection = new MysqlConnection();
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){


}
else{
		response.sendRedirect("html/HomePage.html");
	 }
        int productId = Integer.parseInt( request.getParameter("id"))  ;
      
       
        int userId = (int)httpSession.getAttribute("UserId");
   
    ResultSet resultSet = mysqlConnection.productRetrival(  mysqlConnection.productNameRetrival(productId).getString("product_name"));
 String productName =  mysqlConnection.productNameRetrival(productId).getString("product_name");
 float productPrice = resultSet.getFloat("product_price");
 

 if(mysqlConnection.cartRetrivalProduct(userId).next() ){

	 ResultSet resultSetProduct = mysqlConnection.cartRetrivalProduct(userId);
		resultSetProduct.next();
	
	 mysqlConnection.cartQuantityUpdate(userId,productId, resultSetProduct.getInt("Quantity")+1);
	
 }
 else{

	 mysqlConnection.addCart(userId, productId, productName, productPrice, 1);
	 
 }
      
        %>
        
      
    <%  
    
  response.sendRedirect("cart.jsp");
    
   
    
 
%>  