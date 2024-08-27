<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>

    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Listings</title>
    <link rel="stylesheet" href="bootstrap.css">
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
        body {
            /* font-family: Arial, sans-serif; */
            margin: 0;
            padding: 0;
        }

        .containerbody {
            max-width: 1000px;
            margin: 15px auto;
            padding: 20px;
        }

        .job-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .job {
            flex-basis: calc(33.33% - 10px);
            margin-bottom: 25px;
            background-color: #f2f2f2;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .job img {
            width: 85%;
            display: block;
            margin: 0 auto;
            padding: 20px;
            align-items: center;
            border-radius: 25px;

        }

        .job-content {
            padding: 16px;
        }

        .apply-btn {
            display: block;
            margin: 10px auto;
            padding: 10px 18px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 999;
        }

        .popup h2 {
            margin-top: 0;
        }

        .popup input[type="text"],
        .popup input[type="file"] {
            width: 85%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
            display: inline-block;
            /* box-sizing: border-box; Ensure padding is included in width calculation */
        }

        .popup input[type="file"] {
            margin-right: 15px;
        }

        .popup button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        /* .popup button.close {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: transparent;
            color: #000;
            font-size: 18px;
            cursor: pointer;
        } */

        h1 {
            margin-top: 40px;
            text-align: center;
        }

        .popup h2 {
            text-align: center;

        }

       
        
    </style>
</head>

<body>
  

    <div class="containerbody">
        <h1>${company.name }</h1><br>
        <h2>Jobs Available</h2>
        <div class="job-container">
         <sp:forEach items="${jobList}" var="obj">
          <sp:if test="${obj.exam_status == true}">
            <div class="job">
                <img src="proj_5.jpg" alt="Job Image 1">
                <div class="job-content">
                    <h2>${obj.title}</h2>
                    <h6>${obj.experience}years | ${obj.expected_salary} Lacs PA | ${obj.location} | Vacancy-${obj.vacancies}</h6>
                        <p>Description : ${obj.description} </p>
                  <a style="text-decoration:none;" href="/jobseeker/instructions/${obj.jobId}"><button class="apply-btn" >Apply</button></a>
                </div>
                
                </div>
             </sp:if>
                </sp:forEach>
            </div>
            
  <!--   <div class="popup" id="popup">
        <h2>Apply for Job</h2>
        <form class="pop">
            <label for="name">Name:</label required>
            <input type="text" id="name" name="name" placeholder="Your Name" required><br>
            <label for="resume">Resume:</label>
            <input type="file" accept=".pdf,.doc,.docx" required><br>
            <button type="submit">Submit</button>
            <button onclick="closePopup()">Close</button>
        </form>

    </div>
 -->
    <script>
        window.onscroll = function () { scrollFunction() };

        function scrollFunction() {
            var navbar = document.getElementById("navbar");
            if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                navbar.classList.add("scrolled");
            } else {
                navbar.classList.remove("scrolled");
            }
        }

        function openPopup() {
            var popup = document.getElementById('popup');
            popup.style.display = 'block';
        }

        function closePopup() {
            var popup = document.getElementById('popup');
            popup.style.display = 'none';
        }
    </script>

</body>

</html>