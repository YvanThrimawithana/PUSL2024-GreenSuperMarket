<%-- 
    Document   : Checkout
    Created on : Dec 31, 2023, 8:13:53 PM
    Author     : yvant
--%>

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
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        <c:forEach var="check" items="${check}">
            <h1>ID : </h1><h3>${check.getOrderId()}</h3>
            <h1>Name : </h1><h3>${check.getProdName()}</h3>
            <h1>Quantity : </h1><h3>${check.getProdQuantity()}</h3>
            <h1>Price : </h1><h3>${check.getProdPrice()}</h3>
            
            
            
        </c:forEach>
            <form>
                <button type="submit">Paynow</button>
            </form>
        -->
        <body>
<div align="center">
	<h1>Check Out</h1>
	<br/>
	<form action="<%=request.getContextPath()%>/authorize_payment" method="post">
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
                <h1>-------------------------------------</h1>
                </c:forEach>  
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Checkout" />
			</td>
		</tr>
	</table>
        
	</form>
</div>
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
