<%-- 
    Document   : feedback
    Created on : Dec 20, 2023, 11:02:20 PM
    Author     : yvant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    <link  type="text/css" rel="stylesheet" href="css/feedback.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body style="background: url('assets/images/Backsplash.jpg') center/cover no-repeat;">
    <!--navbar-->
    
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
                <a href="cart.jsp" class="allbtn">
                    <img class="svgicon" src="assets/icons/bxs-cart.svg" alt="Shopping Cart">
                </a>

               <a href="wishlist.jsp" class="allbtn">
                   <img class="svgicon" src="assets/icons/bxs-heart.svg" alt="Wishlist">
               </a>

               <a href="user-profile.jsp" class="allbtn">
                   <img class="svgicon" src="assets/icons/bxs-user.svg" alt="User Profile">
               </a>


            </div>
        </nav>
    </div>
</div>

    <div class="container">
        <div class="profile">
            <div class="profile-info">
                <h3>We appreciate your input as we strive to serve you better.</h3>
                
                <form method="post" action="<%=request.getContextPath()%>/NewFeedBack">
                    <div class="text-container">
                        <input type="email" name="uemail"placeholder="Email"value="${userEmail}">
                    </div>
                
                    <div class="dropdown-container">
                        <select name="FeedbackRating">
                            <option value="" disabled selected>Rate Us</option>
                            <option value="Satisfied">Satisfied</option>
                            <option value="Neutral">Neutral</option>
                            <option value="Unsatisfied">Unsatisfied</option>
                        </select>
                    </div>

                    <div class="feed-container" >
                        <textarea id="feedback" name="ufeedback" placeholder="Feedback" required></textarea>
                    </div>
                    
                    <div class="button-change">
                        <button type="submit" id="submit">Submit</button>
                    </div>
                </form>
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
</body>
</html>