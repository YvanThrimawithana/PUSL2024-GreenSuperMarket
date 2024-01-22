<%-- 
    Document   : wishlist
    Created on : Dec 28, 2023, 7:31:32 PM
    Author     : yvant
--%>

<%@page import="Class.Wishlist"%>
<%@page import="GetterSetters.wishlistitems"%>

<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
     String UserEmail = (String) session.getAttribute("userEmail");
     List<wishlistitems> wishlist = Wishlist.getWishlist(UserEmail);
        request.setAttribute("wishlist", wishlist);
     
%>
<link rel="stylesheet" href="css/wishlist.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <img  class="bg-image" src="assets/images/Backsplash.jpg">
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
     
    
    <section id="interface">
        <h3 class="i-name"  >WishList</h3>
        <div class="container">
            <section class="add-products">   
                <div class="wishlist-table">
                      
                    <div class="wishlist-row wishlist-heading">
                        <div class="wishlist-cell">
                            <span class="heading-label">Product Image</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Product ID</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Product Quantity</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">View Product Button</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Remove from Wishlist</span>
                        </div>
                    </div>
                 
                 <c:forEach var="item" items="${wishlist}">
                     
                    <div class="wishlist-row">
                        <div class="wishlist-cell">
                            <img src=${item.image} alt="Product Image" class="wishlist-image">
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${item.name}</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${item.quantity}</span>
                        </div>
                        <div class="wishlist-cell"  >
                            <button style="background-color: green; width: 100%x " class="btn view-product-btn" onclick="viewProduct(${item.id});">View Product</button>
                        </div>
                        
                        <div class="wishlist-cell">
                        <form action="<%=request.getContextPath()%>/RemoveWishlist" method="post">
                            <input type="hidden" name="productId" value="${item.id}">
                            <button  class="btn remove-btn" type="submit" id="heart">Remove Product</button>
                        </form>
                        </div>
                    </div>
                        </c:forEach>
                
                      
                </div>       
    </div>
<script>
    function viewProduct(productId) {
        // Redirect to the product page with the product ID as a parameter
        window.location.href = 'product-page.jsp?productId=' + productId;
    }
</script>
</section>
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
   

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
 .bg-image {
            width: 100%;
            height: 100vh; /* Adjust height as needed */
            object-fit: cover;
            position: fixed;
            top: 0;
            left: 0;
            z-index: -1;
            filter: blur(10px); /* Adjust the blur intensity as needed */
        }

body {
    width: 100%;
    background: rgb(212, 212, 212);
    position: relative;
    display: flex;
    flex-direction: column;
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
#interface {
    margin-top: 5%;
    width: 100%;
    margin-left: -1%; /* Updated margin to remove the gap */
    position: relative;
}
.i-name {
    color: rgb(22, 83, 22);
    padding: 30px 30px 0 30px;
    font-size: 54px;
    font-weight: 800;
    margin-left: 42%;
    font-weight: 900;
  
    
}
.title {
    color: rgb(22, 83, 22);
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: 700;
}
.box-container {
   align-self: center;
    width: 100%;
    left: 50%;
}
.add-products {
    background-color: white;
    margin: 20px 0; /* Updated margin to remove any extra margin */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
    width: 100%; /* Set width to 100% to fill the page */
    box-sizing: border-box; /* Add box-sizing property for better sizing calculations */
}


.box {
    background-color: rgb(240, 240, 240);
    margin: 10px;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
    position: relative;
    width: calc(33.33% - 20px);
    box-sizing: border-box;
}
.flex-btn {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}
.box img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto 10px;
}


