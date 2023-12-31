<%-- 
    Document   : admin-feedback
    Created on : Dec 25, 2023, 4:35:26 PM
    Author     : yvant
--%>

<%@page import="Class.AdminDAO"%>

<%@page import="GetterSetters.FeedbackItems"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    List<FeedbackItems> fbitems = AdminDAO.getFeedbackItems();
    request.setAttribute("fbitems", fbitems);
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/ce6f9ece82.js" crossorigin="anonymous"></script>
    <title>Home</title>

</head>

<body>

    <section id="menu">
        
        <div class="logo">
            <img src="logo.png" alt="">
        </div>

        <div class="items">
            <li><i class="fa-solid fa-chart-line"></i><a href="../Dashboard/home.html">Dashboard</a></li>
            <li><i class="fa-solid fa-boxes-stacked"></i><a href="#">Inventory</a></li>
            <li><i class="fa-solid fa-comments"></i><a href="#">Feedback</a></li>
        </div>        
    </section>
    <section id="interface">
        <h3 class="i-name">Feedback</h3>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-face-smile"></i>
                <div>
                    <h3>800</h3>
                </div>
            </div>
        </div>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-face-meh"></i>
                <div>
                    <h3>1000</h3>
                </div>
            </div>
        </div>

        <div class="values">
            <div class="v-box">
                <i class="fa-solid fa-face-frown"></i>
                <div>
                    <h3>50</h3>
                </div>
            </div>
        </div>

        <div class="dropdown-container">
            <select>
                <option value="" disabled selected>Rate Us</option>
                <option value="option1">Satisfied</option>
                <option value="option2">Neutral</option>
                <option value="option3">Unsatisfied</option>
            </select>
        </div>

        <div class="scrollable-container">
            <section class="add-products">                
                    <div class="container">
                        <c:forEach var="items" items="${fbitems}">
                        <section class="feed-products">                
                            <h5 class="title">${items.getUserEmail()}</h1>
                            <h5 class="title">${items.getFeedbackStatus()}</h1>
                            <p class="p-name">${items.getFeedbackText()}</p>
                        </section>
                        </c:forEach>

                   
                
            </section>
    </section>
</body>




<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

   
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body{
    width: 100%;
    background: rgb(212, 212, 212);
    position: relative;
    display: flex;
}

#menu{
    background: rgb(184, 241, 172);
    width: 300px;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
}

#menu .logo{
    display: flex;  
    align-items: center;
    color: whitesmoke;
    padding: 10px 0 0 70px;
}

#menu .logo img{
    width: 150px;
    margin-right: 15px;
}

#menu .items{
    margin-top: 130px;
}

#menu .items li{
    list-style: none;
    margin-top: 80px;
    padding: 25px 0;
    transition: 0.3s ease;
}

#menu .items li:hover{
    background: rgb(22, 83, 22);
    cursor: pointer;
}

#menu .items li:nth-child(3){
    border-left: 4px solid rgb(0, 0, 0);
}

#menu .items li i{
    color: rgb(0, 0, 0);
    width: 30px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 14px;
    margin: 0 10px 0 80px;
}

#menu .items li a{
    color: rgb(0, 0, 0);
    font-weight: 1000;
    text-decoration: none;
}

#menu .items li:hover i,
#menu .items li:hover a{
    text-decoration: none;
    color: black;
    font-weight: 1000;
    transition: 0.3s ease;
}

#interface{
    width: calc(100% - 300px);
    margin-left: 300px;
    position: relative;
}

.i-name{
    color: rgb(0, 0, 0);
    padding: 30px 30px 0 50px;
    font-size: 24px;
    font-weight: 800;
}

.p-name{
    color: rgb(255, 255, 255);
    font-size: 20px;
    padding-top: 3%;
}

.values{
    padding: 140px 30px 0 130px;
    display: inline-block;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}

.values .v-box{
    background: white;
    width: 350px;
    padding: 20px 20px;
    border-radius: 5px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

.values .v-box i{
    font-size: 25px;
    width: 60px;
    height: 60px;
    line-height: 60px;
    border-radius: 50%;
    text-align: center;
    color: white;
    background: rgb(73, 73, 73);
    margin-right: 15px;
}

#interface .dropdown-container {
    display: flex;
    align-items: center;
    margin-top: 20px;
    padding: 20px 30px 0 130px;
}

/* .scrollable-container {
    height: 500px;
    overflow-y: auto;
} */

.add-products{
    background-color: white;
    overflow-y: auto;
    height: 500px;
    margin: 20px;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
}

.feed-products{
    background-color: rgb(143, 143, 143);
    height: 250px;
    margin: 20px;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
    color: white;
    font-size: 30px;
    
    
}
</style>
</html>
