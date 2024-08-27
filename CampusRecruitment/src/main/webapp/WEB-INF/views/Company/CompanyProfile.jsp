<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<form action="/company/update_profile">

	<input type="text" name="name" placeholder="name" value="${company.name}" readonly><br>
	<input type="email" name="email" placeholder="email" value="${user.email}" readonly><br>
	<input type="text" name="cin" placeholder="cin" value="${company.cin}" readonly><br>
	<input type="text" name="description" placeholder="description" value="${company.description}"><br>
	<input type="text" name="address" placeholder="address" value="${company.address}"><br>
	
	<input type="submit" name="Update">

</form>
</body>
</html>
 -->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <style>
    /* Company profile styles */
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
    #company-profile p{
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
      text-align: center;
    }

    p {
      margin-bottom: 10px;
      margin-right: 30%;
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
  <title>Company Profile</title>
</head>


<body>
  

  <!-- Company Profile Section -->
    <div id="company-profile">
      <img src="https://via.placeholder.com/150" alt="Company Logo">
      <h2>Company Name</h2>
      <p><strong>Company Name:</strong> &nbsp;&nbsp;${company.name}<span class="update-value" id="name-value"></span></p>
      <p><strong>Email ID:</strong> &nbsp;&nbsp;${user.email}<span class="update-value" id="email-value"></span></p>
      <p><strong>CIN:</strong> &nbsp;&nbsp;${company.cin}<span class="update-value" id="cin-value"></span></p>
      <p><strong>Description:</strong> &nbsp;&nbsp;${company.description}<span class="update-value" id="desc-value"></span></p>
      <p><strong>Address:</strong> &nbsp;&nbsp;${company.address}<span class="update-value" id="address-value"></span></p>

      <!-- Update button -->
      <button id="update-button" onclick="openUpdateForm()">Update</button>

      <!-- Update form -->
    </div>
    <form action="/company/update_profile">
      <div id="update-form" class="update-form">
        <h3>Update Company Information</h3>
        <label for="name">Company Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter company name" value="${company.name}" readonly>
        <label for="email">Email ID:</label>
        <input type="email" id="email" name="email" placeholder="Enter email ID" value="${user.email}" readonly>
        <label for="cin">CIN:</label>
        <input type="text" id="cin" name="cin" placeholder="Enter CIN" value="${company.cin}" readonly>
        <label for="desc">Description:</label>
        <input type="text" id="desc" name="description" placeholder="Description" value="${company.description}">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" placeholder="Enter address" value="${company.address}">
        <button style="align-items: center;">Save</button>
      </div>
    </form>

    <script>
      // Function to show the update form
      function openUpdateForm() {
        document.getElementById('update-form').style.display = 'block';
      }

  /*    // Function to update all fields
      function updateFields() {
        const name = document.getElementById('name').value;
        const email = document.getElementById('email').value;
        const cin = document.getElementById('cin').value;
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
      }*/
    </script>
</body>

</html>