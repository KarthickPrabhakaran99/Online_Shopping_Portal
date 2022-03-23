<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap"
	rel="stylesheet">
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

<title>Add Product</title>
</head>
<body>

	<section class="vh-100 gradient-custom login-page" id="LoginPage">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card bg-light" style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">

								<h2 class="fw-bold mb-2 text-uppercase categories-title">Add
									product</h2>


								<form action="AddAdminProduct" class="admin-edit-form"
									method="POST" enctype="multipart/form-data">
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg"
											name="product-id" value="" required /> <label
											class="form-label" for="typeNameX">Product Id</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg"
											name="product-name" value="" required /> <label
											class="form-label" for="typeNameX">Product Name</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg"
											name="product-price" value="" required /> <label
											class="form-label" for="typeNameX">Product Price</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg"
											name="product-quantity" value="" required /> <label
											class="form-label" for="typeNameX">Product Quantity</label>

									</div>
									<div class="form-outline  mb-4">
										<input type="text" id="typeNameX"
											class="UserName form-control form-control-lg"
											name="product-category" value="" required /> <label
											class="form-label" for="typeNameX">Product Category</label>

									</div>
									<div class="mb-4">
										<label for="formFile" class="form-label text-light">Upload
											the product image</label> <input class="form-control" type="file"
											id="formFile" name="product-image">
									</div>
							</div>



							<button class="btn btn-success btn-lg px-5" id="SignUp"
								type="submit" name="submit">Add</button>
							</form>
							<br> <a href="ProductAdmin.jsp">
								<button class="btn btn-danger btn-lg px-5 admin-edit-form"
									id="Back">Back</button>
							</a>


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