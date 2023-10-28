
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String ttype = request.getParameter("ttype");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
      String mobile = request.getParameter("mobile");
     
  
   
   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update tech set status='activated' where username='"+username+"' and email='"+email+"' ");
       
            
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("viewtech.jsp?m1=activation_success"); 
      }
      else{
          response.sendRedirect("viewtech.jsp?m2=activation_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>





