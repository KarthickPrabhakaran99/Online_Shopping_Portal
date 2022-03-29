package com.filters;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.MysqlConnection;
import com.encryptDecrypt.PasswordEncryption;


@WebFilter("/login")
public class passwordValidationFilter implements Filter {

   
 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		MysqlConnection mysqlconnection = new MysqlConnection();
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		String email = httpServletRequest.getParameter("email-input");
		String password= httpServletRequest.getParameter("password-input");
		System.out.println("Filter Called");
		
	try {
		PasswordEncryption passwordEncryption = new PasswordEncryption();
		password = passwordEncryption.toHexString(passwordEncryption.getSHA(password));
		ResultSet resultSet = mysqlconnection.passwordValidation(email, password);
		
		
		
		System.out.println(resultSet.getInt("case"));
		
		
		if(resultSet.getInt("case")==1) {
         resultSet = mysqlconnection.customerInformationRetrival(mysqlconnection.customerIdUsingEmailResultSet(email).getInt("id"));
			int id= resultSet.getInt("id");
			String name= resultSet.getString("name");
			System.out.println(id);
			if(id!=0) {
				HttpSession httpSession =httpServletRequest.getSession();
		       httpSession.setAttribute("UserId", id);
		       httpSession.setAttribute("User",name );
		     
		       System.out.println(response.isCommitted());
		      
		
			chain.doFilter(httpServletRequest, httpServletResponse);
	}
			
		
		
		
		
		
		
		
		
	} 
		else {
			
			RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher("PasswordError.jsp");
			requestDispatcher.forward(httpServletRequest, httpServletResponse);
			
			
		}
	
	}
		catch (Exception e) {
			System.out.println(e.getMessage());
	
	}
	
	
	
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
