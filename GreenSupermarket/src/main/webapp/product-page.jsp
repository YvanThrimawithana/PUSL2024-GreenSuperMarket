<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="Servlet.SelectItemDAO" %>
<%@ page import="Servlet.SelectItem" %>
<%@ page import="Servlet.Wishlist" %>

<%

    String UserEmail = (String) session.getAttribute("userEmail");
   int ItemId = Integer.parseInt(request.getParameter("productId"));
   SelectItem item = SelectItemDAO.getSelectItemById(ItemId);
   pageContext.setAttribute("item", item);
%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <!-- Add your additional head content here -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/product-page.css">
</head>
<body>
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
                    <button class="allbtn"><a href="cart.jsp"><img class="svgicon" src="assets/icons/bxs-cart.svg"></a></button>
                    <button class="allbtn"><a href="wishlist.jsp"><img class="svgicon" src="assets/icons/bxs-heart.svg"></a></button>
                    <button class="allbtn"><a href="user-profile.jsp"><img class="svgicon" src="assets/icons/bxs-user.svg"></a></button>
                </div>
            </nav>
        </div>
    </div>

    <div class="product-container">
        <div class="clearfix">
            <img class="img2" src="${item.getImage()}" alt="${item.getName()}">
            <div class="details">
                <h1>${item.getName()}</h1>
                <p id="productId">Product ID : ${item.getId()}</p>
                <p id="productPrice">Price : $${item.getPrice()}</p>
                <p id="productPrice">Remaining : ${item.getQuantity()}g</p>

                <form >
                    <input type="hidden" name="productId" value="${item.getId()}">
                    <label for="quantity">Quantity (100g):</label>
                    <input type="number" id="quantity" name="quantity" value="1" max="${item.getQuantity()}" min="0" oninput="updateQuantity(this)"><br><br>
                </form>
                <form action="<%=request.getContextPath()%>/AddCartServlet" method="post">
                    <input type="hidden" name="productId" value="${item.getId()}">
                    <button class="button" type="submit" id="add">Add to Cart</button>
                </form>
                    
                
                <form action="<%=request.getContextPath()%>/addToWishlist" method="post">
                    <input type="hidden" name="productId" value="${item.getId()}">
                    <button class="button" type="submit" id="heart">Add to Wishlist</button>
                </form>
            </div>
        </div>
    </div>
<script>
    function updateQuantity(input) {
        // Get the maximum allowed value
        var maxAllowed = parseInt(input.getAttribute('max'));

        // If the entered quantity is greater than the maximum, set it to max - 50
        if (input.value > maxAllowed) {
            input.value = maxAllowed;
        }
    }

        // JavaScript function to redirect to the item details page with a parameter
        function viewItemDetails(itemId) {
            window.location.href = 'product-page.jsp?itemId=' + itemId;
        }
    </script>
    
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
