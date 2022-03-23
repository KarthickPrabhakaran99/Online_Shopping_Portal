package com.aspire;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.MysqlConnection;

/*
 * Title:Online Shopping Portal 
 * Author:Karthick Prabakaran
 * Created At:1 Dec 2021
 * Reviewed BY:Akshaya Rajagopal
 * Modifies At:25:01:2022
 * */
//REGISTER SERVLET:
@WebServlet("/register")
public class Register extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse  ) throws IOException, ServletException {
		
		String name = httpServletRequest.getParameter("name-input");
		String email = httpServletRequest.getParameter("email-input");
		String password= httpServletRequest.getParameter("password-input");
		String type = httpServletRequest.getParameter("type-input");
		RegisteredInformation registeredInformation = new RegisteredInformation(name,email,type,password);
		MysqlConnection mysqlConnection = new MysqlConnection();
		if(mysqlConnection.dataBaseAccountCreate(registeredInformation)) {
			HttpSession httpSession = httpServletRequest.getSession();
			 httpSession.setAttribute("User", name);
			 
			 if(type.equals("User")) {
			RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("index.jsp");
			requestDispatcher.forward(httpServletRequest, httpServletResponse);}
			 if(type.equals("Admin"))
			 {
				 RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("Admin.jsp");
					requestDispatcher.forward(httpServletRequest, httpServletResponse);
			 }
			System.out.println("Data stored successfully");
		}
		else {
			System.out.println("Please check the database");
		}
		PrintWriter outPrintWriter = httpServletResponse.getWriter();
		outPrintWriter.println(name+""+email+""+password);
//		System.out.println("Hello ");
//		System.out.print(email+" "+password);
		
	}

}
