package com.aspire;

import java.io.IOException;
import java.sql.ResultSet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:25:01:2022
 * */
import javax.servlet.http.HttpSession;

import com.database.MysqlConnection;
/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:25:01:2022
 * */

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
	
	String email = httpServletRequest.getParameter("email-input");
	String password= httpServletRequest.getParameter("password-input");
	MysqlConnection mysqlConnection = new MysqlConnection();
	ResultSet resultSet = null ;
	try {
		
		 resultSet = mysqlConnection.passwordValidation(email, password);
	} catch (Exception e) {
	
		e.printStackTrace();
	}

	try {
		int id= resultSet.getInt("id");
		String name= mysqlConnection.customerInformationRetrival(id).getString("name");
		System.out.println(id);
		if(id!=0) {
			HttpSession httpSession =httpServletRequest.getSession();
	       httpSession.setAttribute("UserId", id);
	       httpSession.setAttribute("User",name );
	       String type =resultSet.getString("type");
	       if(type.equals("User")) {
				RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("index.jsp");
				requestDispatcher.forward(httpServletRequest, httpServletResponse);}
				 if(type.equals("Admin"))
				 {
					 RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("Admin.jsp");
						requestDispatcher.forward(httpServletRequest, httpServletResponse);
				 }
	
	 System.out.println("welcome"+ id + type);
		}
		
		else {	
			
		}
	} catch (Exception e) {

		RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("PasswordError.jsp");
		requestDispatcher.forward(httpServletRequest, httpServletResponse);
		System.out.println(e.getMessage());
	
	}

	
}
}
