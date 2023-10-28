
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    Connection co = null;
    String username = session.getAttribute("username").toString();
    String tusername = request.getParameter("tusername");
    String bookingid = request.getParameter("bookingid");
    String tlocation = request.getParameter("tlocation");
    String rating = request.getParameter("rating");
    String address = request.getParameter("address");
    String device = request.getParameter("device");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mob");
    // String expery = request.getParameter("expery");
    //  String device = request.getParameter("device");

    Random r = new Random();
    int j = r.nextInt(10000 - 5000) + 5000;

    try {
        co = databasecon.getconnection();
        PreparedStatement pst2 = co.prepareStatement("insert into response(tusername,tlocation,device,email,address,mobile,Bookingid,rating) values(?,?,?,?,?,?,?,?)");
        pst2.setString(1, tusername);
        pst2.setString(2, tlocation);
        pst2.setString(3, device);
        pst2.setString(4, email);
        pst2.setString(5, address);
        pst2.setString(6, mobile);
        pst2.setInt(7, j);
        pst2.setString(8, rating);

        int i = pst2.executeUpdate();
        int count=0;
        if (i > 0) {
            Statement st = co.createStatement();
            String query = "SELECT COUNT(*) FROM response WHERE email='" + email + "'";
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                count = rs.getInt("COUNT(*)");
            }
            int totalrating =  0;
            String query1 = "SELECT rating from response where email='" + email + "'";
            Statement st1 = co.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while (rs1.next()) {
                totalrating += Integer.parseInt(rs1.getString("rating"));
            }
            double avg = Double.valueOf(totalrating)/Double.valueOf(count);

            PreparedStatement pst1 = co.prepareStatement("update tech set rating='" + avg + "' where email='" + email + "'");
            pst1.executeUpdate();

            response.sendRedirect("rating.jsp?m1=rating_success");
        } else {
            response.sendRedirect("rating.jsp?m2=rating_failed");
        }
    } catch (SQLException e) {
        out.print(e.getMessage());
    }
%>


