<%@page import="com.database.MysqlConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
MysqlConnection mysqlConnection = new MysqlConnection();
   
        int categoryId = Integer.parseInt( request.getParameter("id"))  ;
       
        
       
       mysqlConnection.deleteCategories(categoryId);
 
      
        %>
        
        <script>  
            alert("Category Deleted");          
       </script>
    <%         
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("CategoriesAdmin.jsp");
    requestDispatcher.forward(request, response);
    
 
%>  