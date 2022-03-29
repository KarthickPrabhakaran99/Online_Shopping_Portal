
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&family=Quintessential&display=swap" rel="stylesheet">
</head>
<body class="vh-100 gradient-custom">
<div class="categories-title text-uppercase " align="center"> Products </div>
<a  href="Admin.jsp" class="link-light order-admin-button" ><button type="button" class="btn btn-danger admin-back-button logout-admin-button text-uppercase shadow" >back</button></a>
<div class="container order-admin-container shadow">


<table class="table table-light table-striped table-hover table-responsive">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
      <th scope="col" class="cart-text">Product Id</th>
      <th scope="col" class="cart-text">Product name</th>
      <th scope="col" class="cart-text">Product price</th>
      <th scope="col" class="cart-text">Product quantity</th>
      <th scope="col" class="cart-text">Product category</th>
       
        <th scope="col" class="cart-text">Edit</th>
            <th scope="col" class="cart-text">Delete</th>
    </tr>
  </thead>
    <%

MysqlConnection mysqlConnection = new MysqlConnection();
ResultSet resultSet =mysqlConnection.productRetrival();
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){



}else{
		response.sendRedirect("html/HomePage.html");
	 }
int serialNumber =0;
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
      <td class="cart-text"><%=resultSet.getInt("product_quantity")%></td>
       <td class="cart-text"><%=resultSet.getString("category_name")%></td>
       
         <td><a class="cart-text"  href="AdminEdit.jsp?id=<%=resultSet.getInt("product_id") %>" class="link-light order-admin-button"><button type="button" class="btn btn-primary shadow">Edit <i class="fas fa-edit"></i></button></a></td>
         <td><a class="cart-text"  href="AdminDelete.jsp?id=<%=resultSet.getInt("product_id") %>" class="link-light order-admin-button" ><button type="button" class="btn btn-danger shadow">Remove <i class="far fa-trash-alt"></i></button></a></td>
         
    </tr>
   

    <% 
     httpSession.setAttribute("productId", resultSet.getInt("product_id"))  ; 

}%>
   <tr>
      <th scope="row"><%=++serialNumber %></th>
    <td><a  href="AdminAdd.jsp" class="link-light order-admin-button" ><button type="button" class="btn btn-warning"><i class="fas fa-plus"></i></button></a></td>
      <td>xxxxx</td>
        <td>xxxx</td>
      <td>xxxx</td>
       <td>xxxx</td>
      <td>xxxx</td>
      <td>xxxx</td>
      
       
         
         
    </tr>
  </tbody>

</table>

 </div>

<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>


</body>

</html>