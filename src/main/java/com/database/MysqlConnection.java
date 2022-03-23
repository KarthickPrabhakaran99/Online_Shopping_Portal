package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:24:01:2022
 * */
//MYSQL CONNECTION CLASS:
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.aspire.RegisteredInformation;

/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:25:01:2022
 * */

public class MysqlConnection {

	// DATABASE CONNECTION:

		public Connection dataBaseConnect() throws Exception {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/aspire-online-shopping-portal";
			String uname = "root";
			String password = "Karthi@1999";
			Connection connection = DriverManager.getConnection(url, uname, password);
			return connection;
		}
		// ACCOUNT CREATION:
		public boolean dataBaseAccountCreate(RegisteredInformation registeredInformation) {
			int userId = (int)(Math.random()*(1000000000-0+1)+0);  
			String query = "INSERT INTO registered_Data (name,type,email,password,Id)values(?,?,?,?,?)";

			try {
				Connection connection = dataBaseConnect();

				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, registeredInformation.getName());
				preparedStatement.setString(2, registeredInformation.getType());
				preparedStatement.setString(3, registeredInformation.getEmail());
				preparedStatement.setString(4, registeredInformation.getPassword());
				preparedStatement.setInt(5, userId);
				

				preparedStatement.executeUpdate();

				preparedStatement.close();
				connection.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return false;
			}

			return true;

		}
		// PASSWORD VALIDATION:
		public ResultSet passwordValidation(String email, String password) throws Exception {

			String query = "SELECT name,id,type FROM registered_Data WHERE email ='"
					+ email + "' AND password ='" + password + "'";
			try {
				Connection connection = dataBaseConnect();
				PreparedStatement preparedstatement = connection.prepareStatement(query);

				
				ResultSet resultSet = preparedstatement.executeQuery(query);
				resultSet.next();

				return resultSet;
			} catch (Exception e) {
System.out.println(e.getMessage()+"\nCannot able to fetch data ");
				return null;
			}
		}
//		USER DATA RETRIVAL:
		public ResultSet customerInformationRetrival(int id) throws Exception {

			String query = "SELECT name,email,password,address_line1,address_line2,country,postal_code,state,card_number,card_expiry_date FROM registered_data WHERE id ='"
					+ id + "'";
			try {
				Connection connection = dataBaseConnect();
				PreparedStatement preparedstatement = connection.prepareStatement(query);

				
				ResultSet resultSet = preparedstatement.executeQuery(query);
				resultSet.next();

				return resultSet;
			} catch (Exception e) {
System.out.println(e.getMessage()+"\nCannot able to fetch data ");
				return null;
			}
		}
		
		
		// PRODUCT RETRIVAL USING NAME:
				public ResultSet productRetrival(String productName) throws Exception {

					String query = "SELECT * FROM products WHERE product_name ='"
							+ productName + "'";
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						ResultSet resultSet = preparedstatement.executeQuery(query);
						resultSet.next();

						return resultSet;
					} catch (Exception e) {
		System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						return null;
					}
				}
				// PRODUCT RETRIVAL USING CATEGORY NAME:
				public ResultSet productRetrivalCategory(String categoryName) throws Exception {

					String query = "SELECT * FROM products WHERE product_category ='"
							+ categoryName + "'";
					System.out.print(query);
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						ResultSet resultSet = preparedstatement.executeQuery(query);
					

						return resultSet;
					} catch (Exception e) {
		System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						return null;
					}
				}
				// PRODUCT RETRIVAL:
				public ResultSet productRetrival() throws Exception {

					String query = "SELECT * FROM products;";
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						ResultSet resultSet = preparedstatement.executeQuery(query);
					

						return resultSet;
					} catch (Exception e) {
		System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						return null;
					}
				
				}
//				PRODUCT DETAILS UPDATE
				public void productDetailsUpdate(int productId,String productName,float productPrice,int productQuantity, String productCategory) {

					String query = "UPDATE products SET product_id ='"
							+ productId + "',product_name='"+productName+"',product_price='"+productPrice+"',product_quantity='"+productQuantity+"',product_category='"+productCategory+"' where product_id='"+productId +"' ;";
					System.out.print(query);
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						 preparedstatement.executeUpdate();
						
						System.out.print("card details updated");

						
					} catch (Exception e) {
		             System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						
					}
				}				

				
				
				
				
				
				
				
				
				
				
