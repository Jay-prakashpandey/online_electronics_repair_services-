<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co = null;
 //   String
    String tlocation = session.getAttribute("location").toString();
    String tusername = session.getAttribute("username").toString();
    String device = request.getParameter("device");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String mobile = request.getParameter("mobile");
Random r = new Random();
    int j = r.nextInt(10000 - 5000) + 5000;
    String skey = j+"";
    try {
        co = databasecon.getconnection();
        PreparedStatement pst1 = co.prepareStatement("update booking set status='booked', bookingid='"+j+"' where email='" + email + "' and device='" + device + "' and address='" + address + "' ");
        pst1.executeUpdate();
        PreparedStatement pst2 = co.prepareStatement("insert into response(tusername,tlocation,device,email,address,mobile,bookingid) values(?,?,?,?,?,?,?)");
         pst2.setString(1, tusername);
        pst2.setString(2, tlocation);
        pst2.setString(3, device);
        pst2.setString(4, email);
        pst2.setString(5, address);
        pst2.setString(6, mobile);
         pst2.setString(7, skey);
        pst2.executeUpdate();
        int i = pst1.executeUpdate();

        if (i > 0) {
            response.sendRedirect("viewtech.jsp?m1=booked_success");
        } else {
            response.sendRedirect("viewtech.jsp?m3=failed");
        }
    } catch (SQLException e) {
        out.print(e.getMessage());
    }
%>





