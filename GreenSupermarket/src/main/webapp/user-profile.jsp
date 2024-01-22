<%-- 
    Document   : user-profile
    Created on : Dec 22, 2023, 2:41:04 AM
    Author     : yvant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet"type="text/css" href="css/user-profile.css"">

<body>
        <img class="hero-image" src="assets/images/Backsplash.jpg">

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
                    <li><a href="vegetableC.jsp">Vegetable</a></li>
                    <li><a href="fruitsC.jsp">Fruits</a></li>
                    <li><a href="meatsc.jsp">Meat</a></li>
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
    <div class="container">
        <div class="profile-box">
            <div class="profile-info">
                <h1>User Profile</h1>
                <form method="post" action="<%=request.getContextPath()%>/update_user_profile" >
                <div class="text-container">
                    <img src="assets/icons/bx-envelope.svg" alt="Email Icon">
                    <input name="uemail" value="${userEmail}" type="text" placeholder="Enter your new email">
                </div>
                <div class="text-container">
                    <img src="assets/icons/bxs-phone.svg" alt="Phone Icon">
                    <input name="upno" type="tel" value="${userPhoneNumber}" placeholder="Enter your new phone number" pattern="[0-9]{10}" maxlength="10">
                </div>
                <div class="text-container">
                    <img src="assets/icons/bxs-key.svg" alt="Password Icon">
                    <input name="upwd"type="password" placeholder="Enter your Current password" minlength="0" maxlength="15">
                </div>
                 <div class="text-container">
                    <img src="assets/icons/bxs-key.svg" alt="Password Icon">
                    <input name="unpwd" type="password" placeholder="Enter your new password" minlength="0" maxlength="15">
                </div>
                <div class="button-change">
                    <button type="update" id="save">Save Changes</button>
                </div>
                </form>
                <div class="delete-container">
                    <!-- <label for="deleteCheckbox" class="delete-label">Delete Account ?</label>
                    <input type="checkbox" id="deleteCheckbox"> -->
                    <a onclick="confirmation()" class="delete-label">Delete Account ?</a>
                    <div class="delete-form">
                        <p class="close-btn" onclick="confirmation()">X</p>
                        <form>
                            <header><h2>Password</h2></header>
                            <input type="password" id="dpassword" name="password" placeholder="Enter the curent password" required><br>
                            <button type="submit" id="submit">Confirm</button> 
                        </form>
                    </div>
                </div>
                
                <div class="button-change">
                    <div class="separator"></div>
                    <span class="or">or</span>
                    <div class="separator"></div>
                </div>
                <div class="button-change">
                    <a href="<%=request.getContextPath()%>/LogoutServlet" id="logoutButton">
                    <button type="submit" id="logout">Log Out</button></a>
                </div>
            </div>
        </div>
    </div>

    <div class="overlay"></div>
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
</body>

<script>
    function confirmation() {
        var element1, element2;
        element1 = document.querySelector('.delete-form');
        element1.classList.toggle("delete-form-active");

        element1 = document.querySelector('.overlay');
        element1.classList.toggle("overlay-active");
    }
</script>
</html>