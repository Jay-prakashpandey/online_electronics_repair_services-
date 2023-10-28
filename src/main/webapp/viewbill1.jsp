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
                <a href="customerhome.jsp" >Home</a>
            </li>
             <li>
                <a href="book.jsp" >Book</a>
            </li>
            <li>
                <a href="viewrating.jsp" >View Ratings</a>
            </li>
             <li>
                <a href="status.jsp" >Status</a>
            </li>
             <li>
                <a href="viewbill.jsp" class="active">View Bill</a>
             </li>
              <li>
                <a href="history.jsp" >History</a>
            </li>
            <li>
                <a href="rating.jsp" >Give Rating</a>
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
              
    String tusername = request.getParameter("tusername");
     String tlocation = request.getParameter("tlocation");
     String email = request.getParameter("email");
   //  String address = request.getParameter("address");
     String mobile = request.getParameter("mobile");
     String bookingid = request.getParameter("bookingid");
      String device = request.getParameter("device");
       String amount = request.getParameter("amount");

	
      
                    %>
 <br><br>
  
 <div class="login" style="width: 560px; margin-top: 100px;">
        <form action="viewbill2.jsp" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="tusername" value="<%=tusername%>" required="" readonly="">
                            <span>Technician</span>
                        </div>
                    </td>
                     <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="number" name="bookingid" value="<%=bookingid%>" required="" readonly="">
                            <span>Booking ID</span>
                        </div>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <div class="input-group">
                            <input type="number" name="amount"  value="<%=amount%>" required="" readonly="" >
                            <span>Amount in Rs</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="number" name="cardnumber"  required="">
                            <span>Card Number</span>
                        </div>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <div class="input-group">
                            <input type="number" name="cvv"  required="" >
                            <span>Cvv</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="month" name="expery"  required="">
                            <span>Expiry Date </span>
                        </div>
                    </td>
                </tr>
                 
              
            </table>
            <div class="input-group">
                <button class="btn-hover color-9">Pay </button>
            </div>
        </form>
    </div>
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