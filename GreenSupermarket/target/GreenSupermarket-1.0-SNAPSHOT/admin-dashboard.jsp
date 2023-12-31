<%-- 
    Document   : admin-dashboard
    Created on : Dec 25, 2023, 4:35:14 PM
    Author     : yvant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/ce6f9ece82.js" crossorigin="anonymous"></script>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="css/admin-dashboard.css">
</head>

<body>

    <section id="menu">
        
        <div class="logo">
            <img src="assets/images/nav.png" alt="">
        </div>

        <div class="items">
            <li><i class="fa-solid fa-chart-line"></i><a href="admin-dashboard.jsp">Dashboard</a></li>
            <li><i class="fa-solid fa-boxes-stacked"></i><a href="admin-inventory.jsp">Inventory</a></li>
            <li><i class="fa-solid fa-comments"></i><a href="admin-feedback.jsp">Feedback</a></li>
        </div>      
    </section>
    <section id="interface">
        <h3 class="i-name">Dashboard</h3>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-users"></i>
                <div>
                    <h3>800</h3>
                    <span>Current Users</span>
                </div>
            </div>
        </div>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-check-double"></i>
                <div>
                    <h3>1000</h3>
                    <span>Completed Orders</span>
                </div>
            </div>
        </div>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-spinner"></i>
                <div>
                    <h3>50</h3>
                    <span>On-going Orders</span>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
