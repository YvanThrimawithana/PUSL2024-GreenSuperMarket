<%@page import="Class.OrderDAO"%>
<%@page import="GetterSetters.OrderItems"%>
<%@page import="Class.Wishlist"%>
<%@page import="GetterSetters.wishlistitems"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Get user email from the session --%>
<%
    String UserEmail = (String) session.getAttribute("userEmail");
    List<OrderItems> Orderitems = OrderDAO.getOrderDetails(UserEmail);
    request.setAttribute("Orderitems", Orderitems);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review</title>
    <style>
        body {
           font-family: 'Poppins';
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background-image: url(assets/images/Backsplash.jpg);
            background-size: cover;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<body>
    <header>
        <h1>Please Review Before Paying</h1>
    </header>

    <div class="container">
        <table>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
<c:forEach var="orderItem" items="${Orderitems}">
    <tr>
        <td>${orderItem.productName}</td>
        <td>${orderItem.quantity}</td>
        <td>${orderItem.price} USD</td>
    </tr>
</c:forEach>
<tr>
    <td>Total Price:</td>
    <td></td>
    <td>${Orderitems[0].getTotalPrice()} USD</td>
</tr>
        </table>

        <form action="<%=request.getContextPath()%>/PaymentServlet" method="post">
            <input type="hidden" name="paymentId" value="${param.paymentId}" />
            <input type="hidden" name="PayerID" value="${param.PayerID}" />
            
            <label for="address">Enter Your Address:</label>
            <input type="text" id="address" name="address" placeholder="Enter your address" required>
            
            <input type="submit" value="Pay Now">
        </form>
    </div>
</body>
</html>
