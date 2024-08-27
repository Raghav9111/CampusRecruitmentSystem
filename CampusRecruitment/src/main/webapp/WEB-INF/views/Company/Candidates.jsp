<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tables</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            /* font-family: Arial, Helvetica, sans-serif; */
        }

        .center {
            margin: 30px auto;
            width: 75%;
            align-items: center;

        }

        .table-head {
            background-color: #10898d;
            color: white;
        }

        h2 {
            padding-left: 8%;
            margin-top: 30px;
        }

        .btn-primary {
            background-color: #10898d;
        }

        .btn-primary:hover{
            background-color: #2f6264;
        }

        .modal-body{
          text-align: center;
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
        #n{
        	text-decoration: none;
        }
    </style>

</head>
<!-- <object type="text/html" data="comapny_header.html" width="100%" height="100%"></object> -->

<body>
<c:set var="keyToCompare" value="No Record Found" />
   
    <h2>Selected Candidates</h2>

    <div class="container center">

        <table class="table">
            <thead class="table-head">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Job Applied</th>
                </tr>
            </thead>
            <tbody>
                <!-- Add your table data here -->
             <sp:if test="${selectclist == NULL}">  	
             		<tr>
             			<td>No Selected Candidate</td>
             		</tr>
             </sp:if> 
             <sp:if test="${selectclist != NULL}">
              <sp:forEach items="${selectclist}" var="obj">
                <tr>
                    <td>${obj.jobseeker.getName()}</td>
                    <td>${obj.jobseeker.user.getEmail()}</td>
                    <td>${obj.job.getTitle()}</td>
                </tr>
              </sp:forEach> 
              </sp:if>
                <!-- Add more rows if needed -->
            </tbody>
        </table>
    </div>
    <h2>All Candidates</h2>
    <div class="container center">

        <table class="table">
            <thead class="table-head">
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Applied Jobs</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Add your table data here -->
                <sp:if test="${clist == NULL}">  	
             		<tr>
             			<td>No Candidate Found</td>
             		</tr>
             </sp:if> 
              <sp:if test="${clist != NULL}">
              <sp:forEach items="${clist}" var="obj">
                <tr>
                    <td>${obj.jobseeker.getName()}</td>
                    <td>${obj.jobseeker.user.getEmail()}</td>
                    <td>${obj.job.getTitle()}</td>
                    <td>
                         <a target="_blank" href="/company/view_resume/${obj.jobseeker.getJobSeekerId()}"><button class="btn btn-primary success">View Resume</button></a>
                    	<button class="btn btn-primary accept" onclick="openPopup(${obj.scId})">Accept</button>
                        <button class="btn btn-secondary decline" data-name="John Doe">Decline</button>
                       </td>
                </tr>
              </sp:forEach>  
             </sp:if>
                <!-- Add more rows if needed -->
            </tbody>
        </table>
	
		<div class="popup" id="popup">        
            <label for="name">Do you want to Select ?</label required><br><br>
            <a id="reqId" style="text-decoration:none;"><button class="btn btn-success">Yes</button></a>
            <button class="btn btn-danger" onclick="closePopup()">No</button>
   		</div>

        <!-- Feedback form modal -->
        <div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel">Provide Feedback for <span
                                id="candidateName"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="feedbackForm">
                            <div class="form-group">
                                <label for="technical-skill">Technical Skill:</label>
                                <select id="technical-skill">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>
                                <br><br>
                                <label for="programming">Programming:</label>
                                <select id="programming">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>
                                <br><br>
                                <label for="certification">Certification:</label>
                                <select id="certification">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>
                                <br><br>
                                <label for="experience">Experience:</label>
                                <select id="experience">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>
                                <br><br>
                                <label for="certification">Certification:</label>
                                <select id="certification">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>
                                <br><br>
                                <label for="experience">Experience:</label>
                                <select id="experience">
                                    <option value="excellent">Excellent</option>
                                    <option value="good">Good</option>
                                    <option value="need-to-improve">Need to Improve</option>
                                </select>


                                <!-- Add more feedback criteria here -->
                                <input type="hidden" id="candidateEmail" name="candidateEmail">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="submitFeedback">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="job_company.js"></script>
        <script>
            $(document).ready(function () {
                $('.decline').click(function () {
                    var name = $(this).data('name');
                    $('#candidateName').text(name);
                    $('#candidateEmail').val($(this).closest('tr').find('td:eq(1)').text());
                    $('#feedbackModal').modal('show');
                });

                $('#submitFeedback').click(function () {
                    // Here you can handle the feedback form submission using AJAX or any other method
                    // Retrieve the form data and perform the necessary actions
                    $('#feedbackModal').modal('hide');
                    alert('Feedback submitted successfully!');
                });
            });
            
            function openPopup(scId) {
            	const url = "/company/select_candidate/"+scId;
            	var send = document.getElementById('reqId');
            	send.setAttribute('href',url);
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