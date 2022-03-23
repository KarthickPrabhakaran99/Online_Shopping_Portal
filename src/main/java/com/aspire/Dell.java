package com.aspire;

public class Dell {
final private int productId;
final private String productName;
final private float productPrice;
final private int productQuantity;

 Dell(int productQuantity, float productPrice, String productName, int productId) {
	this.productId = productId;
	this.productName = productName;
	this.productPrice = productPrice;
	this.productQuantity = productQuantity;
	 
 }

public int getProductId() {
	return productId;
}

public String getProductName() {
	return productName;
}

public float getProductPrice() {
	return productPrice;
}

public int getProductQuantity() {
	return productQuantity;
}
	


}
