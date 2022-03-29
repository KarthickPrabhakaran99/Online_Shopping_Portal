<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
MysqlConnection mysqlConnection = new MysqlConnection();
  if(request.getParameter("submit")!=null)
    {
        int productId = Integer.parseInt( request.getParameter("id"))  ;
        String productName = request.getParameter("product-name");
        float productPrice = Float.parseFloat(request.getParameter("product-price"));
        int productQuantity =Integer.parseInt(  request.getParameter("product-quantity"));
        String productCategory = request.getParameter("product-category");
      
        
      
       
      mysqlConnection.productDetailsUpdate(productId, productName, productPrice, productQuantity,productCategory);
 
        
        %>
        
        <script>  
            alert("Product Updated");          
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



int productId = Integer.parseInt(request.getParameter("id"));

ResultSet resultSet = mysqlConnection.productNameRetrival(productId);
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){


}
else{
		response.sendRedirect("html/HomePage.html");
	 }

System.out.print(productId);
String productName = resultSet.getString("product_name") ;
System.out.print(resultSet.getString("product_name"));
resultSet = mysqlConnection.productRetrival(productName);
double productPrice = resultSet.getDouble("product_price");
int productQuantity = resultSet.getInt("product_quantity");
String productCategory = resultSet.getString("category_name");



%>

	<section class="vh-100 gradient-custom login-page" id="LoginPage">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-light" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">

								<h2 class="fw-bold mb-2 text-uppercase categories-title">Edit product</h2>
							

								<form action="" class="admin-edit-form" method="POST"  >
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="product-id" value="<%=productId%>"  disabled /> <label
											class="form-label" for="typeNameX">Product Id</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="product-name" value="<%=productName%>" required /> <label
											class="form-label" for="typeNameX">Product Name</label>

									</div>
									<div class="form-outline mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="product-price" value="<%=productPrice%>" required /> <label
											class="form-label" for="typeNameX">Product Price</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="product-quantity" value="<%=productQuantity%>" required /> <label
											class="form-label" for="typeNameX">Product Quantity</label>

									</div>
											<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg" name="product-category" value="<%=productCategory%>" required /> <label
											class="form-label" for="typeNameX">Product Category</label>

									</div>
							
							

									</div>
								
			

									<button class="btn btn-success btn-lg px-5" id="SignUp"
										type="submit" name ="submit">Update</button>
								</form>
								<br>
							<button class="btn btn-primary btn-lg px-5 admin-edit-form" id="Reset"
										> <a href="" class="link-light order-admin-button">Reset</a> </button>
							<button class="btn btn-danger btn-lg px-5 admin-edit-form" id="Back"
										> <a href="ProductAdmin.jsp" class="link-light order-admin-button">Back</a></button>
										

							</div>

						

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>

</body>
</html>