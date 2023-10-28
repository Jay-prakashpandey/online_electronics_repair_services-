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
                <a href="index.html">Home</a>
            </li>
             <li>
                <a href="admin.jsp" >Admin</a>
            </li>
            <li>
                <a href="technician.jsp"  >Technician</a>
            </li>
            <li>
                <a href="customer.jsp" class="active">Customer</a>
            </li>
        </ul>
    </nav>
    <br><br><br>
     <div class="login" style="margin-top:100px;">
        <h2>Sign In</h2>
        <form action="customeract.jsp" method="post">
            <div class="input-group">
                <input type="text" name="username" required="">
                <span>Username</span>
            </div>
            <div class="input-group">
                <input type="password" name="password" required="" />
                <span>Password</span>
            </div>
            <div class="input-group">
                <button class="btn-hover color-2">Login</button>
            </div>
        </form>
        <br>
        <a href="customerreg.jsp" style="color:black">New Customer Click Here....</a><br><br>
       
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>

</html>