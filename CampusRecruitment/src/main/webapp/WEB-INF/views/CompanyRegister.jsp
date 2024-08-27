<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<form action="/web/reg_cmp">

	<input type="text" name="name" placeholder="name"><br>
	<input type="email" name="email" placeholder="email"><br>
	<input type="password" name="password" placeholder="password"><br>
	<input type="text" name="cin" placeholder="cin"><br>
	<input type="text" name="description" placeholder="description"><br>
	<input type="file" name="certificate" placeholder="certificate"><br>
	<input type="text" name="address" placeholder="address"><br>
	
	<input type="submit" name="submit">

</form>
</body>
</html>
 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register company</title>
    <style>
       /* login.css */

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.container-register {
    width: 28%; /* Adjusted width to make the form smaller */
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="file"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="file"]:focus {
    border-color: dodgerblue;
    outline: none;
}

button {
    padding: 10px;
    background-color: #10898d; /* Changed button color */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0a6f73; /* Darker shade on hover */
}

p {
    text-align: center;
    margin-top: 20px; /* Added spacing from the top */
}

a{
  text-decoration: none;
  color: #10898d;
}

a.jobseeker {
    float:right; /* Aligning to the right */
    margin-top: 20px; /* Adding spacing from the top */
}

a:hover {
    text-decoration: underline;
}

    </style>

</head>


<body>
    <div class="container-register">
        <h1>Register Form</h1>
        <form action="/web/reg_cmp" id="registerForm" method="POST" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter full name" required>

            <label for="email">Email ID:</label>
            <input type="email" id="email" name="email" placeholder="Enter Email ID" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <label for="cin">CIN:</label>
            <input type="text" id="cin" name="cin" placeholder="Enter CIN" required>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" placeholder="Description" required>

            <label for="certificate">Upload Certificate:</label>
            <input type="file" id="certificate" name="file" placeholder="Upload certificate" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="Enter Address" required>

            <a href="/web/register_js" class="jobseeker" style="text-align: end;">Are You a Jobseeker?</a> <br><!-- Added class "jobseeker" here -->

            <button type="submit" name="submit">Register</button>
            <p>Already have an account? <a href="/web/login">Login here</a></p>
        </form>
    </div>

    <script src="script.js"></script>
</body>


</html>