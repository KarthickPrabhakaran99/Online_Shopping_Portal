<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Check Out </title>

    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

   


<!-- css -->
<link rel="stylesheet" href="css/styles.css?v=1.1">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">
    
  </head>

  <body class="gradient-custom ">
 
   <%
 
 MysqlConnection mysqlConnection = new MysqlConnection();

 
int id = (int)session.getAttribute("UserId");
ResultSet resultSet =   mysqlConnection.customerInformationRetrival(id);
String name = resultSet.getString("name");
 String email = resultSet.getString("email");
 String password =resultSet.getString("password");
 String address_line1 =resultSet.getString("address_line1");
 String address_line2 =resultSet.getString("address_line2");
 String country =resultSet.getString("country");
 String state =resultSet.getString("state");
 int postalCode = resultSet.getInt("postal_code");

 MysqlConnection mysqlConnection2 = new MysqlConnection();
 ResultSet resultSetProduct =mysqlConnection.cartRetrival(id);
 String addressCheck = address_line1 == null?"true":"false";
 

 %>           
 <div class="categories-title text-uppercase " align="center"> Check Out </div>
 
 <div class="check-out container-fluid shadow">
      <div class="container checkout-container  cart-text">
   
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
             <div class="checkout-title text-uppercase " align="center"> YOUR CARTS </div>
             <div class="checkout-list ">
            <ul class="list-group mb-3 sticky-top ">
            
            <%
            float totalAmount=0;
            while(resultSetProduct.next()){
            	
            	
            	%>
                <li class="checkout-list-item d-flex justify-content-between lh-condensed">
                    <div>
                        <div class=""><%=resultSetProduct.getString("product_name") %></div>
                        <small class="">Quantity:<%=resultSetProduct.getInt("Quantity")%></small>
                    </div>
                    <span class="">Rs.<%=resultSetProduct.getFloat("product_price") %></span>
                </li>
                <% 
                
            totalAmount = totalAmount+resultSetProduct.getFloat("product_price")*resultSetProduct.getInt("Quantity");
            }%>
              
                
            </ul>
              </div>
             </div>
      
            
            
             
        <div class="col-md-8 order-md-1">
    
             <div class="checkout-title text-uppercase "> Billing address </div>
   <table class="address-table text-uppercase   ">
  
  <tr >

    <td bgcolor="white"> <strong>Name:</strong></td>
    <td bgcolor="white"> <%=name %></td>
    
  </tr>
  <tr>
   
   
    <td bgcolor="white"> <strong>Email Id:</strong></td>
    <td bgcolor="white"> <%=email %> </td>
   
      
  </tr>
  <form class="needs-validation"  method="post" action="cartOrderConfirmation.jsp?AddressCheck=<%=addressCheck %>">
                  
   
    <td bgcolor="white"> <strong>Address:</strong></td>
    <td bgcolor="white"> <%=address_line1!=null?address_line1:" <input type=\"text\" class=\"form-control \" id=\"Address-Line1\" name=\"address-line1\" placeholder=\"address Line1\"  required/> "  %> <%=address_line2!=null?address_line2:" <input type=\"text\" class=\"form-control \" id=\"Address-Line2\" name=\"address-line2\" placeholder=\"address Line2\"  required/> "  %></td>
      
  </tr>
     <tr>
  
   
    <td bgcolor="white"> <strong>Country:</strong></td>
    <td bgcolor="white"> <%=country!=null?country:" <input type=\"text\" class=\"form-control \" id=\"Country\" name=\"country\" placeholder=\"country\"  required/> "  %> </td>
    
      
  </tr>
    <tr>
 
    
    <td bgcolor="white"> <strong>state:</strong></td>
    <td bgcolor="white"> <%=state!=null?state: " <input type=\"text\" class=\"form-control \" id=\"State\" name=\"state\" placeholder=\"state\"  required/> "  %></td>
    
    
  </tr>
    <tr>
  
    
    <td bgcolor="white"> <strong>pincode:</strong></td>
    <td bgcolor="white"><%=postalCode!=0?postalCode:" <input type=\"text\" class=\"form-control \" id=\"Pincode\" name=\"pincode\" placeholder=\"pincode\"  required/> " %></td>
    
  	 
  </tr>
 
</table>
          
                
                
               
                
   
                
                
     
                
                
                   
                
            
                <hr class="mb-4">
              <div class="checkout-title text-uppercase "> Payment</div>
                <div class="payment-container ">
                
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" value="credit" checked="" required/>
                        <label class="custom-control-label" for="credit">Credit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" value="debit" required/>
                        <label class="custom-control-label" for="debit">Debit card</label>
                    </div>
                 
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name">Name on card</label>
                        <input type="text" class="form-control" id="credit-card-name"  name="card-name" placeholder="" required />
                        <small class="text-muted">Full name as displayed on card</small>
                        <div class="invalid-feedback" id="credit-card-name-error"> Name on card is required </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="cc-number" id="card-label">Credit card number</label>
                        <input type="text" class="form-control " id="credit-card-number" name="card-number" placeholder="xxxx-xxxx-xxxx-xxxx"   maxlength="19" required/>
                        <div class="invalid-feedback"  id="credit-card-number-error"> Credit card number is required </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">Expiration</label>
                        <input type="text" class="form-control" id="card-expiration" name ="card_expiry_date" placeholder="" required >
                        <div class="invalid-feedback" id="card-expiration-error"> Expiration date required </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-cvv">CVV</label>
                        <input type="text" class="form-control" id="credit-card-cvv" name ="cvv" placeholder="" required>
                        <div class="invalid-feedback" id="credit-card-cvv-error"> Security code required </div>
                    </div>
                </div>
                </div>
                
                <hr class="mb-4">
                <button class="btn btn-success btn-lg btn-block" type="submit">Continue to checkout</button>
                
            </form>
             
        </div>
        
    </div>
    
</div>
<div class=" text-uppercase checkout-total-text" align="right"> Total(INR): Rs.<%=totalAmount %> </div>
</div>
<footer class="my-5 pt-5 text-muted text-center text-small  ">
        <p class="mb-1">© 2021-2022 Mrk Shop</p>
        <ul class="list-inline">
        
        </ul>
    </footer>

<script src="js/checkout.js"></script>
  </body>
</html>
