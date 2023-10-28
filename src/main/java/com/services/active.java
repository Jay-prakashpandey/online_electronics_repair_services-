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
 * Servlet implementation class active
 */
@WebServlet("/active")
public class active extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public active() {
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
	    String username = request.getParameter("username");
	    String ttype = request.getParameter("ttype");
	    String email = request.getParameter("email");
	    String gender = request.getParameter("gender");
	    String dob = request.getParameter("dob");
	    String address = request.getParameter("address");
	      String mobile = request.getParameter("mobile");
	     
	  
	   
	   try
			{
	         co = databasecon.getconnection();
	                    
	        PreparedStatement pst2=co.prepareStatement("update tech set status='activated' where username='"+username+"' and email='"+email+"' ");
	       
	            
		int i= pst2.executeUpdate();
	      
	      if(i>0){
	       response.sendRedirect("viewtech.jsp?m1=activation_success"); 
	      }
	      else{
	          response.sendRedirect("viewtech.jsp?m2=activation_failed"); 
	      }
	       }
		  
		catch(SQLException e)
	        {
			System.out.print(e.getMessage());
		    }
		doGet(request, response);
	}

}
