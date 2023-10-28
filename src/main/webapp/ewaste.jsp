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
                <a href="viewbill.jsp" >View Bill</a>
             </li>
              <li>
                <a href="history.jsp" >History</a>
            </li>
            <li>
                <a href="rating.jsp" >Give Rating</a>
            </li>
             <li>
                <a href="ewaste.jsp" class="active">E-Waste</a>
            </li>
            <li>
                <a href="index.html"  >Logout</a>
            </li>
           
        </ul>
    </nav>
    <br><br><br>
    <div class="login" style="width: 560px; margin-top: 100px;">
        <form action="ewasteact.jsp" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="username" required="">
                            <span>Name</span>
                        </div>
                    </td>
                    <td>
                        <div class="input-group">
                            <input type="tel" name="mobile" required="">
                            <span>mobile</span>
                        </div>
                    </td>
                </tr>
                <tr>
                 
                    <td>
                        <div class="input-group">
                            <textarea name="items" placeholder="Type Your E-waste Items"></textarea>
                           
                        </div>
                    </td>
                        <td style="padding-right: 20px">
                        <div class="input-group">
                            <input type="text" name="address" required="">
                            <span>Address</span>
                        </div>
                    </td>
                    </td>
                </tr>
               
            </table>
            <div class="input-group">
                <button class="btn-hover color-9">Send</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>

</html>