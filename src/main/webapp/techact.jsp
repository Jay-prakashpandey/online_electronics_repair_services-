
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
    ResultSet rs = st.executeQuery("select * from tech where username= '"+username+"' and password='"+password+"' and status='activated'");
    if(rs.next())
    {
        String location=rs.getString(7);
         session.setAttribute("username", username);
         session.setAttribute("location", location);
                
    response.sendRedirect("techhome.jsp?msg=Login_Successfull");
    }
    else 
    {
    response.sendRedirect("technician.jsp?msg1=LoginFail");
    }
    }
    catch(Exception e)
    {
    //System.out.println("Error in cloudlogact"+e.getMessage());
    }
%>





