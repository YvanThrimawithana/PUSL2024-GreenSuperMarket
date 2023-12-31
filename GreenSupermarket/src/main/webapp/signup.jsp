
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <link rel="stylesheet" type="text/css" href="css/signup.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<body>
<!--Navbar-->
<img  class="backsplash" src="assets/images/Backsplash.jpg">

<div class="form-popup">
    <div class="form-box">        
        <div class="form-content">
            <h2>Create your account</h2>
            <form method="post" action="<%=request.getContextPath()%>/CreateAccount">
                <div class="userform">
                    <div class="input-field">
                        <input name="Uemail" type="text" required>
                        <label>Email</label>
                    </div>
                    <div class="input-field">
                        <input name="Uname" type="text" required>
                        <label>Username</label>
                    </div>
                    <div class="input-field">
                        <input name="Upwd" type="password" required>
                        <label>Password</label>
                    </div>
                    <div class="input-field">
                        <input name="Urpwd" type="password" required>
                        <label>Re-enter Password</label>
                    </div>
                    
                    <div class="input-field">
                        <input name="pno" type="tel" required>
                        <label>Phone Number</label>
                    </div>
                </div>
                <button type="submit">Create account</button>
            </form>
            <div class="bottom-link">
                <a href="login.jsp">Already have an account?</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
