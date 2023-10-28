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
 * Servlet implementation class billact
 */
@WebServlet("/billact")
public class billact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public billact() {
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
	    String tlocation = request.getParameter("tlocation");
	    String email = request.getParameter("email");
	  //  String email = request.getParameter("email");
	    String mobile = request.getParameter("mobile");
	    String bookingid = request.getParameter("bookingid");
	    String amount = request.getParameter("amount");
	    String device = request.getParameter("device");

	   try
			{
	         co = databasecon.getconnection();
	                    
	        PreparedStatement pst2=co.prepareStatement("insert into bill(tusername,tlocation,email,mobile,bookingid,amount,device) values(?,?,?,?,?,?,?)");
	        pst2.setString(1,tusername);
	         pst2.setString(2,tlocation);
	          pst2.setString(3,email);
	           pst2.setString(4,mobile);
	            pst2.setString(5,bookingid);
	               pst2.setString(6,amount);
	                pst2.setString(7,device);
		int i= pst2.executeUpdate();
	      
	      if(i>0){
	       response.sendRedirect("generatebill.jsp?m1=bill_success"); 
	      }
	      else{
	          response.sendRedirect("generatebill.jsp?m2=bill_failed"); 
	      }
	       }
		  
		catch(SQLException e)
	        {
			System.out.print(e.getMessage());
		    }
		
		doGet(request, response);
	}

}
