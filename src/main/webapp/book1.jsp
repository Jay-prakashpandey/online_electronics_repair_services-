<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Online Electronic Easy Repair</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
        <script src="main.js"></script>
        <script src="http://maps.google.com/maps/api/js?libraries=places&region=uk&language=en&sensor=true"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 

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
                    <a href="customerhome.jsp" >Home</a>
                </li>
                <li>
                    <a href="book.jsp" class="active">Book</a>
                </li>
                <li>
                    <a href="viewrating.jsp" >View Ratings</a>
                </li>
                <li>
                    <a href="status.jsp" >Status</a>
                </li>
                <li>
                    <a href="viewbill.jsp" >View Bill</a>
                </li>
                <li>
                    <a href="history.jsp" >History</a>
                </li>
                <li>
                    <a href="ewaste.jsp" >E-Waste</a>
                </li>
                <li>
                    <a href="index.html"  >Logout</a>
                </li>

            </ul>
        </nav>
        <br><br><br>
        <%
            String device = request.getParameter("device");
            String email = request.getParameter("email");
            String address = request.getParameter("Address");
            String mobile = request.getParameter("mobile");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            Connection co = databasecon.getconnection();
            PreparedStatement pst = co.prepareStatement("select * from tech where address = '"+address+"' and ttype='"+device+"'");
            ResultSet rs = pst.executeQuery();
            if(rs.next()==false){
        
    response.sendRedirect("book.jsp?m1=notavailable");
    }else{%>
    <center><table class="table">
            <tr>
                <th>Technician</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Rating</th>
                <th>Book</th>
            </tr>
            <%do{%>
            <tr>
                <td><%=rs.getString("username")%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(12)%></td>
                <td><a href="bookact.jsp?device=<%=device%>&email=<%=email%>&Address=<%=address%>&mobile=<%=mobile%>&latitude=<%=latitude%>&longitude=<%=longitude%>"><button style="cursor: pointer">Book</button></a></td>
            </tr>
            <%}while(rs.next());}%>
        </table></center>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </body>

</html>