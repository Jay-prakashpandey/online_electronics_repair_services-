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
                <a href="customerhome.jsp" class="active">Home</a>
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
                <a href="viewbill.jsp" >View Bill</a>
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
    <br><br><br><br><br><br>
        <%
String username = session.getAttribute("username").toString();
%>
<br>
<marquee direction="scroll" scrollamount="10"><h1 style="color:purple;">Welcome <%=username%> </h1></marquee>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>

</html>