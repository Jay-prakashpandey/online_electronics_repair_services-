
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String password = request.getParameter("password");
 //   String ttype = request.getParameter("ttype");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
 //   String dob = request.getParameter("dob");
    String address = request.getParameter("address");
      String mobile = request.getParameter("mobile");
      String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
  
   
   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into customer(username,password,gender,email,address,mobile,latitude,longitude) values(?,?,?,?,?,?,?,?)");
        pst2.setString(1,username);
         pst2.setString(2,password);
          pst2.setString(3,gender);
           pst2.setString(4,email);
          pst2.setString(5,address);
          pst2.setString(6,mobile);
           pst2.setString(7,latitude);
            pst2.setString(8,longitude);
            
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("customer.jsp?m1=reg_success"); 
      }
      else{
          response.sendRedirect("customerreg.jsp?m2=reg_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>





