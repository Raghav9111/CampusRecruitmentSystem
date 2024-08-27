<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="header.jsp"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
</head>
<body>
<form action="/jobseeker/update_profile">

	<input type="text" name="name" placeholder="name" value="${jobseeker.name}" readonly><br>
	<input type="email" name="email" placeholder="email" value="${user.email}" readonly><br>
	<input type="text" name="contact" placeholder="contact" value="${jobseeker.contact}"><br>
	<input type="text" name="description" placeholder="description" value="${jobseeker.description}"><br>
	<input type="text" name="role" placeholder="role" value="${jobseeker.role}"><br>
	<input type="text" name="skills" placeholder="skills" value="${jobseeker.skills}"><br>
	<input type="file" name="resume" placeholder="resume" value="${jobseeker.resume}"><br>
	<input type="text" name="address" placeholder="address" value="${jobseeker.address}"><br>
	
	<input type="submit" name="update">

</form>
</body>
</html>
 -->

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="bootstrap.css">
  <link rel="stylesheet" href="styles.css">
  <style>
    .navbar-custom {
      background-color: #10898d;
    }

    .navbar-brand {
      color: #fff;
      font-weight: bold;
    }

    .navbar-nav .nav-link {
      color: #fff;
    }

    .navbar-nav .nav-item {
      margin-right: 50px;
      /* Adjust the space between each li tag */
    }
    #company-profile {
      width: 50%;
      margin: 50px auto;
      padding: 20px;
      background-color: #f4f4f4;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    #company-profile p {
      margin-bottom: 10px;
      /* text-align: justify; */
      align-content: center;
      text-align: justify;
      margin-left: 30%;

    }

    #company-profile img {
      max-width: 100%;
      border-radius: 50%;
      margin-bottom: 20px;
    }

    h2 {
      font-size: 24px;
      color: #333;
    }

    p {
      margin-bottom: 10px;
    }

    #update-button {
      background-color: #10898d;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      width: 10%;
      font-size: medium;
    }

    #update-button:hover {
      background-color: #097175;
    }

    .update-form {
      display: none;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 50%;
      margin: 50px auto;
      padding: 20px;
    }

    .update-form label {
      display: block;
      margin: 10px 0;
      text-align: left;
    }

    .update-form input {
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
      margin-bottom: 10px;
    }

    .update-form button {
      background-color: #10898d;
      color: white;
      padding: 10px;
      width: 10%;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: medium;


    }

    .update-form button:hover {
      background-color: #097175;
    }

    .update-value {
      font-weight: bold;
      color: #333;
    }
  </style>
  <title>Jobseeker Profile</title>
</head>

<body>

  <!-- Company Profile Section -->
  <div id="company-profile">
    <img src="https://via.placeholder.com/150" alt="Company Logo">

    <p><strong> Name:</strong>&nbsp;&nbsp;${jobseeker.name} <span class="update-value" id="name-value"></span></p>
    <p><strong>Email ID:&nbsp;&nbsp;</strong>${user.email} <span class="update-value" id="email-value"></span></p>
    <p><strong>Contact:&nbsp;&nbsp;</strong>${jobseeker.contact} <span class="update-value" id="contact-value"></span></p>
    <p><strong>Description:&nbsp;&nbsp;</strong>${jobseeker.description} <span class="update-value" id="desc-value"></span></p>
    <p><strong>Role:&nbsp;&nbsp;</strong> ${jobseeker.role}<span class="update-value" id="role-value"></span></p>
    <p><strong>Skills:</strong>&nbsp;&nbsp;${jobseeker.skills} <span class="update-value" id="skills-value"></span></p>
    <p><strong>Address:</strong> &nbsp;&nbsp;${jobseeker.address}<span class="update-value" id="address-value"></span></p>

    <!-- Update button -->
    <button id="update-button" onclick="openUpdateForm()">Update</button>
  </div>
  <!-- Update form -->

<form action="/jobseeker/update_profile">
  <div id="update-form" class="update-form">
    <h3>Update Information</h3>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" placeholder="Enter full name" value="${jobseeker.name}" readonly>

    <label for="email">Email ID:</label>
    <input type="email" id="email" name="email" placeholder="Enter email ID" value="${user.email}" readonly>

    <label for="contact">Contact:</label>
    <input type="text" id="contact" name="contact" placeholder="Enter contact" value="${jobseeker.contact}">

    <label for="desc">Description:</label>
    <input type="text" id="desc" name="description" placeholder="Description" value="${jobseeker.description}">

    <label for="role">Role:</label>
    <input type="text" id="role" name="role" placeholder="role" value="${jobseeker.role}">

    <label for="skills">Skills:</label>
    <input type="text" id="skills" name="skills" placeholder="skills" value="${jobseeker.skills}">

    <label for="resume">Upload Resume:</label>
    <input type="file" id="resume" name="resume" value="${jobseeker.resume}">

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" placeholder="Enter address" value="${jobseeker.address}">

    <button>Save</button>
  </div>
</form>

  <script>
    // Function to show the update form
    function openUpdateForm() {
      document.getElementById('update-form').style.display = 'block';
    }

    // Function to update all fields
    function updateFields() {
      const name = document.getElementById('name').value;
      const email = document.getElementById('email').value;
      const cin = document.getElementById('contact').value;
      const desc = document.getElementById('desc').value;
      const address = document.getElementById('address').value;

      // Update values
      document.getElementById('name-value').innerText = name || '';
      document.getElementById('email-value').innerText = email || '';
      document.getElementById('cin-value').innerText = cin || '';
      document.getElementById('desc-value').innerText = desc || '';
      document.getElementById('address-value').innerText = address || '';

      // Hide the update form
      document.getElementById('update-form').style.display = 'none';
    }
  </script>
</body>

</html>