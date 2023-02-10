<%--
  Created by IntelliJ IDEA.
  User: kazaf
  Date: 12/4/2022
  Time: 11:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="./img/favicon.webp" type="image/x-icon">
    <title>Login</title>
    <link rel="stylesheet" href="./css/common/login.css"/>
</head>

<body>
<div class="container">
    <h1>Login</h1>
    <form action="login" method="POST">
        <div class="form-control">
            <input type="text" name="email" id="email" placeholder="Email or Account"/>
            <span></span>
            <small></small>
        </div>
        <div class="form-control">
            <input type="password" name="password" id="password" placeholder="Password"/>
            <span></span>
            <small></small>
        </div>
            <p style="color: red;">${error}</p>
        <div class="" style="display: flex; gap: 10px; align-items: center;">
            <input type="checkbox" id="remember" name="remember" placeholder="Password"
                   style="height: 15px; width: 15px;"/>
            <label for="remember" style="color: rgb(146, 144, 144);">Remember password</label>
        </div>
        <input type="submit" value="Login"/>
        <div class="signup_link">Not a member? <a href="#">Signup</a></div>
    </form>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./js/lib/lib-validate.js"></script>
<script src="./js/common/login.js"></script>

</html>