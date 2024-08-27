<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="/web/login" method="POST">
	<input type="email" name="email" placeholder="email"><br>
	<input type="password" name="password" placeholder="password"><br>
	
	<input type="submit" value="Login">
	</form>
	
	errorMsg
</body>
</html>
-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/login.css">
    <title>Login</title>
</head>
<header>
    <h1>LOGIN</h1>
</head>
<body>

    <form id="loginForm" action="/web/login" method="POST">
        <label for="username">Username:</label>
        <input type="text" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="submit" name="submit">Login</button>
        <p>Don't have an account? <a href="/web/register_js">Register here</a></p>
    </form>
	<b>${errorMsg}</b>


    <script src="script.js"></script>
</body>

</html>