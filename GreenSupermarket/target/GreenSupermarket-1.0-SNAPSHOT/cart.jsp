<%-- 
    Document   : cart
    Created on : Dec 20, 2023, 11:01:17 PM
    Author     : yvant
--%>

<%@page import="Class.CartDAO"%>
<%@page import="GetterSetters.CartItems"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String UserEmail = (String) session.getAttribute("userEmail");
    List<CartItems> cart = CartDAO.getCart(UserEmail);
    request.setAttribute("cart", cart);

%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Supermarket</title>
    <link rel="stylesheet" type="text/css" href="cart.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
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
        <h3 class="i-name">Cart</h3>
        <div class="container">
            <section class="add-products">   
                <div class="wishlist-table">
                    <!-- Column Headings -->
                    <div class="wishlist-row wishlist-heading">
                        <div class="wishlist-cell">
                            <span class="heading-label">Product Image</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Product ID</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Product Name</span>
                        </div>
                        
                        <div class="wishlist-cell">
                            <span class="heading-label">Remaining Quantity</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Select Quantity</span>
                        </div>
                       
                        <div class="wishlist-cell">
                            <span class="heading-label">Remove from Wishlist</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="heading-label">Price</span>
                        </div>
                    </div>
                 
                    <c:forEach var="c" items="${cart}">
                     
                    <div class="wishlist-row">
                        <div class="wishlist-cell">
                            <img src=${c.getImage()} alt="Product Image" class="wishlist-image">
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${c.getId()}</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${c.getName()}</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${c.getQuantity()}g</span>
                        </div>
                        <div class="wishlist-cell">
                            <span class="wishlist-label">
                                <form action="<%=request.getContextPath()%>/UpdateCart" method="post">
                                    <input type="hidden" name="productId" value="${c.getId()}">
                                    <input name="cartquantity" data-product-id="${c.getId()}" data-initial-price="${c.getPrice()}" style="height: 40px; font-size: 20px;" type="number" max="${c.getQuantity()}" min="0" step="100" oninput="updateQuantity(this)">g
                                     <button class="btn remove-btn" type="submit" id="heart">Update</button>
                                </form>
                            </span>
                        </div>
                       
                        <div class="wishlist-cell">
                         <form action="<%=request.getContextPath()%>/RemoveCart" method="post">
                            <input type="hidden" name="productId" value="${c.getId()}">
                            <button  class="btn remove-btn" type="submit" id="heart">Remove Product</button>
                        </form>
                        </div>
                       
                        <div class="wishlist-cell">
                            <span class="wishlist-label">${c.getPrice()}</span>
                        </div>
                    </div>
                        </c:forEach>
                    
                   
                   <div class="wishlist-row">
                        
                        <div class="wishlist-cell">
                            <span class="wishlist-label">TOTAL CHECKOUT VALUE : </span>
                        </div>
                       <div class="wishlist-cell">
                            <button class="btn calculate-btn" onclick="calculateTotal()">Calculate Total</button>
                        </div>
                        <div class="wishlist-cell">
                            <h1 class="wishlist-label" id="total-quantity"></h1>
                        </div>
                        <div class="wishlist-cell">
                            <h1 class="wishlist-label" name="totalprice" id="total-price">0.00</h1>
                        </div>
                    </div>
                    
                    
                      
                    
                    <form action="<%=request.getContextPath()%>/OrderServlet" method="post">
                        <button class="btn checkout-btn" style="background-color: red; color: white; font-size: 20px" type="submit">Procees to checkout</button>
                        
                    </form>
                     

                                        <!-- Repeat the above structure for additional wishlist items -->
                </div>       
    </div>
        
<script>
    function viewProduct(productId) {
       
        window.location.href = 'product-page.jsp?productId=' + productId;
    }
        function updateQuantity(input) {
        
        var maxAllowed = parseInt(input.getAttribute('max'));

       
        if (input.value > maxAllowed) {
            input.value = maxAllowed;
        }
    }
     function updateQuantity(input) {
       
        var enteredValue = parseInt(input.value);

        
        var adjustedValue = Math.round(enteredValue / 100) * 100;

        
        input.value = adjustedValue;
    }
     function updateQuantity(input, initialPrice) {
    var quantity = input.value;
    var productId = input.getAttribute('data-product-id');

    // Save the entered quantity in local storage
    localStorage.setItem('quantity_' + productId, quantity);

    var increasedPrice = initialPrice * (quantity / 100);

    // Update the displayed price
    var priceElement = input.closest('.wishlist-row').querySelector('.wishlist-cell:last-child .wishlist-label');
    priceElement.textContent = increasedPrice.toFixed(2);
}
document.addEventListener('DOMContentLoaded', function () {
    // Loop through all quantity inputs
    var quantityInputs = document.querySelectorAll('input[name="cartquantity"]');
    quantityInputs.forEach(function (input) {
        var productId = input.getAttribute('data-product-id');

        // Load the stored quantity from local storage
        var storedQuantity = localStorage.getItem('quantity_' + productId);

        if (storedQuantity !== null) {
            // Set the stored quantity in the input field
            input.value = storedQuantity;

            // Update the displayed price
            updateQuantity(input, parseFloat(input.getAttribute('data-initial-price')));
        }
    });
});
    
function calculateTotal() {
    console.log('calculateTotal() function is called.');
    var totalQuantity = 0;
    var totalPrice = 0;

    // Loop through all the product rows
    var productRows = document.querySelectorAll('.wishlist-row:not(.wishlist-heading)');
    productRows.forEach(function (row) {
        // Get the quantity and price elements
            // Get the quantity and price elements
          var quantityElement = row.querySelector('.wishlist-cell:nth-child(4) span'); // Adjust the index based on your actual structure
          var priceElement = row.querySelector('.wishlist-cell:last-child .wishlist-label');

          // Check if the elements are found before accessing their properties
          if (quantityElement && priceElement) {
              // Calculate total quantity and price
              totalQuantity += parseInt(quantityElement.textContent) || 0;
              totalPrice += parseFloat(priceElement.textContent) || 0;
          }
    });

    // Display the total quantity and price
    
    var totalPriceElement = document.getElementById('total-price');

    // Update the content of the elements with the calculated values
   
    totalPriceElement.textContent = totalPrice.toFixed(2); // Assuming 2 decimal places for the price
}

 // Set a timer for 10 minutes (600,000 milliseconds)
    var timer = setTimeout(function() {
        // Redirect to a servlet/controller to handle the cleanup
        window.location.href = '<%=request.getContextPath()%>/clear_order';
    }, 600000); // 10 minutes

    // Reset the timer if the user clicks the checkout button
    function resetTimer() {
        clearTimeout(timer);
        // Optionally, you can restart the timer here if needed
    }


</script>
        
        
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
    text-align: center;
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
    </style>

</div>
</section>
    
    
</body>
</html>