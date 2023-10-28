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
                <a href="adminhome.jsp">Home</a>
            </li>
             <li>
                <a href="viewtech.jsp" class="active">View Technician</a>
            </li>
             <li>
                <a href="collect.jsp" >Collect E-Waste</a>
            </li>
            <li>
                <a href="index.html">Logout</a>
            </li>
           
        </ul>
    </nav>
    <br><br><br>
   <%
                 //  String category = request.getParameter("category");
    
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from tech");
        ResultSet rs=pst.executeQuery();
                    %>
<center>
                    <table class="table table-dark table-striped">
    <thead>
      <tr>
          
        <th>Username</th>
        <th>Ttype</th>
        <th>Email</th>
        <th>Gender</th>
         <th>DOB</th>
        <th>Address</th>
        <th>Mobile</th>
         <th>Status</th>
          <th>Active</th>
       
      </tr>
    </thead>
     <%
        while(rs.next()){
           
        %>
    <tbody>
      <tr>
         
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
         <td><%=rs.getString(5)%></td>
         <td><%=rs.getString(6)%></td>
          <td><%=rs.getString(7)%></td>
           <td><%=rs.getString(8)%></td>
           <td><%=rs.getString(11)%></td>
         <td><button style="color:black"><a href="active.jsp?username=<%=rs.getString(1)%>&ttype=<%=rs.getString(3)%>&email=<%=rs.getString(4)%>&address=<%=rs.getString(6)%>">active</a></button> </td>
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