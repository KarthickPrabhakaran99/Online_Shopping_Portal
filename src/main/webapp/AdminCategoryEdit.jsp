<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
MysqlConnection mysqlConnection = new MysqlConnection();
  if(request.getParameter("submit")!=null)
    {
        int categoryId = Integer.parseInt( request.getParameter("id"))  ;
        String categoryName = request.getParameter("category-name");
    
        
      
       
      mysqlConnection.updateCategories(categoryId, categoryName);
 
        
        %>
        
        <script>  
            alert("Category Updated");          
       </script>
    <%            
    }
 
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">
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

<!-- JS -->

<title>Edit Product</title>
</head>
<body>










<%



int categoryId = Integer.parseInt(request.getParameter("id"));

ResultSet resultSet =mysqlConnection.categoriesRetrivalID(categoryId);
		resultSet.next();



String categoryName = resultSet.getString("category_name") ;



%>

	<section class="vh-100 gradient-custom login-page" id="LoginPage">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-light " style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">

								<h2 class="fw-bold mb-2 text-uppercase categories-title">Edit product</h2>
							

								<form action="" class="admin-edit-form" method="POST"  >
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="category-id" value="<%=categoryId%>"  disabled /> <label
											class="form-label" for="typeNameX">Category Id</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="category-name" value="<%=categoryName%>" required /> <label
											class="form-label" for="typeNameX">CategoryName</label>

									</div>
									
							
							

									</div>
								
			

									<button class="btn btn-success btn-lg px-5" id="SignUp"
										type="submit" name ="submit">Update</button>
								</form>
								<br>
							<button class="btn btn-primary btn-lg px-5 admin-edit-form" id="Reset"
										>Reset</button>
					<a href="CategoriesAdmin.jsp">	<button class="btn btn-danger btn-lg px-5 admin-edit-form" id="Back"
										>Back</button></a>
										

							</div>

						

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
	<script type="module" src="adminEdit.js"></script>
</body>
</html>