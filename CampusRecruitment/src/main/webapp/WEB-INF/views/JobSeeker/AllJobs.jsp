<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@include file="header.jsp"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
       
<!DOCTYPE html>
<html lang="en">
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
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container-main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }

        .job {
            background-color: #f2f2f2;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
        }

        .job h2 {
            margin-top: 0;
        }

        .search-bar {
            margin-bottom: 20px;
        }

        .search-bar input[type="text"] {
            padding: 8px;
            width: calc(100% - 200px); 
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .search-bar button {
            margin: 5px;
            padding: 10px 16px;
            background-color: #10898d;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-bar button:hover{
            background-color: #38797a;
        }
    </style>
</head>
<body>

<div class="container-main ">
    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search for job role...">
        <button onclick="searchJobs()">Search</button> 
         <button onclick="clearTextFieldAndReload()">Clear</button>
    </div>

    <div id="jobListings">
    <sp:forEach items="${jlist}" var="obj">
    <sp:if test="${obj.exam_status == true}">
        <div class="job">
            <h2>${obj.title}</h2>
            <h6><strong>Experience: </strong>${obj.experience}years |<strong>Expected Salary:</strong> ${obj.expected_salary} Lacs PA |<strong>Location:</strong> ${obj.location} | <strong>Vacancy:</strong>${obj.vacancies}</h6>
                        <p><strong>Description :</strong> ${obj.description} </p>
            <a href="/jobseeker/instructions/${obj.jobId}">Apply Now</a>
        </div>
        </sp:if>
    </sp:forEach>
       
<script>
    // Function to search job roles
    function searchJobs() {
        const searchInput = document.getElementById('searchInput');
        const searchTerm = searchInput.value.toLowerCase();
        const jobListings = document.querySelectorAll('.job');

        jobListings.forEach(job => {
            const title = job.querySelector('h2').innerText.toLowerCase();
            if (title.includes(searchTerm)) {
                job.style.display = 'block'; // Show job listing
            } else {
                job.style.display = 'none'; // Hide job listing
            }
        });
    }
    
    function clearTextFieldAndReload() {
        // Clear the text field
        document.getElementById("searchInput").value = "";
        // Reload the page body
        location.reload();
      }
</script>

</body>
</html>
