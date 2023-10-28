
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co=null;
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   
    try{
       
    co = databasecon.getconnection();
    Statement st = co.createStatement();
    ResultSet rs = st.executeQuery("select * from customer where username= '"+username+"' and password='"+password+"'");
    if(rs.next())
    {
     String email=rs.getString(4);
     String address=rs.getString(5);
         session.setAttribute("username", username);
          session.setAttribute("email", email);
          session.setAttribute("address", address);
                
    response.sendRedirect("customerhome.jsp?msg=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("customer.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    //System.out.println("Error in cloudlogact"+e.getMessage());
    }
%>





