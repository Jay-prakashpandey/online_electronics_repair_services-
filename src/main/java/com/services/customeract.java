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
import javax.servlet.http.HttpSession;

import databaseconnection.databasecon;

/**
 * Servlet implementation class customeract
 */
@WebServlet("/customeract")
public class customeract extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customeract() {
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
		HttpSession session=request.getSession();
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	   
	    try{
	       
	    co = databasecon.getconnection();
	    Statement st = co.createStatement();
	    ResultSet rs = st.executeQuery("select * from customer where username= '"+username+"' and password='"+password+"'");
	    if(rs.next())
	    {
	     String email=rs.getString(4);
	     String address=rs.getString(5);
	         session.setAttribute("username", username);
	          session.setAttribute("email", email);
	          session.setAttribute("address", address);
	                
	    response.sendRedirect("customerhome.jsp?msg=Login_Successfull");
	    }
	    else 
	    {
	    response.sendRedirect("customer.jsp?msg1=LoginFail");
	    }
	    }
	    catch(Exception e)
	    {
	    //System.out.println("Error in cloudlogact"+e.getMessage());
	    }
		doGet(request, response);
	}

}
