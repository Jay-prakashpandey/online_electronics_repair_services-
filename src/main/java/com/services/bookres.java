package com.services;

import java.io.IOException;

import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseconnection.databasecon;

/**
 * Servlet implementation class bookres
 */
@WebServlet("/bookres")
public class bookres extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookres() {
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
		        System.out.print(e.getMessage());
		    }
		
		doGet(request, response);
	}

}
