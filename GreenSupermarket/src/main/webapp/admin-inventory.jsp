<%-- 
    Document   : admin-inventory
    Created on : Dec 25, 2023, 4:35:34 PM
    Author     : yvant
--%>

<%@page import="GetterSetters.AdminPanelItems"%>
<%@page import="Class.AdminDAO"%>
<%@page import="GetterSetters.FeedbackItems"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%
    List<AdminPanelItems> items = AdminDAO.getProducts();
    request.setAttribute("items", items);
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/ce6f9ece82.js" crossorigin="anonymous"></script>
    <title>Admin-inventory</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">

</head>

<body>

    <section id="menu">

        <div class="logo">
            <img src="assets/images/nav.png" alt="">
        </div>

        <div class="items">
            <li><i class="fa-solid fa-chart-line"></i><a href="#">Dashboard</a></li>
            <li><i class="fa-solid fa-boxes-stacked"></i><a href="admin-inventory.jsp">Inventory</a></li>
            <li><i class="fa-solid fa-comments"></i><a href="admin-feedback.jsp">Feedback</a></li>
            <li><i class="fa-solid fa-comments"></i><a href="admin-feedback.jsp">Logout</a></li>
        </div>
    </section>

    <section id="interface">
        <h3 class="i-name">Inventory</h3>
        <div class="container">
            <section class="add-products">
                <h1 class="title">Add New Product</h1>
                <form method="post" action="<%=request.getContextPath()%>/Add_Product" enctype="multipart/form-data">
                    <div class="flex">
                        <div class="inputBox">
                            <input type="text" name="p_name" class="box" required placeholder="Enter product name">
                            <select name="p_category" class="box" required>
                                <option value="" selected disabled>Select category</option>
                                <option value="Vegetables">Vegetables</option>
                                <option value="Fruits">Fruits</option>
                                <option value="Meat">Meat</option>
                                
                            </select>
                        </div>
                        <div class="inputBox">
                            <input type="number" name="p_price" class="box" required placeholder="Enter product price">
                            <input type="file" name="p_image" required class="box" accept="image/jpg, image/jpeg, image/png">
                        </div>
                    </div>
                    <div class="inputBox">
                        <input name="p_id" type="number" min="0" class="box" placeholder="Enter product ID">
                    </div>
                    <div class="inputBox">
                        <input name="p_quantity" type="number" min="0" name="price" class="box" required placeholder="Enter product Quantity">
                        <input type="submit" class="btn" value="Add Product" name="add_product">
                        <input style="background-color: red" type="reset" class="btn">
                    </div>
                </form>
            </section>

            <section class="add-products">
                <h1 class="title">Update Product</h1>
                <form action="<%=request.getContextPath()%>/UpdateProduct" method="post">
                    <div class="flex">
                        <div class="inputBox">
                            <input type="text" name="pname" class="box" required placeholder="Enter product name">
                             <input type="text" name="pcategory" class="box" required placeholder="Select category" oninput="validateCategory(this)">
                        </div>
                        <div class="inputBox">
                            <input type="number" min="0" name="pprice" class="box" required placeholder="Enter product price">
                        </div>
                    </div>
                    <div class="inputBox">
                        <input type="text" name="pid" class="box" required placeholder="Enter product ID">
                    </div>
                    <div class="inputBox">
                        <input name="pquantity" type="number" min="0" class="box" required placeholder="Enter product Quantity">
                        <input type="submit" class="btn">
                        <input style="background-color: red" type="reset" class="btn">
                    </div>
                </form>
            </section>

            <section class="add-products">
                <h1 class="title">Delete Product</h1>
                <form action="<%=request.getContextPath()%>/Delete_Product" method="post">
                    <div class="flex">
                        <div class="inputBox">
                            <input type="text" name="delete_p_id" class="box" required placeholder="Enter product if">
                        </div>
                    </div>
                    <input type="submit" class="btn" value="Delete Product" name="Delete">
                </form>
            </section>

            <section class="show-products">
                <h1 class="title">Products Added</h1>
                <div class="box-container">
                    <!-- Sample cards for random products -->
                    <c:forEach var="items" items="${items}">
                    <div class="box">
                        <div class="price"><h2>${items.getProdId()}</h2></div>
                        <img src=${items.getProdImage()} alt="Product 1">
                        <div class="name"><h2>${items.getProdName()}</h2></div>
                        <div class="cat"><h4>${items.getProdPrice()}</h4></div>
                        <div class="details">${items.getProdCategory()}</div>
                    </div>
                    </c:forEach>

                   
                </div>
            </section>
        </div>
    </section>
                    
                  
</body>
<style>
    /*
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/CascadeStyleSheet.css to edit this template
*/
/* 
    Created on : Dec 25, 2023, 4:37:40 PM
    Author     : yvant
*/



* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    
}

body {
    width: 100%;
    background: rgb(212, 212, 212);
    position: relative;
    display: flex;
    font-family: 'Poppins';
}

#menu {
    background: rgb(184, 241, 172);
    width: 300px;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
}

#menu .logo {
    display: flex;
    align-items: center;
    color: whitesmoke;
    padding: 10px 0 0 70px;
}

#menu .logo img {
    width: 150px;
    margin-right: 15px;
}

#menu .items {
    margin-top: 130px;
    max-height: 400px; /* Set a maximum height for the items */
    
}

#menu .items li {
    list-style: none;
    margin-top: 80px;
    padding: 25px 0;
    transition: 0.3s ease;
    overflow-y: auto; /* Add a vertical scrollbar when needed */
}

#menu .items li:hover {
    background: rgb(22, 83, 22);
    cursor: pointer;
}

#menu .items li:nth-child(2) {
    border-left: 4px solid rgb(0, 0, 0);
}

#menu .items li i {
    color: rgb(0, 0, 0);
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 14px;
    margin: 0 10px 0 80px;
}

#menu .items li a {
    color: rgb(0, 0, 0);
    font-weight: 1000;
    text-decoration: none;
}

#menu .items li:hover i,
#menu .items li:hover a {
    text-decoration: none;
    color: black;
    font-weight: 1000;
    transition: 0.3s ease;
}

#interface {
    width: calc(100% - 300px);
    margin-left: 300px;
    position: relative;
}

.i-name {
    color: rgb(22, 83, 22);
    padding: 30px 30px 0 30px;
    font-size: 24px;
    font-weight: 800;
}

.add-products,
.show-products,
.delete_product,
.update-products {
    background-color: white;
    margin: 20px;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
}

.title {
    color: rgb(22, 83, 22);
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: 700;
}

.box-container {
    display: flex;
    flex-wrap: wrap;
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

.box img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto 10px;
}

.price {
    font-size: 18px;
    font-weight: 600;
    color: rgb(22, 83, 22);
}

.name,
.cat {
    font-size: 14px;
    margin-top: 5px;
}

.flex-btn {
    display: flex;
    justify-content: space-between;
    margin-top: 10px;
}

.option-btn,
.delete-btn,
.btn {
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

.delete-form {
    position: absolute;
    top: 0;
    right: 0;
    margin: 8px;
    display: none;
}

.box:hover .delete-form {
    display: block;
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
</html>
