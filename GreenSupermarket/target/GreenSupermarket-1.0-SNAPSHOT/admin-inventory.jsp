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
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="css/admin-inventory.css">
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
                                <option value="vegitables">Vegetables</option>
                                <option value="fruits">Fruits</option>
                                <option value="meat">Meat</option>
                                <option value="fish">Fish</option>
                            </select>
                        </div>
                        <div class="inputBox">
                            <input type="number" name="p_price" class="box" required placeholder="Enter product price">
                            <input type="file" name="p_image" required class="box" accept="image/jpg, image/jpeg, image/png">
                        </div>
                    </div>
                    <div class="inputBox">
                        <input name="p_id" type="number" min="0" class="box" required placeholder="Enter product ID">
                    </div>
                    <div class="inputBox">
                        <input name="p_quantity" type="number" min="0" name="price" class="box" required placeholder="Enter product Quantity">
                        <input type="submit" class="btn" value="Add Product" name="add_product">
                    </div>
                </form>
            </section>

            <section class="add-products">
                <h1 class="title">Update Product</h1>
                <form action="<%=request.getContextPath()%>/UpdateProduct" method="post">
                    <div class="flex">
                        <div class="inputBox">
                            <input type="text" name="pname" class="box" required placeholder="Enter product name">
                            <input type="text" name="pcategory" class="box" required placeholder="Select category">
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

</html>
