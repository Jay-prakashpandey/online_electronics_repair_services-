package com.services;

import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.databasecon;

/**
 * Servlet implementation class rating2
 */
@WebServlet("/rating2")
public class rating2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rating2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection co = null;
		HttpSession session=request.getSession();
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
	            Statement st = (Statement) co.createStatement();
	            String query = "SELECT COUNT(*) FROM response WHERE email='" + email + "'";
	            ResultSet rs = ((java.sql.Statement) st).executeQuery(query);
	            if (rs.next()) {
	                count = rs.getInt("COUNT(*)");
	            }
	            int totalrating =  0;
	            String query1 = "SELECT rating from response where email='" + email + "'";
	            Statement st1 = (Statement) co.createStatement();
	            ResultSet rs1 = ((java.sql.Statement) st1).executeQuery(query1);
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
	        System.out.print(e.getMessage());
	    }
		doGet(request, response);
	}

}
