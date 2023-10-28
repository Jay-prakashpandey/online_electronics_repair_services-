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
 * Servlet implementation class techregact
 */
@WebServlet("/techregact")
public class techregact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public techregact() {
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
	    String password = request.getParameter("password");
	    String ttype = request.getParameter("ttype");
	    String email = request.getParameter("email");
	    String gender = request.getParameter("gender");
	    String dob = request.getParameter("dob");
	    String address = request.getParameter("address");
	      String mobile = request.getParameter("mobile");
	      String latitude = request.getParameter("latitude");
	    String longitude = request.getParameter("longitude");
	  
	   
	   try
			{
	         co = databasecon.getconnection();
	                    
	        PreparedStatement pst2=co.prepareStatement("insert into tech(username,password,ttype,email,gender,dob,address,mobile,latitude,longitude) values(?,?,?,?,?,?,?,?,?,?)");
	        pst2.setString(1,username);
	         pst2.setString(2,password);
	          pst2.setString(3,ttype);
	           pst2.setString(4,email);
	            pst2.setString(5,gender);
	               pst2.setString(6,dob);
	         pst2.setString(7,address);
	          pst2.setString(8,mobile);
	           pst2.setString(9,latitude);
	            pst2.setString(10,longitude);
	            
		int i= pst2.executeUpdate();
	      
	      if(i>0){
	       response.sendRedirect("technician.jsp?m1=reg_success"); 
	      }
	      else{
	          response.sendRedirect("techreg.jsp?m2=reg_failed"); 
	      }
	       }
		  
		catch(SQLException e)
	        {
			System.out.print(e.getMessage());
		    }
		
		doGet(request, response);
	}

}
