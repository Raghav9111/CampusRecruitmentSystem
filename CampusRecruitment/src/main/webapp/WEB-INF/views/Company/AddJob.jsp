<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@include file="header.jsp"%>
       
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<form action="/company/add_job">

	<input type="text" name="title" placeholder="title"><br>
	<input type="text" name="description" placeholder="description"><br>
	<input type="number" name="vacancies" placeholder="vacancy"><br>
	<input type="text" name="technologyRequired" placeholder="technologyRequired"><br>
	<input type="text" name="experience" placeholder="experience"><br>
	<input type="text" name="location" placeholder="location"><br>
	<input type="text" name="expectedSalary" placeholder="expectedSalary"><br>
	
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Your Company - Jobs</title>
    <style>
        body {
            padding-top: 56px;
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
        }

        #add-edit-job {
            margin-top: 30px;

        }
        #add-edit-job h2{
            margin-left: 20px;
        }

        .add-edit-input {
            width: 100%;
        }

        form {
            margin-top: 70px;
        }

        .table-width-custom {
            width: 100%;
            /* Adjust the width as needed */
            margin: 20px auto;
            /* Center the table horizontally */
        }

        .table th,
        .table td {
            border: 1px solid #dee2e6;
            padding: 8px;
        }

        .table thead th {
            background-color: #10898d;
            color: #fff;
            border-color: #aeb1b1;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .table-hover tbody tr:hover {
            background-color: #e9ecef;

        }

        .btn-block {
            margin-left: 40%;
            width: 25%;
            background-color: #10898d;
            color: #fff;
            border-color:#aeb1b1 ;
        }

        .btn-block:hover {
            background-color: #205f61;
        }

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
    </style>
</head>

<body>
    <main class="container mt-4">
        <section id="job-list">
            <h2 class="mb-6">Open Job Positions</h2>
            <div class="table-width-custom">
                <table class="table table-bordered table-hover">
                    <thead class="thead">
                        <tr>
                            <th>Job Profile</th>
                            <th>Vacancy</th>
                            <th>Technology Required</th>
                            <th>Experience</th>
                            <th>Location</th>
                            <th>Expected Salary</th>
                            <th>Description</th>
                            <th><center>Action</center></th>
                        </tr>
                    </thead>
                    <tbody id="job-list-container">
                      <sp:forEach items="${jlist}" var="obj">
                         <tr>
                            <td>${obj.title}</td>
                            <td>${obj.vacancies}</td>
                            <td>${obj.technologyRequired}</td>
                            <td>${obj.experience}</td>
                            <td>${obj.location}</td>
                            <td>${obj.expected_salary}</td>
                            <td>${obj.description}</td>
                            <td>
                            <center>
                            <a href="/company/edit_job/${obj.jobId}" ><b>Edit</b> </a> &nbsp;
                            <sp:if test="${obj.exam_status == false}">
                            	<a href="/company/add_test/${obj.jobId}"  ><b>Add Test</b> </a>
                            </sp:if>
                            </center>
				            </td>
				            
                         </tr>
                      </sp:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <section id="add-edit-job" class="row">
            <!-- <div class="col-md-6"> -->
            <h2>Add Job</h2>
            <form action="/company/add_job" id="job-form">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-title">Job Profile:</label>
                            <input type="text" name="title" class="form-control add-edit-input" id="job-title" required>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-vacancy">Vacancy:</label>
                            <input type="number" name="vacancies" class="form-control add-edit-input" id="job-vacancy" required>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-technology">Technology Required:</label>
                            <input type="text" name="technologyRequired" class="form-control add-edit-input" id="job-technology" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-experience">Experience:</label>
                            <input type="text" name="experience" class="form-control add-edit-input" id="job-experience" required>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-location">Location:</label>
                            <input type="text" name="location" class="form-control add-edit-input" id="job-location" required>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-salary">Expected Salary:</label>
                            <input type="text" name="expectedSalary" class="form-control add-edit-input" id="job-salary" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-description">Description:</label>
                            <input type="text" name="description" class="form-control add-edit-input" id="job-description" required>
                        </div>
                    </div>
                </div>
                <button type="submit" class=" btn-block" >Add
                    Job</button>

            </form>
            <!-- </div> -->
        </section>
    </main>

     </body>

</html>