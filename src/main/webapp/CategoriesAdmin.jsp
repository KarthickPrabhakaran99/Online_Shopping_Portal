
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Categories</title>
<!-- bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<!-- MDB -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"> -->

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
<div class="categories-title text-uppercase " align="center"> Categories </div>
 <a class="back-to-home-page "href="Admin.jsp"><button type="button" class="btn btn-danger admin-back-button logout-admin-button text-uppercase shadow ">Back</button></a>

<div class="container-fluid order-admin-container shadow">


<table class="table table-light table-striped table-hover table-responsive">

  <thead>
    <tr>
      <th scope="col" class="cart-text">#</th>
      <th scope="col" class="cart-text">Category Id</th>
      <th scope="col" class="cart-text">Category name</th>
   
       
        <th scope="col" class="cart-text">Edit</th>
            <th scope="col" class="cart-text">Delete</th>
    </tr>
  </thead>
    <%

MysqlConnection mysqlConnection = new MysqlConnection();
ResultSet resultSet =mysqlConnection.categoriesRetrival();
int serialNumber =0;
while(resultSet.next())
{
serialNumber++;
%>
  <tbody>
  

    <tr>
      <th scope="row" class="cart-text"><%=serialNumber %></th>
       <td class="cart-text"><%=resultSet.getInt("category_id") %></td>
      <td class="cart-text"><%=resultSet.getString("category_name") %></td>

       
         <td class="cart-text"><a  href="AdminCategoryEdit.jsp?id=<%=resultSet.getInt("category_id") %>" class="link-light order-admin-button"><button type="button" class="btn btn-primary shadow">Edit <i class="fas fa-edit"></i></button></a></td>
         <td class="cart-text"><a  href="AdminCategoryDelete.jsp?id=<%=resultSet.getInt("category_id") %>" class="link-light order-admin-button" ><button type="button" class="btn btn-danger shadow">Remove <i class="far fa-trash-alt"></i></button></a></button></a></td>
         
    </tr>
   

    <% HttpSession httpSession = request.getSession();
     httpSession.setAttribute("categoryId", resultSet.getInt("category_id"))  ; 

}%>
   <tr>
      <th scope="row"><%=++serialNumber %></th>
    <td><a  href="AdminCategoryAdd.jsp" class="link-light order-admin-button" ><button type="button" class="btn btn-warning"><i class="fas fa-plus"></i></button></a></td>
      <td>xxxxx</td>
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