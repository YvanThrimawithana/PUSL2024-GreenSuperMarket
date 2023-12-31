<%-- 
    Document   : login
    Created on : Dec 20, 2023, 11:04:19 PM
    Author     : yvant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<body>
    <!--Navbar-->
        <div class="navbar-list">
        <div class="navbar">
            <nav>
                <input type="checkbox" id="check">
                <label for="check" id="checkbtn">
                    <i class="fas fa-bars"></i>
                </label>
                <img class="img1" src="assets/images/nav.png">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="/">Categories</a></li>
                    <li><a href="feedback.jsp">Feedback</a></li>
                    <!-- Add text inside the hamburger menu for smaller screens -->
                    <li class="menu-item"><a href="wishlist.jsp">Wishlist</a></li>
                    <li class="menu-item"><a href="cart.jsp">Cart</a></li>
                    <li class="menu-item"><a href="user-profile.jsp">User Profile</a></li>
                </ul>
                <div class="btns">
                    <button class="allbtn"><a href="cart.jsp"><img class="svgicon" src="assets/icons/bxs-cart.svg"></a></button>
                    <button class="allbtn"><a href="wishlist.jsp"><img class="svgicon" src="assets/icons/bxs-heart.svg"></a></button>
                    <button class="allbtn"><a href="user-profile.jsp"><img class="svgicon" src="assets/icons/bxs-user.svg"></a></button>

                </div>
            </nav>
        </div>
    </div>
    
<!--code-->
    <div class="form-popup">
        <div class="form-box">
            <div class="form-details">
            </div>
            <div class="form-content">
                <h2>Already Registered?</h2>
                <form method="post" action="<%=request.getContextPath()%>/Login">
                    <div class="input-field">
                        <input name="Uemail"type="text" required>
                        <label>Username / Email</label>
                    </div>
                    <div class="input-field">
                        <input name="Upwd" type="password" required>
                        <label>Password</label>
                    </div>
                    <button type="submit">Log In</button>
                </form>
                <div class="bottom-link">
                    <a href="signup.jsp">Register here</a>
                </div>
            </div>
        </div>
    </div>
 <section>
        <footer id="footer">
            <div id="container">
                <div id="row">
                    <div id="footercol">
                        <h4>GreenSupermarket</h4>
                        <ul>
                            <li><p>Welcome to our GreenSupermarket, your one-stop destination for fresh, organic, and sustainably sourced produce. 
                                Explore a world of eco-friendly options that promote a healthier lifestyle for you and the planet. 
                                Shop consciously, support local farmers, and join us in our commitment to a greener, more sustainable future. 
                                Your choices matter.</p>
                            </li>
                        </ul>
                    </div>
                    <div id="footercol">
                        <h4 >About us</h4>
                        <ul >
                            <li><p>Projects</p></li>
                            
                        </ul>
                    </div>
                    <div id="footercol">
                        <h4>Contact Us</h4>
                        <ul>
                            <li><h5>Mahenwaththa, Pitipana, Homagama, Sri Lanka.</h5></li>
                            <li><h5>+94 76 636 0998</h5></li>
                            <li><h5>+94 76 360 0039</h5></li>
                            <li><a href="yvan.thrimawithana@outlook.com">yvan.thrimawithana@outlook.com</a></li>
                        </ul>
                    </div>
                    <div id="footercol">
                        <h4>Follow Us</h4>
                        <div id="social">
                            <a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="#https://www.instagram.com/yvan_thrima?igsh=NGVhN2U2NjQ0Yg==" class="instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="youtube"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </section>   
<style>
    
    body {
    font-family: 'Poppins';
    background-image: url(assets/images/Backsplash.jpg);
    background-size: cover;
}

