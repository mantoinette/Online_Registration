<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, intial-scale=1.0">
    <title>AUCA | Home</title>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="shortcut icon" href="images/favicon.png"/>
</head>
<body>
<section class="main" style="background-image: url(images/hero-bg.png);">

    <nav>
        <a href="index.jsp" class="logo">
            <img src="images/logo.png" height="40px" />
        </a>
        <input class="menu-btn" type="checkbox" id="menu-btn"/>
        <label class="menu-icon" for="menu-btn">
            <span class="nav-icon"></span>
        </label>
        <ul class="menu" style="border-radius: 5px;">
            <li><a href="About.jsp">About</a></li>
            <li><a href="Login.jsp">Report</a></li>
            <li><a href="index.jsp">Apply Now</a></li>
            <li><a href="Login.jsp" class="active" onclick="document.getElementById('id01').style.display='block'" style="width:auto; border-radius: 5px; cursor: pointer;">Login</a></li>
        </ul>
    </nav>
    <!--main-content-->
    <div class="home-content">

        <!--text-->
        <div class="home-text" >

            <h3 style="color: white; letter-spacing: 2px;">ADVENTIST UNIVERSITY OF CENTRAL AFRICA</h3>
            <h1 style="color: white;"> University Portal</h1>
            <p style="color: white;">The purpose of Schools is to prepare students with promise
                to enhance their intellectual, physical, social, emotional, spiritual,
                and artistic growth so that they may realize their power for good
                as citizens</p>
            <!--login-btn-->
            <a href="Login.jsp" class="main-login" style="border-radius: 5px;">Apply Now</a>
        </div>
        <!--img-->
        <div class="home-img" style="width: 500px;">
            <img src="images/hat.png" width="500px" style="text-shadow: 20px 22px;"/>
        </div>

    </div>
</section>
<!--footer------------->
<footer>
    <p>Copyright (C) - 2023 | Developed By <a>KAMONGI SETONDE ERIC</a> </p>
</footer>

</body>
</html>