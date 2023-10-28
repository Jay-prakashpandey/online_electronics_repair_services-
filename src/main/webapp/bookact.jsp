
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co = null;
    String device = request.getParameter("device");
    String email = request.getParameter("email");
    String address = request.getParameter("Address");
    String mobile = request.getParameter("mobile");
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    try {
        co = databasecon.getconnection();

        PreparedStatement pst2 = co.prepareStatement("insert into booking(device,email,address,mobile,latitude,longitude) values(?,?,?,?,?,?)");
        pst2.setString(1, device);
        pst2.setString(2, email);
        pst2.setString(3, address);
        pst2.setString(4, mobile);
        pst2.setString(5, latitude);
        pst2.setString(6, longitude);

        int i = pst2.executeUpdate();

        if (i > 0) {
            response.sendRedirect("book.jsp?m3=booking_success");
        } else {
            response.sendRedirect("book.jsp?m2=booking_failed");
        }
    } catch (SQLException e) {
        out.print(e.getMessage());
    }
%>





