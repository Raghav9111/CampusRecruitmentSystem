<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<form action="/web/reg_js">

	<input type="text" name="name" placeholder="name"><br>
	<input type="email" name="email" placeholder="email"><br>
	<input type="password" name="password" placeholder="password"><br>
	<input type="text" name="contact" placeholder="contact"><br>
	<input type="text" name="description" placeholder="description"><br>
	<input type="text" name="role" placeholder="role"><br>
	<input type="text" name="skills" placeholder="skills"><br>
	<input type="file" name="resume" placeholder="resume"><br>
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
    <title>Register Jobseeker</title>

    <style>
        /* login.css */

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .container-register {
            width: 30%;
            /* Adjusted width to make the form smaller */
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
            background-color: #10898d;
            /* Changed button color */
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0a6f73;
            /* Darker shade on hover */
        }

        p {
            text-align: center;
            margin-top: 20px;
            /* Added spacing from the top */
        }

        a {
            text-decoration: none;
            color: #10898d;
        }

        a.jobseeker {
            float: right;
            /* Aligning to the right */
            margin-top: 20px;
            /* Adding spacing from the top */
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

</head>

<body>
    <div class="container-register">
        <h1>Register Form</h1>

        <form action="/web/reg_js" id="registerForm" method="POST" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="enter full name" required>

            <label for="email">Email ID:</label>
            <input type="email" id="email" name="email" placeholder="Enter Email ID" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <label for="contact">Contact:</label>
            <input type="text" id="contact" name="contact" placeholder="Enter contact">

            <label for="desc">Description:</label>
            <input type="text" id="desc" name="description" placeholder="Description">

            <label for="role">Role:</label>
            <input type="text" id="role" name="role" placeholder="role">

            <label for="skills">Skills:</label>
            <input type="text" id="skills" name="skills" placeholder="skills">

            <label for="resume">Upload Resume:</label>
            <input type="file" id="resume" name="file">

		    <label for="profile">Upload Photo:</label>
            <input type="file" id="profile" name="profile">

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="Enter address">

            <a href="/web/register_company" class="jobseeker" style="text-align: end;"> Are You a Company?</a>
            <br>

            <button type="submit" name="submit">Register</button>
            <p>Already have an account? <a href="/web/login">Login here</a></p>
        </form>

    </div>

    <script src="script.js"></script>
</body>

</html>