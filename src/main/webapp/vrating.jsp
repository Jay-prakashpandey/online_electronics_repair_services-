<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Online Electronic Easy Repair</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <script src="main.js"></script>
    
</head>


<body style="background: linear-gradient(to right, rgb(198, 255, 221), rgb(251, 215, 134), rgb(247, 121, 125));">
    <!-- Main Header -->
    <header class="main-header">
        <h1>Online Electronic Easy Repair</h1>
    </header>
    <!-- Navbar -->
    <nav>
   <ul>
            <li>
                <a href="techhome.jsp" >Home</a>
            </li>
             <li>
                <a href="viewbooking.jsp" >View Bookings</a>
            </li>
              <li>
                <a href="generatebill.jsp" >Generate Bill</a>
            </li>
             <li>
                <a href="vrating.jsp" class="active" >View Ratings</a>
            </li>
            <li>
                <a href="index.html"  >Logout</a>
            </li>
           
        </ul>
    </nav>
    <br><br><br>
   <%
                 //  String category = request.getParameter("category");
   String username = session.getAttribute("username").toString();
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from response where tusername='"+username+"'");
        ResultSet rs=pst.executeQuery();
                    %>
<center>
                    <table class="table table-dark table-striped">
    <thead>
      <tr>
          
        <th>TUsername</th>
         <th>Technician_Location</th>
        <th>Device</th>
        <th>Customer_Address</th>
        <th>BookingId</th>
         <th>Rating</th>
        
         
       
      </tr>
    </thead>
     <%
        while(rs.next()){
           
        %>
    <tbody>
      <tr>
         
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(5)%></td>
          <td><%=rs.getString(7)%></td>
           <td><%=rs.getString(8)%></td>
            
             
            
          
      </tr>
    </tbody>
     <%
        }
        %>
  </table>
</center>
  <% }
	catch(Exception e)
	{
		//System.out.println(e);
	}
	%>	

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- Main Footer -->
    <!-- <footer class="main-footer" style="background-color: transparent; background-image: none;">
        <p>Developed & Maintained by
            <a href="https://www.1000projects.com/" target="_blank">
                <i class="fa fa-user-circle"></i> 1000 Projects
            </a>
        </p>
    </footer> -->

</body>

</html>