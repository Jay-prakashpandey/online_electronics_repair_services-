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
 * Servlet implementation class viewbill2
 */
@WebServlet("/viewbill2")
public class viewbill2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewbill2() {
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
			System.out.print(e.getMessage());
		    }
		
		doGet(request, response);
	}

}
