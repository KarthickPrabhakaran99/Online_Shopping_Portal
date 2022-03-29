
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
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
<body class="vh-100 gradient-custom">
<div class="categories-title text-uppercase " align="center"> Orders </div>
<a class="back-to-home-page "href="Admin.jsp"><button type="button" class="btn btn-danger admin-back-button logout-admin-button text-uppercase shadow ">Back</button></a>
<div class="container-fluid order-admin-container">


<table class="table table-light table-striped table-hover table-responsive">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
      <th scope="col" class="cart-text">Order Id</th>
       <th scope="col" class="cart-text">Order Date</th>
      <th scope="col" class="cart-text">User Id</th>
      <th scope="col" class="cart-text">User Name</th>
      <th scope="col" class="cart-text">Product count</th>
      <th scope="col" class="cart-text">Total Amount</th>
        
        <th scope="col" class="cart-text">Product Details</th>
        
        
            
    </tr>
  </thead>
    <%

MysqlConnection mysqlConnection = new MysqlConnection();
ResultSet resultSetOrder =mysqlConnection.orderRetrival();
ResultSet resultSetUserProduct =mysqlConnection.userProductRetrival();
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){



}else{
		response.sendRedirect("html/HomePage.html");
	 }


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
<td class="cart-text" ><%=resultSetOrder.getInt("user_id") %></td>
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
<script type="module" src="orderAdmin.js"></script>
</html>