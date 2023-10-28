
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String tusername = request.getParameter("tusername");
    String tlocation = request.getParameter("tlocation");
    String email = request.getParameter("email");
  //  String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String bookingid = request.getParameter("bookingid");
    String amount = request.getParameter("amount");
    String device = request.getParameter("device");

   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("insert into bill(tusername,tlocation,email,mobile,bookingid,amount,device) values(?,?,?,?,?,?,?)");
        pst2.setString(1,tusername);
         pst2.setString(2,tlocation);
          pst2.setString(3,email);
           pst2.setString(4,mobile);
            pst2.setString(5,bookingid);
               pst2.setString(6,amount);
                pst2.setString(7,device);
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("generatebill.jsp?m1=bill_success"); 
      }
      else{
          response.sendRedirect("generatebill.jsp?m2=bill_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>


