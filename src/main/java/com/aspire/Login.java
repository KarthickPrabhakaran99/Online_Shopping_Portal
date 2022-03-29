package com.aspire;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.database.MysqlConnection;


//LOGIN SERVLET:
@WebServlet("/login")
public class Login extends HttpServlet

{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
// Post request:
public void doPost(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse )throws IOException, ServletException {
	MysqlConnection mysqlConnection  = new MysqlConnection();
	 HttpSession httpSession = httpServletRequest.getSession();
	String user = "Guest";
	 if(httpSession.getAttribute("UserId") !=null){
		 try {
	  int id= (int)httpSession.getAttribute("UserId");
	 	ResultSet resultSet = mysqlConnection.customerInformationRetrival(id);
	 	  String type =resultSet.getString("type");
	 	 if(type.equals("User")) {
	    	  
			 httpServletRequest.getRequestDispatcher("index.jsp").forward(httpServletRequest, httpServletResponse);
			}
			 if(type.equals("Admin"))
			 {
				 httpServletRequest.getRequestDispatcher("Admin.jsp").forward(httpServletRequest, httpServletResponse);
			 }
		 
		 
		 }
		 catch (Exception e) {
		e.printStackTrace();
		}
	 
	 
	 }else{
		 httpServletResponse.sendRedirect("html/HomePage.html");
	 }
	
}
}
