
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
<div class="categories-title text-uppercase " align="center"> Reports </div>
<a  href="Admin.jsp" class="link-light order-admin-button" ><button type="button" class="btn btn-danger admin-back-button logout-admin-button text-uppercase shadow" >back</button></a>
<div class="container order-admin-container shadow">


<table class="table table-light table-striped table-hover table-responsive">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
      <th scope="col" class="cart-text">User Id</th>
      <th scope="col" class="cart-text">First name</th>
      <th scope="col" class="cart-text">Last name</th>
      <th scope="col" class="cart-text">Email</th>
      <th scope="col" class="cart-text">Message</th>
        <th scope="col" class="cart-text">Additional-details</th>
       
     
    </tr>
  </thead>
    <%

MysqlConnection mysqlConnection = new MysqlConnection();
ResultSet resultSet =mysqlConnection.reportsRetrival();
int serialNumber =0;
while(resultSet.next())
{
serialNumber++;
%>
  <tbody>
  

    <tr>
      <th scope="row" class="cart-text"><%=serialNumber %></th>
       <td class="cart-text"><%=resultSet.getInt("id") %></td>
      <td class="cart-text"><%=resultSet.getString("firstName") %></td>
      <td class="cart-text"><%=resultSet.getString("LastName") %></td>
      <td class="cart-text"><%=resultSet.getString("email")%></td>
       <td class="cart-text"><%=resultSet.getString("message")%></td>
              <td class="cart-text"><%=resultSet.getString("additional_details")%></td>
         
         
    </tr>
   

    <% 

}%>
   
  </tbody>

</table>

 </div>

<!-- fontawesome -->
	<script src="https://kit.fontawesome.com/11ad952d21.js"
		crossorigin="anonymous"></script>


</body>

</html>