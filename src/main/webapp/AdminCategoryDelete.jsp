
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
MysqlConnection mysqlConnection = new MysqlConnection();
   
 
%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css"
	rel="stylesheet" />

<!-- MDB JS-->
<!-- <script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"
></script> -->


<!-- css -->
<!-- <link
href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" rel="stylesheet"/> -->
<link rel="stylesheet" href="css/styles.css?v=1.1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="styles.css?v=1.1">

<!-- JS -->

<title>Edit Product</title>
</head>
<body class="vh-100 gradient-custom">










<%
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){


}
else{
		response.sendRedirect("html/HomePage.html");
	 }


int categoryId = Integer.parseInt(request.getParameter("id"));

ResultSet resultSet = mysqlConnection.categoriesRetrivalID(categoryId);
resultSet.next();


String categoryName = resultSet.getString("category_name") ;




%>

	<section  id="LoginPage">
	<div class=" logout-text alert alert-danger" role="alert">
  <h3 class="">Confirm to delete <%=categoryName %> ?</h3>
  
		<button 		type="submit" class="btn btn-success btn-lg px-5 admin-edit-form" id="Delete"><a  href="AdminCategoryDeleteFinal.jsp?id=<%=categoryId %>" class="link-light order-admin-button">Delete</a></button>
										
										
											<a href="CategoriesAdmin.jsp"><button class="btn btn-danger btn-lg px-5 admin-edit-form" id="Cancel"
										>Cancel</button></a>
</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
	<script type="module" src="adminDelete.js"></script>
</body>
</html>