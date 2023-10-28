package com.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseconnection.databasecon;

/**
 * Servlet implementation class adminact
 */
@WebServlet("/adminact")
public class adminact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminact() {
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
	   
	    try{
	       
	    co = databasecon.getconnection();
	    Statement st = co.createStatement();
	    ResultSet rs = st.executeQuery("select * from admin where username= '"+username+"' and password='"+password+"'");
	    if(rs.next())
	    {
	                
	    response.sendRedirect("adminhome.jsp?msg=Login_Successfull");
	    }
	    else 
	    {
	    response.sendRedirect("admin.jsp?msg1=LoginFail");
	    }
	    }
	    catch(Exception e)
	    {
	    //System.out.println("Error in cloudlogact"+e.getMessage());
	    }
		
		doGet(request, response);
	}

}
