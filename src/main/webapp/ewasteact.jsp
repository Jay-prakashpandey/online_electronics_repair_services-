
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String mobile = request.getParameter("mobile");
 //   String ttype = request.getParameter("ttype");
    String items = request.getParameter("items");
    String address = request.getParameter("address");

   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into ewaste(username,mobile,items,address) values(?,?,?,?)");
        pst2.setString(1,username);
         pst2.setString(2,mobile);
          pst2.setString(3,items);
           pst2.setString(4,address);
        
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("ewaste.jsp?m1=success"); 
      }
      else{
          response.sendRedirect("ewaste.jsp?m2=failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>