//				PRODUCT NAME RETRIVEL
				public ResultSet productNameRetrival(int productId) throws Exception {

					String query = "SELECT product_name FROM products WHERE product_id ='"
							+ productId + "'";
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						ResultSet resultSet = preparedstatement.executeQuery(query);
						resultSet.next();
					
						

						return resultSet;
					} catch (Exception e) {
		System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						return null;
					}
				}
//				CARD DETAILS UPDATE
				public void cardDetailsUpdate(String cardName,String cardNumber,int cvv,String cardExpiry,int id) {

					String query = "UPDATE registered_Data SET card_name ='"
							+ cardName + "',card_number='"+cardNumber+"',cvv='"+cvv+"',card_expiry_date='"+cardExpiry+"' where id='"+id +"' ;";
					System.out.print(query);
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						 preparedstatement.executeUpdate();
						
						System.out.print("card details updated");

						
					} catch (Exception e) {
		             System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						
					}
				}

				
				
				
//				CART Quantity UPDATE
				public void cartQuantityUpdate(int userId,int productId  ,int quantity) {

					String query = "UPDATE cart SET Quantity='"
							+ quantity + "' where user_id='"+userId +"' AND product_id ='"+productId+"' ;";
					System.out.print(query);
					try {
						Connection connection = dataBaseConnect();
						PreparedStatement preparedstatement = connection.prepareStatement(query);

						
						 preparedstatement.executeUpdate();
						
						System.out.print("card details updated");

						
					} catch (Exception e) {
		             System.out.println(e.getMessage()+"\nCannot able to fetch data ");
						
					}
				}
				
				
				
				
				
				
				
				
				
//					ORDER UPDATE IN DATABASE
					public boolean orderUpdate(String orderId,int userId,int productId,float amount,String orderDate,int count) {
						String queryOrders = "INSERT INTO orders values(?,?,?,?)";
						String queryUserProductDetailString ="INSERT INTO user_product_details values(?,?,?,?)";

						try {
							Connection connection = dataBaseConnect();

							PreparedStatement preparedStatementOrder = connection.prepareStatement(queryOrders);
							preparedStatementOrder.setString(1, orderId);
							preparedStatementOrder.setInt(2, userId);
							preparedStatementOrder.setFloat(3, amount);
							preparedStatementOrder.setString(4, orderDate);
							

							PreparedStatement preparedStatementUserProductDetails = connection.prepareStatement(queryUserProductDetailString);
							preparedStatementUserProductDetails.setString(1, orderId);
							preparedStatementUserProductDetails.setInt(2, userId);
							preparedStatementUserProductDetails.setInt(3, productId);
							preparedStatementUserProductDetails.setInt(4, count);
							
							preparedStatementOrder.executeUpdate();
							preparedStatementUserProductDetails.executeUpdate();

							preparedStatementUserProductDetails.close();
							connection.close();
						} catch (Exception e) {
							System.out.println(e.getMessage());
							return false;
						}

						return true;

						
						
					
					
				}
//					CART ORDER UPDATE
					
					public boolean cartOrderUpdate(String orderId,int userId,float amount,String orderDate) {
						String queryOrders = "INSERT INTO orders values(?,?,?,?)";
						

						try {
							Connection connection = dataBaseConnect();

							PreparedStatement preparedStatementOrder = connection.prepareStatement(queryOrders);
							preparedStatementOrder.setString(1, orderId);
							preparedStatementOrder.setInt(2, userId);
							preparedStatementOrder.setFloat(3, amount);
							preparedStatementOrder.setString(4, orderDate);
							

						
							preparedStatementOrder.executeUpdate();
							

							
							connection.close();
						} catch (Exception e) {
							System.out.println(e.getMessage());
							return false;
						}

						return true;

						
						
					
					
				}
					
//				 PRODUCT ADD IN DATABASE
					public boolean addProduct(int productId,String productName,float productPrice,int productQuantity, String productCategory) {
						String query = "INSERT INTO products values(?,?,?,?,?)";
						
						try {
							Connection connection = dataBaseConnect();

							PreparedStatement preparedstatement = connection.prepareStatement(query);
							preparedstatement.setInt(1, productId);
							preparedstatement.setString(2, productName);
							preparedstatement.setFloat(3, productPrice);
							preparedstatement.setInt(4, productQuantity);
							preparedstatement.setString(5, productCategory);
							
							preparedstatement.executeUpdate();
							
							connection.close();
						} catch (Exception e) {
							System.out.println(e.getMessage());
							return false;
						}

						return true;

						
						
					
					
				}
					
