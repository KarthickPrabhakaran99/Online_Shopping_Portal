package com.aspire;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.database.MysqlConnection;
@MultipartConfig
@WebServlet("/AddAdminCategory")
public class AddAdminCategory extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		System.out.print("karthick");
		MysqlConnection mysqlConnection = new MysqlConnection();
	      int categoryId = Integer.parseInt( request.getParameter("category-id"))  ;
	      String categoryName = request.getParameter("category-name");
	      mysqlConnection.addcategories(categoryId, categoryName);
	     
	    
	      Part categoryImagePart = request.getPart("category-image");
	      String path = "C:/Users/Karthick/eclipse-workspace/Online Shopping Portal/src/main/webapp/images/"+categoryImagePart.getSubmittedFileName();
	      InputStream inputStream = categoryImagePart.getInputStream();
	      
	   
	    
	    byte[] bytes= new byte[inputStream.available()];
		inputStream.read(bytes);
		FileOutputStream fileOutputStream = new FileOutputStream(path);
		fileOutputStream.write(bytes);
		fileOutputStream.flush();
		fileOutputStream.close();

   
      
       response.sendRedirect("AdminCategoryAdd.jsp?dataUpdate=success");
     
		
		
	}

}