.navbar a:hover {
    color: rgb(8, 218, 64); 
  }
  
  .navbar a {
    float: left;
    display: block;
    color: #000000;
    text-align: center;
    padding: 17px 16px;
    text-decoration: none;
    margin-top: 10px;
  }
  
  
  nav { 
    display: flex;
    background-color: rgb(255, 255, 255);
    justify-content: space-between;
    flex-wrap: wrap;
    padding-top: 20px;
    padding-left: 4%;
    padding-right: 4%;
    padding-bottom: 5px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1;
   
  }
  
  nav ul li {
    display: inline;
    list-style: none;
  }
  
  nav ul li a {
    color: rgb(0, 0, 0);
    text-decoration: none;
    font-size: 15px;
    font-weight: bold;
    position: relative;
  }
  
  #checkbtn {
    font-size: 20px;
    color: #000000;
    float: right;
    line-height: 65px;
    margin-right: 40px;
    cursor: pointer;
    display: none;
    position: relative;
  }
  
  #check {
    display: none;
  }
  
  .btns {
    display: flex;
    justify-content: space-between;
    width: 150px;
  }
  
  .menu-item {
    display: none;
}
  .allbtn {
    background-color: transparent;
    border: none;
  }
  
  .svgicon {
    background-color: transparent;
  }
  
  .img1 {
    float: left;
    display: block;
    color: #f2f2f2;
    align-items: center;
    padding: 14px 16px;
    text-decoration: none;
    width: 150px;
    height: 60px;
  }
  
  @media (min-width: 275px) and (max-width: 768px) {
    nav ul {
        display: none;
        width: 100%;
        height: 100vh;
        flex-direction: column;
        text-align: center;
        position: fixed;
        top: 90px;
        left: 0;
        background-color: rgba(69, 121, 58, 0.9);
    }
  
    nav ul.show {
        display: flex;
    }
  
    nav .btns {
        display: none;
    }
  
    nav ul li {
        display: block;
        margin: 10px 0;
        line-height: 30px;
    }
  
    nav ul li a {
        font-size: 15px;
    }
  
    .navbar a {
        margin-top: 20px;
        padding: 20px 20px;
    }
  
    #checkbtn {
        display: block;
    }
  
    .menu-item {
        display: block;
        margin: 10px 0;
        line-height: 30px;
    }
    
    #check:checked ~ ul {
        display: flex;
        align-items: center;
        left: 0;
    }

    .search-container{
        position: absolute;
        top: 70%;
        left: 70%;
        transform: translateX(-50%);
        display: flex;
        max-width: 400px;
        width: 50%;
    }
  }
  
  @media (max-width: 275px) {
    nav ul {
        display: none;
        width: 100%;
        height: 100vh;
        flex-direction: column;
        text-align: center;
        position: fixed;
        top: 110px;
        left: 0;
        background-color: rgba(69, 121, 58, 0.9);
    }
  
    nav ul.show {
        display: flex;
    }
  
    nav .btns {
        display: none;
    }
  
    nav ul li {
        display: block;
        margin: 10px 0;
        line-height: 30px;
    }
  
    nav ul li a {
        font-size: 15px;
    }
  
    .navbar a {
        margin-top: 20px;
        padding: 20px 20px;
    }
  
    #checkbtn {
        display: block;
    }
  
    #check:checked ~ ul {
        display: flex;
        align-items: center;
        right: 0;
    }
  
    .img1 {
        margin-left: 15px;
    }
  
    .menu-item {
        display: block;
        margin: 10px 0;
        line-height: 30px;
    }
  
    .btns {
        display: flex;
        justify-content: space-between;
        width: 150px;
        margin-left: 65px;
    }

   
  }


.form-popup {
    position: fixed;
    top: 50%;
    left: 80%;
    max-width: 45%;
    max-height: 100%;
    width: 100%;
    height: 100%;
    background: #214A2D;
    transform: translate(-50%, -50%);
    border-radius: 20px;
}

.form-box {
    display: flex;
    width: 91%;
    height: 100%;
    align-content: center;
}

.form-popup .form-box {
    display: flex;
    width: 96%;
}


.form-box h2 {
    text-align: center;
    margin-bottom: 50px;
    margin-top: -25px;
    font-size: 35px;
}

.form-box .form-content {
    width: 81%;
    padding: 40px;
    color: white;
    margin-top: 150px;
    margin-left:15px;
    
}

form .input-field {
    height: 50px;
    width: 100%;
    margin-top: 40px;
    position: relative;
}

form .input-field input {
    width: 100%;
    height: 100%;
    outline: none;
    padding: 0 15px;
    font-size: 0.95rem;
    border: 2px solid white;
    background-color: transparent;
    color: white;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
}

.input-field input:focus {
    border-color:white;
}

.input-field input:is(:focus, :valid) {
    padding: 16px 15px 0;
}

form .input-field label {
    position: absolute;
    top: 50%;
    left: 15px;
    color: white;
    pointer-events: none;
    transform: translateY(-50%);
    transition: 0.2s ease;
}

.input-field input:is(:focus, :valid) ~ label {
    font-size: 0.75rem;
    transform: translateY(-120%);
} 

.form-box a{
    color: rgb(255, 255, 255);
    text-decoration: none;
}

.form-box a:hover{
    text-decoration: underline;
}

form button {
    width: 250px;
    height: 60px;
    outline: none;
    border: none;
    font-size: 20px;
    font-weight: 600;
    padding: 14px 0;
    margin: 25px 0;
    color: white;
    cursor: pointer;
    background: black;
    transition: 0.2s ease;
    margin-left: 25%;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
    margin-top: 50px;
  }

form button:hover{
    background: darkgrey;
    color: black;
}

.form-box .bottom-link {
    text-align: left;
}

.input-box {
    position: relative;
    width: 100%;
    height: 100%;
    border-bottom: 2px solid;
}

.userform {
    margin-bottom: 35px;
}



@media only screen and (max-width: 767px) {
    .form-popup {
        top: 50%;
        left: 50%;
        max-width: 100%;
        width: 100%;
        transform: translate(-50%, -50%);
    }

    .form-box {
        flex-direction: column;
        align-items: center;
    }

    .form-box h2 {
        font-size: 25px;
        margin-bottom: 30px;
        margin-top: 10px;
        margin-right: 9px;
    }

    .form-box .form-content {
        width: 70%;
        padding: 20px;
        margin-top: 250px;
    }

    form .input-field {
        margin-top: 25px;
    }

    form button {
        width: 80%;
        margin-left: 1px;
        font-size: 18px;
        padding: 12px 0;
    }

    .input-field input:is(:focus, :valid) ~ label {
        font-size: 0.65rem;
        transform: translateY(-110%);
    }
}

                        
</style>
</body>
</html>
