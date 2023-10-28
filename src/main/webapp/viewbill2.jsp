
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String tusername = request.getParameter("tusername");
    String bookingid = request.getParameter("bookingid");
    String amount = request.getParameter("amount");
   // String email = request.getParameter("email");
   String cardnumber = request.getParameter("cardnumber");
    String cvv = request.getParameter("cvv");
    String expery = request.getParameter("expery");
  //  String device = request.getParameter("device");

   try
		{
         co = databasecon.getconnection();
                    
        PreparedStatement pst2=co.prepareStatement("update bill set status='paid' where bookingid='"+bookingid+"'");
       
	int i= pst2.executeUpdate();
      
      if(i>0){
       response.sendRedirect("viewbill.jsp?m1=paid_success"); 
      }
      else{
          response.sendRedirect("viewbill.jsp?m2=paid_failed"); 
      }
       }
	  
	catch(SQLException e)
        {
		out.print(e.getMessage());
	    }  
%>


