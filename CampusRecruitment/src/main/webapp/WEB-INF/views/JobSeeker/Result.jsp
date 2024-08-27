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
    </style>

</head>
<!-- <object type="text/html" data="comapny_header.html" width="100%" height="100%"></object> -->

<body>
 
    <h2>All Candidates</h2>
    <div class="container center">

        <table class="table">
            <thead class="table-head">
                <tr>
                    <th>Company</th>
                    <th>Job Role</th>
                    <th>Marks</th>
                    <th>Status</th>
                </tr>
            </thead>
            
            <tbody>  
             <sp:forEach items="${rlist}" var="obj">
               <tr>
                    <td>${obj.exam.company.getName()}</td>
                    <td>${obj.exam.job.getTitle()}</td>
                    <td>${obj.marks}</td>
                    <sp:choose>
                     <sp:when test="${obj.marks>=obj.exam.getMinimumMarks()}">
                    <td>Pass</td>
                    </sp:when>
                    <sp:otherwise>
                    <td>Fail</td>
                    </sp:otherwise>
                    </sp:choose>
                </tr>
             </sp:forEach>
            </tbody>
        </table>
	
	
</body>

</html>