.btn 
{
    background-color: rgb(22, 83, 22);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

.delete-btn {
    background-color: #f44336;
    color: white;
}
.wishlist-table {
    width: 100%;
    border-collapse: collapse;
}

.wishlist-row {
    display: flex;
    border: 1px solid #ddd;
    margin-bottom: 10px; /* Adjust as needed */
}

.wishlist-cell {
    flex: 1;
    padding: 10px;
    display: flex;
    align-items: center;
}

.wishlist-label {
    margin-right: 5px;
}

.wishlist-value {
    font-weight: bold;
}

.wishlist-image {
    max-width: 100px; /* Adjust as needed */
    margin-right: 10px;
}

.view-product-btn {
    background-color: #4caf50;
    color: white;
    border: none;
    padding: 8px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
}



/* Media queries for responsiveness on different screen sizes */
@media (max-width: 600px) {
    .box {
        width: calc(100% - 20px);
    }

    .add-products,
    .show-products,
    .delete_product,
    .update-products {
        margin: 10px;
        padding: 10px;
    }
}

@media (min-width: 601px) and (max-width: 1024px) {
    .box {
        width: calc(50% - 20px);
    }

    .add-products,
    .show-products,
    .delete_product,
    .update-products {
        margin: 15px;
        padding: 15px;
    }
}

@media (min-width: 1025px) and (max-width: 1440px) {
    .box {
        width: calc(33.33% - 20px);
    }

    .add-products,
    .show-products,
    .delete_product,
    .update-products {
        margin: 20px;
        padding: 20px;
    }
}

@media (min-width: 1441px) {
    .box {
        width: calc(25% - 20px);
    }

    .add-products,
    .show-products,
    .delete_product,
    .update-products {
        margin: 25px;
        padding: 25px;
    }
}

#container {
    max-width: 2880px;
    margin: auto;
    margin-top: auto; /* Push the container to the bottom */
    padding: 20px; /* Add padding or adjust as needed */
}

#row{
    display: flex;
    flex-wrap: wrap;
}

ul{
    list-style: none;
}

#footer{
    background-color: rgb(8, 87, 35);
    padding: 20px 0;
    margin-top: 20%
}

#footercol{
    width: 25%;
    padding: 0 50px;
}

#footercol ul li p{
    margin: 0 0 20px 0;
    display: block;
    color: #ffffff;
    margin-block-start: 1em;
    margin-left: 0;
    margin-right: 0;

}


#footercol h4{
    font-size: 18px;
    color: #ffffff;
    text-transform: capitalize;
    margin-bottom: 30px;
    font-weight: 500;
    position: relative;
}

#footercol h4::before{
    content: '';
    position: absolute;
    left: 0;
    bottom: -10px;
    background-color: #d9ff00;
    height: 2px;
    box-sizing: border-box;
    width: 50px;
}

#footercol ul li:not(:last-child){
    margin-bottom: 10px;
}

#footercol ul li a{
    font-size: 16px;
    color: #ffffff;
    text-decoration: none;
    font-weight: 300;
    color: #ffffff;
    display: block;
    transition: all 0.3s ease;
}

#footercol ul li a:hover{
    color: #ffffff;
    padding-left: 8px;
}

#footercol #social p{
    display: inline-block;
    height: 40px;
    width: 40px;
    background-color: #fffffffe;
    margin: 0 10px 10px 0;
    text-align: center;
    line-height: 40px;
    border-radius: 50%;
    color: #ffffff;
    transition: all 0.5s ease;
}

#footercol #social a:hover{
    color: #24262b;
    background-color: #ffffff;
}

#footercol #social a {
    display: inline-block;
    height: 40px;
    width: 40px;
    margin: 0 10px 10px 0;
    text-align: center;
    line-height: 40px;
    border-radius: 50%;
    color: #ffffff;
    transition: all 0.5s ease;
}

#footercol #social a:hover {
    transform: scale(1.2); /* Optional: Increase size on hover */
}

#footercol #social a.facebook {
    background-color: #214dab; /* Facebook color */
}

#footercol #social a.instagram {
    background-color: #a21886; /* Instagram color */
}

#footercol #social a.youtube {
    background-color: #c4302b; /* YouTube color */
}


@media(max-width: 800px){
    #footercol{
        width: 50%;
        margin-bottom: 30px;
    }
}

@media(max-width: 500px){
    #footercol{
        height: 90%;
        width: 100%;
    }
    
}
</style>
</body>
</html>
