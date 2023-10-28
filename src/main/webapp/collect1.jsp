
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String mobile = request.getParameter("mobile");
    String items = request.getParameter("items");
    String address = request.getParameter("address");
   
     
  
   
   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update ewaste set status='collected' where username='"+username+"'  ");
       
            
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("collect.jsp?m1=collected_success"); 
      }
      else{
          response.sendRedirect("collect.jsp?m2=collected_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>





