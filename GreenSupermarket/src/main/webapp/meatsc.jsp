<%-- 
    Document   : vegetableC
    Created on : Jan 2, 2024, 11:55:07 PM
    Author     : yvant
--%>

<%@page import="Class.InventoryDAO"%>
<%@page import="GetterSetters.InventoryItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Page Title</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
   
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
         <%
        List<InventoryItem> products = InventoryDAO.getmeats();
    pageContext.setAttribute("products", products);
    
    %>
</head>
<body>
    
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
    

     <div id="hero-image">
        <img src="assets/images/meats.jpg">

        <div class="welcome-text">
            <p>
                Meats. 
            </p>
        </div>

        <div class="search-container">
           
        </div>
    </div>

    
    
    

    
    <div class="card-container">
    <%--<jsp:useBean id="inventoryDAO" class="Servlet.InventoryDAO" /> --%>
   <c:forEach var="pro" items="${products}">
    <div class="card">
        <p class="product-name">${pro.getName()}</p>
        <p class="product-price">LKR ${pro.getPrice()}</p>
        <img src=${pro.getImage()} alt="${pro.getName()}">
        
        <form action="<%=request.getContextPath()%>/AddCartServlet" method="post">
            <input type="hidden" name="productId" value="${pro.getId()}">
            <button style="  width: 190px; height: 35px " class="add-to-cart-btn" type="submit" >Add to cart</button>
        </form>
            
        <button class="add-to-cart-btn" onclick="viewProduct(${pro.getId()});">View Product</button>
    </div>
</c:forEach>

<script>
    function viewProduct(productId) {
        // Redirect to the product page with the product ID as a parameter
        window.location.href = 'product-page.jsp?productId=' + productId;
    }
</script>

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
    
 
<script>
  document.getElementById('profileButton').addEventListener('click', function() {
    window.location.href = '/update_user_profile'; // Replace 'YourServletMapping' with the actual mapping of your servlet
  });
</script>
   
    


<style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
  }
  body {
      width: 100%;
      height: 100vh;
      position: relative;
  }

  /* search-contain doesn't change when minimized */

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


#hero-image {
    top: 0px;
    position: relative;
    height: 500px;
    overflow:hidden;
    margin-left: -50px;
    margin-top: 50px;
   
}

#hero-image img {
    width: 150%;
    height: 100%;
    object-fit:cover;
   
}

.welcome-text {
    position: absolute;
    font-size: 90px;
    font-weight: 600;
    top: 40%;
    left: 75%;
    transform: translateX(-50%);
    color: rgb(255, 255, 255);
    text-align: center;
    max-width: 600px;
    width: 80%;
}

.search-container {
    position: absolute;
    top: 70%;
    left: 70%;
    transform: translateX(-50%);
    display: flex;
    max-width: 400px;
    width: 100%;
}

.search-box {
    background-color: #2E3D00;
    border: none;
    border-top-left-radius: 20px;
    border-bottom-right-radius: 20px;
    padding: 15px 15px;
    width: 100%;
    font-size: 16px;
    color: white;
}

.search-icon {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    margin: 5px;
    filter: invert(1);
}

.search-icon img {
    width: 20px;
    height: 20px;
}

    
.card-container {
    display: flex;
    flex-wrap: wrap; /* Allow cards to wrap to the next line */
    justify-content: space-between;
    align-items: flex-start; /* Align items to the start of the flex container */
    padding: 20px;
    margin-top: 1%;
    margin-left: 5%;
    margin-right: 5%;
}


.card {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    border: 2px solid #333;
    border-top-left-radius: 40px;
    border-bottom-right-radius: 40px;
    padding: 5px;
    margin: 5px;
    margin-bottom: 40px;
    width: 20%; /* Set a fixed width for each card, adjusting as needed */
    height: 350px; /* Change this value to your desired height */
    
    /* Transition properties for smooth animation */
    transition-property: background-color, color, box-shadow;
    transition-duration: 0.5s;
    transition-timing-function: ease;
}

.card:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
}


.card img {
    width: 80%;
    height: 60%; /* Adjusted height for the image */
    object-fit: contain;
    object-position: top; /* Align the image to the top of the container */
    margin-bottom: -15px;
}

.product-name {
    margin-top: 0px;
    font-weight: 600;
    font-size: 20px; /* Margin between the image and the product name */
}
.product-price{
    margin-top: 3px;
}

.add-to-cart-btn {
    margin-top: 10px;
    font-size: 15px;
    font-family: Poppins;
    width: 70%;
    height: 10%;
    border: transparent;
    border-radius: 30px;
    background: #D9D9D9;
    object-position: bottom;

    /* Transition properties for smooth animation */
    transition-property: background-color, color;
    transition-duration: 0.5s;
    transition-timing-function: ease;
}

.add-to-cart-btn:hover {
    background-color: #2E3D00; /* Change to your desired green color */
    color: white; /* Change text color to contrast with the background */
    cursor: pointer; /* Add pointer cursor on hover */
}

#container{
    max-width: 2880px;
    margin: auto;
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
