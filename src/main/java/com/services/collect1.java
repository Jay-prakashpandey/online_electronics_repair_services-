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
 * Servlet implementation class collect1
 */
@WebServlet("/collect1")
public class collect1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public collect1() {
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
	    String mobile = request.getParameter("mobile");
	    String items = request.getParameter("items");
	    String address = request.getParameter("address");
	   
	     
	  
	   
	   try
			{
	         co = databasecon.getconnection();
	                    
	        PreparedStatement pst2=co.prepareStatement("update ewaste set status='collected' where username='"+username+"'  ");
	       
	            
		int i= pst2.executeUpdate();
	      
	      if(i>0){
	       response.sendRedirect("collect.jsp?m1=collected_success"); 
	      }
	      else{
	          response.sendRedirect("collect.jsp?m2=collected_failed"); 
	      }
	       }
		  
		catch(SQLException e)
	        {
			System.out.print(e.getMessage());
		    }  
		doGet(request, response);
	}

}
