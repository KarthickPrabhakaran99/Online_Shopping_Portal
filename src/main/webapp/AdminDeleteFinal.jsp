<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
HttpSession httpSession = request.getSession();

if(httpSession.getAttribute("UserId") !=null){


}
else{
		response.sendRedirect("html/HomePage.html");
	 }
MysqlConnection mysqlConnection = new MysqlConnection();
   
        int productId = Integer.parseInt( request.getParameter("id"))  ;
       
        
       
       mysqlConnection.deleteProduct(productId);
 
      
        %>
        
        <script>  
            alert("Record Deleted");          
       </script>
    <%         
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductAdmin.jsp");
    requestDispatcher.forward(request, response);
    
 
%>  