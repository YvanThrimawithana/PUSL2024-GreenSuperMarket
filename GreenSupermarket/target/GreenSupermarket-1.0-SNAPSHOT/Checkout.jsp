<%-- 
    Document   : Checkout
    Created on : Dec 31, 2023, 8:13:53 PM
    Author     : yvant
--%>
<%@page import="GetterSetters.CartItems"%>
<%@page import="Class.CartDAO"%>
<!--
<%@page import="Class.CheckoutDAO"%>
<%@page import="GetterSetters.CheckoutItems"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    String UserEmail = (String) session.getAttribute("userEmail");
    List<CheckoutItems> check = CheckoutDAO.getCheckout(UserEmail);
    request.setAttribute("check", check);

   
    List<CartItems> cart = CartDAO.getCart(UserEmail);
    request.setAttribute("cart", cart);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <div align="center">
        <h1>Check Out</h1>
        <br/>
        <form action="<%=request.getContextPath()%>/authorize_payment" method="post" onsubmit="resetTimer()">
            <c:forEach var="check" items="${check}">
                <table>
                    <tr>
                        <td>Product/Service:</td>
                        <td>${check.getProdName()}</td>
                    </tr>
                    <tr>
                        <td>Product Quantity</td>
                        <td>${check.getProdQuantity()}</td>
                    </tr>
                    <tr>
                        <td>Product Price</td>
                        <td>${check.getProdPrice()}</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Checkout">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Checkout">
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </form>
         Display the countdown timer 
        <p>Time remaining: <span id="timer"></span></p>
    </div>-->

<script>
    // Set the duration for 10 minutes (600 seconds)
    var durationInSeconds = 1200;

    // Set a timer for 10 minutes
    var timer = setTimeout(function() {
        // Redirect to a servlet/controller to handle the cleanup
        window.location.href = '<%=request.getContextPath()%>/ClearCheckout';
    }, durationInSeconds * 1000); // Convert seconds to milliseconds

    // Reset the timer if the user interacts with the page
    function resetTimer() {
        clearTimeout(timer);
        // Optionally, you can restart the timer here if needed
    }

    // Function to update the countdown timer
    function updateTimer(durationInSeconds) {
        var timerElement = document.getElementById('timer');
        var minutes = Math.floor(durationInSeconds / 60);
        var seconds = durationInSeconds % 60;

        // Display the countdown in the format MM:SS
        timerElement.textContent = minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
    }

    // Function to start the countdown
    function startTimer(durationInSeconds) {
        var countdown = durationInSeconds;

        // Update the timer initially
        updateTimer(countdown);

        // Set up an interval to update the timer every second
        var intervalId = setInterval(function() {
            countdown--;

            // Update the timer
            updateTimer(countdown);

            // Check if the countdown has reached zero
            if (countdown <= 0) {
                // Redirect or perform any action when the timer reaches zero
                window.location.href = '<%=request.getContextPath()%>/ClearCheckout';

                // Clear the interval to stop updating the timer
                clearInterval(intervalId);
            }
        }, 1000);
    }

    // Call startTimer function with the desired duration in seconds
    startTimer(durationInSeconds);
</script>


<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

div {
    text-align: center;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Drop shadow */
    margin: 50px auto;
    max-width: 400px;
}

h1 {
    color: #333333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

table tr:last-child td {
    border-bottom: none;
}

input[type="text"],
input[type="submit"] {
    padding: 8px;
    width: 100%;
    box-sizing: border-box;
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: #4caf50;
    color: #ffffff;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
</style>
    </body>
</html>
