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
 * Servlet implementation class ewasteact
 */
@WebServlet("/ewasteact")
public class ewasteact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ewasteact() {
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
	 //   String ttype = request.getParameter("ttype");
	    String items = request.getParameter("items");
	    String address = request.getParameter("address");

	   try
			{
	         co = databasecon.getconnection();
	                    
	        PreparedStatement pst2=co.prepareStatement("insert into ewaste(username,mobile,items,address) values(?,?,?,?)");
	        pst2.setString(1,username);
	         pst2.setString(2,mobile);
	          pst2.setString(3,items);
	           pst2.setString(4,address);
	        
		int i= pst2.executeUpdate();
	      
	      if(i>0){
	       response.sendRedirect("ewaste.jsp?m1=success"); 
	      }
	      else{
	          response.sendRedirect("ewaste.jsp?m2=failed"); 
	      }
	       }
		  
		catch(SQLException e)
	        {
			System.out.print(e.getMessage());
		    } 
		
		doGet(request, response);
	}

}