//					 PRODUCT DELETE IN DATABASE
						public boolean deleteProduct(int productId) {
							String query = "DELETE FROM products WHERE product_id='"+productId+"';";
							
							try {
								Connection connection = dataBaseConnect();

								PreparedStatement preparedstatement = connection.prepareStatement(query);
								
								preparedstatement.executeUpdate();
								
								connection.close();
							} catch (Exception e) {
								System.out.println(e.getMessage());
								return false;
							}

							return true;

							
							
						
						
					}
						// ORDER RETRIVAL:
						public ResultSet orderRetrival() throws Exception {

							String query = "SELECT * FROM orders;";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						// ORDER RETRIVAL USING USER ID:
						public ResultSet orderRetrival(int userId) throws Exception {

							String query = "SELECT * FROM orders where user_id='"+userId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						// USER PRODUCT RETRIVAL:
						public ResultSet userProductRetrival() throws Exception {

							String query = "SELECT * FROM user_product_details;";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						// USER PRODUCT RETRIVAL USING ID:
						public ResultSet userProductRetrival(int userId) throws Exception {

							String query = "SELECT * FROM user_product_details where user_id='"+userId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}

						public ResultSet userProductRetrival(String orderId) throws Exception {

							String query = "SELECT * FROM user_product_details where order_id='"+orderId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							
                        
								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						// USER PRODUCT COUNT RETRIVAL:
						public ResultSet userProductCountRetrival(String orderId) throws Exception {

							String query = "select count(*) as product_count from user_product_details where order_id='"+orderId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							
                                 resultSet.next();
								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						// ADD ELEMENT TO CART :
						public boolean addCart(int userId,int productId,String productName,float productPrice,int quantity) {
							
							String query = "INSERT INTO cart values(?,?,?,?,?)";

							try {
								Connection connection = dataBaseConnect();

								PreparedStatement preparedStatement = connection.prepareStatement(query);
								preparedStatement.setInt(1, userId);
								preparedStatement.setInt(2, productId);
								preparedStatement.setString(3, productName);
								preparedStatement.setFloat(4, productPrice);
								preparedStatement.setInt(5, quantity);
								
								

								preparedStatement.executeUpdate();

								preparedStatement.close();
								connection.close();
							} catch (Exception e) {
								System.out.println(e.getMessage());
								return false;
							}

							return true;

						}
//						CART RETRIVAL
						public ResultSet cartRetrival(int userId) throws Exception {

							String query = "SELECT * FROM cart where user_id ='"+userId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						
//						CART RETRIVAL PRODUCT UPDATE
						public ResultSet cartRetrivalProduct(int userId) throws Exception {

							String query = "SELECT * FROM cart where user_id ='"+userId+"';";
							try {
								Connection connection = dataBaseConnect();
								PreparedStatement preparedstatement = connection.prepareStatement(query);

								
								ResultSet resultSet = preparedstatement.executeQuery(query);
							

								return resultSet;
							} catch (Exception e) {
				System.out.println(e.getMessage()+"\nCannot able to fetch data ");
								return null;
							}
						
						}
						
						
//						CART DELETE IN DATABASE
						public boolean deleteCart(int productId) {
							String query = "DELETE FROM cart WHERE product_id='"+productId+"';";
							
							try {
								Connection connection = dataBaseConnect();

								PreparedStatement preparedstatement = connection.prepareStatement(query);
								
								preparedstatement.executeUpdate();
								
								connection.close();
							} catch (Exception e) {
								System.out.println(e.getMessage());
								return false;
							}

							return true;

							
							
						
						
					}
//						USER PRODUCT INSERT
						// ADD ELEMENT TO CART :
						public boolean addUserProduct(String orderId, int userId, int ProductId, int Count) {
							
							String query = "INSERT INTO  user_product_details values(?,?,?,?)";

							try {
								Connection connection = dataBaseConnect();

								PreparedStatement preparedStatement = connection.prepareStatement(query);
								preparedStatement.setString(1, orderId);
								preparedStatement.setInt(2, userId);
								preparedStatement.setInt(3, ProductId);
								preparedStatement.setInt(4, Count);
								
								
								

								preparedStatement.executeUpdate();

								preparedStatement.close();
								connection.close();
							} catch (Exception e) {
								System.out.println(e.getMessage());
								return false;
							}

							return true;

						}
						
						
						
//						CATOGRIES ADD IN DATABASE
							public boolean addcategories(int categoryId,String categoryName) {
								String query = "INSERT INTO product_categories values(?,?)";
								
								try {
									Connection connection = dataBaseConnect();

									PreparedStatement preparedstatement = connection.prepareStatement(query);
									preparedstatement.setInt(1, categoryId);
									preparedstatement.setString(2, categoryName);
									
									
									preparedstatement.executeUpdate();
									
									connection.close();
								} catch (Exception e) {
									System.out.println(e.getMessage());
									return false;
								}

								return true;

								
								
							
							
						}
//							CATEGORY DELETE IN DATABASE
							public boolean deleteCategories(int categoryId) {
								String query = "DELETE FROM product_categories WHERE category_id='"+categoryId+"';";
								
								try {
									Connection connection = dataBaseConnect();

									PreparedStatement preparedstatement = connection.prepareStatement(query);
									
									preparedstatement.executeUpdate();
									
									connection.close();
								} catch (Exception e) {
									System.out.println(e.getMessage());
									return false;
								}

								return true;

								
								
							
							
						}
//							CATEGORY  UPDATE IN DATABASE
							public void updateCategories(int categoryId,String categoryName) {

								String query = "UPDATE product_categories SET category_id ='"
										+ categoryId + "',category_name='"+categoryName+"' where category_id ='"+categoryId+"' ;";
								System.out.print(query);
								try {
									Connection connection = dataBaseConnect();
									PreparedStatement preparedstatement = connection.prepareStatement(query);

									
									 preparedstatement.executeUpdate();
									
									System.out.print("card details updated");

									
								} catch (Exception e) {
					             System.out.println(e.getMessage()+"\nCannot able to fetch data ");
									
								}
							}	
//							CATEGORY RETRIVAL
							public ResultSet categoriesRetrival() throws Exception {

								String query = "SELECT * FROM product_categories ;";
								try {
									Connection connection = dataBaseConnect();
									PreparedStatement preparedstatement = connection.prepareStatement(query);

									
									ResultSet resultSet = preparedstatement.executeQuery(query);
								

									return resultSet;
								} catch (Exception e) {
					System.out.println(e.getMessage()+"\nCannot able to fetch data ");
									return null;
								}
							
							}
//							CATEGORY RETRIVAL USING ID
							public ResultSet categoriesRetrivalID(int categoryId) throws Exception {

								String query = "SELECT * FROM product_categories where category_id='"+categoryId+"' ;";
								try {
									Connection connection = dataBaseConnect();
									PreparedStatement preparedstatement = connection.prepareStatement(query);

									
									ResultSet resultSet = preparedstatement.executeQuery(query);
								

									return resultSet;
								} catch (Exception e) {
					System.out.println(e.getMessage()+"\nCannot able to fetch data ");
									return null;
								}
							
							}
							
//							Registered Data UPDATE
							public void registeredDataUpdate(String AddressLine1, String AddressLine2, String country, String state, int pincode, int id) {

								String query = "UPDATE registered_Data SET address_line1 ='"
										+ AddressLine1 + "',address_line2='"+AddressLine2+"',country='"+country+"',state='"+state+"',postal_code='"+pincode+"' where id='"+id +"' ;";
								System.out.print(query);
								try {
									System.out.print(query);
									Connection connection = dataBaseConnect();
									PreparedStatement preparedstatement = connection.prepareStatement(query);

									
									 preparedstatement.executeUpdate();
									
									System.out.print("address details updated");

									
								} catch (Exception e) {
								
					             System.out.println(e.getMessage()+"\nCannot able to fetch data ");
									
								}
							}

							// REPORTS :
							public boolean addreport(int id, String firstName, String lastName, String email, String message, String additionalDetails ) {
					
								String query = "INSERT INTO reports values(?,?,?,?,?,?)";

								try {
									Connection connection = dataBaseConnect();

									PreparedStatement preparedStatement = connection.prepareStatement(query);
									preparedStatement.setInt(1, id);
									preparedStatement.setString(2, firstName);
									preparedStatement.setString(3, lastName);
									preparedStatement.setString(4, email);
									preparedStatement.setString(5, message);
									preparedStatement.setString(6, additionalDetails);
									

									preparedStatement.executeUpdate();

									preparedStatement.close();
									connection.close();
								} catch (Exception e) {
									System.out.println(e.getMessage());
									return false;
								}

								return true;

							}
							
//							REPORTS RETRIVAL:
							public ResultSet reportsRetrival() throws Exception {

								String query = "SELECT * FROM reports ";
								try {
									Connection connection = dataBaseConnect();
									PreparedStatement preparedstatement = connection.prepareStatement(query);

									
									ResultSet resultSet = preparedstatement.executeQuery(query);
									resultSet.next();

									return resultSet;
								} catch (Exception e) {
					System.out.println(e.getMessage()+"\nCannot able to fetch data ");
									return null;
								}
							}
							
		
	

}
