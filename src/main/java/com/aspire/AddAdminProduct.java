package com.aspire;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.database.MysqlConnection;
@MultipartConfig
@WebServlet("/AddAdminProduct")
public class AddAdminProduct extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		int productId = Integer.parseInt( request.getParameter("product-id"))  ;
        String productName = request.getParameter("product-name");
        float productPrice = Float.parseFloat(request.getParameter("product-price"));
        int productQuantity =Integer.parseInt(  request.getParameter("product-quantity"));
        String productCategory = request.getParameter("product-category");
//        Part productImagePart = request.getPart("product-image");
//        String path = "C:/Users/Karthick/eclipse-workspace/Online Shopping Portal/src/main/webapp/images/"+productImagePart.getSubmittedFileName();
//        InputStream inputStream = productImagePart.getInputStream();
//        
//        
//        System.out.print("\n"+productImagePart.getSubmittedFileName()+"fadfas");
//        
        MysqlConnection mysqlConnection = new MysqlConnection();
       
          mysqlConnection.addProduct(productId, productName, productPrice, productQuantity,productCategory);
        
//        byte[] bytes= new byte[inputStream.available()];
//		inputStream.read(bytes);
//		FileOutputStream fileOutputStream = new FileOutputStream(path);
//		fileOutputStream.write(bytes);
//		fileOutputStream.flush();
//		fileOutputStream.close();
//     
	  
      
       response.sendRedirect("AdminAdd.jsp?dataUpdate=success");
     
		
		
	}

}
