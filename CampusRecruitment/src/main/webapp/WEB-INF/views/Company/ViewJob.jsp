<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<!-- <form action="/company/update_job/${job.jobId}">

	<input type="text" name="title" placeholder="title" value="${job.title}" readonly><br>
	<input type="text" name="description" placeholder="description" value="${job.description}"><br>
	<input type="number" name="vacancy" placeholder="vacancy" value="${job.vacancies}"><br>
	<input type="text" name="technologyRequired" placeholder="technologyRequired" value="${job.technologyRequired}"><br>
	<input type="text" name="experience" placeholder="experience" value="${job.experience}"><br>
	<input type="text" name="location" placeholder="location" value="${job.location}"><br>
	<input type="text" name="expectedSalary" placeholder="expectedSalary" value="${job.expected_salary}"><br>
	<input type="submit" name="Update">
	
	<br>
	<br>
	<br>
	
	<a href="/company/cmp_profile">Profile</a>

</form>
 -->
  <section id="add-edit-job" class="row">
            <!-- <div class="col-md-6"> -->
            <h2>Add/Edit Job</h2>
            <form action="/company/update_job/${job.jobId} id="job-form">
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-title">Job Profile:</label>
                            <input type="text" name="title" class="form-control add-edit-input" id="job-title" value="${job.title}" readonly>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-vacancy">Vacancy:</label>
                            <input type="text" name="vacancies" class="form-control add-edit-input" id="job-vacancy" value="${job.vacancies}">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-technology">Technology Required:</label>
                            <input type="text" name="technologyRequired" class="form-control add-edit-input" id="job-technology" value="${job.technologyRequired}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-experience">Experience:</label>
                            <input type="text" name="experience" class="form-control add-edit-input" id="job-experience" value="${job.experience}">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-location">Location:</label>
                            <input type="text" name="location" class="form-control add-edit-input" id="job-location" value="${job.location}">
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="job-salary">Expected Salary:</label>
                            <input type="text" name="expectedSalary" class="form-control add-edit-input" id="job-salary" value="${job.expected_salary}">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="job-description">Description:</label>
                            <input type="text" name="description" class="form-control add-edit-input" id="job-description" value="${job.description}">
                        </div>
                    </div>
                </div>
                <button type="button" class=" btn-block" ">Edit
                    Job</button>

            </form>
            <!-- </div> -->
        </section>

</body>
</html>