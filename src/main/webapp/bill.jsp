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
                <a href="generatebill.jsp" class="active" >Generate Bill</a>
            </li>
             <li>
                <a href="vrating.jsp" >View Ratings</a>
            </li>
            <li>
                <a href="index.html"  >Logout</a>
            </li>
           
        </ul>
    </nav>
    <br><br><br>
   <%
             //  String tlocation = session.getAttribute("location").toString();
     String tusername = request.getParameter("tusername");
     String tlocation = request.getParameter("tlocation");
     String email = request.getParameter("email");
     String address = request.getParameter("address");
     String mobile = request.getParameter("mobile");
     String bookingid = request.getParameter("bookingid");
      String device = request.getParameter("device");
                    %>
                    <br><br>
  
 <div class="login" style="width: 560px; margin-top: 100px;">
        <form action="billact.jsp" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="tusername" value="<%=tusername%>" required="" readonly="">
                            <span>Technician</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="text" name="tlocation" value="<%=tlocation%>" required="" readonly="">
                            <span>tlocation</span>
                        </div>
                    </td>
                </tr>
                  <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="email" name="email" value="<%=email%>" required="" readonly="">
                            <span>Customer Email</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="tel" name="mobile" value="<%=mobile%>" required="" readonly="">
                            <span>Mobile</span>
                        </div>
                    </td>
                </tr>
                  <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="device" value="<%=device%>" required="" readonly="">
                            <span>Device</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="text" name="address" value="<%=address%>" required="" readonly="" >
                            <span>Customer address</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="number" name="bookingid" value="<%=bookingid%>" required="" readonly="">
                            <span>Booking ID</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="number" name="amount"  required="" >
                            <span>Amount in Rs</span>
                        </div>
                    </td>
                </tr>
              
            </table>
            <div class="input-group">
                <button class="btn-hover color-9">Generate Bill</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
</body>

</html>