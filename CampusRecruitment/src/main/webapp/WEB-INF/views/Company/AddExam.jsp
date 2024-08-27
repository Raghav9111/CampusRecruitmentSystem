<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="header.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Add Exam</title>
	<!-- Bootstrap CSS -->
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
		.popup-container {
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: #fff;
			padding: 20px;
			border: 1px solid #10898d;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			width: 400px;
			max-width: 90%;
			height: 300px;
			max-height: 90%;
		}


		#btn{
			text-align: center;
		}

		.btn-custom {
			background-color: #10898d;
			border-color: #10898d;
		}

		.btn-custom:hover {
			background-color: #0b6e71;
			border-color: #0b6e71;
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
	<div class="popup-container">
		<form action="/company/add_exam" method="POST">
			<div class="form-group"><br>
				<label for="desc">Description: </label>
				<input type="text" class="form-control" id="desc" placeholder="Enter Exam Description"
					name="description" required>
			</div>
			<div class="form-group">
				<label for="min">Minimum Marks Required:</label>
				<input type="number" class="form-control" id="min" min="5" max="10" placeholder="Enter minimum marks"
					name="minimumMarks" required>
				<input type="hidden" value="${jId}" name="jId">
			</div><br>
			<div id="btn">
				<button type="submit" class="btn btn-custom">Next</button>
			</div>
		</form>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>