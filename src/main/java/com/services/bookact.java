package com.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseconnection.databasecon;

/**
 * Servlet implementation class bookact
 */
@WebServlet("/bookact")
public class bookact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookact() {
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
	        System.out.print(e.getMessage());
	    }
		
		doGet(request, response);
	}

}
