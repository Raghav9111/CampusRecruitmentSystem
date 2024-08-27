<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Placement System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0px;
        }

        .container1 {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #10898d;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        .columns {
            display: flex;
            justify-content: space-around;
        }

        .column {
            width: 38%;
            
        }

        .question {
            margin-bottom: 20px;
        }

        .options {
            list-style-type: none;
            padding: 0;
        }

        .options li {
            margin-bottom: 10px;
        }

        .button-container {
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

        .logo{
            width: 150px;
            height: auto;
        }

    </style>
</head>

<body>
  
    <div class="container1">
        <h2>Placement Test</h2><br><br>
        <form onsubmit="generateQuestion(event)" action="/company/save_question/${exam}" method="POST" id="placementForm">
            <div id="parentDiv" class="columns">
               <!--  <div >
                     First Column 
                        First Question -->
                    <div class="column"> 
                        <div class="childDiv">
                                <label for="q1">1. Enter the question:</label>
                                <input type="text" id="q1" class="question form-control" name="q1" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q1_answer" class="corrAns">Enter the correct option:</label>
                                <select id="q1_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q2">2. Enter the question:</label>
                                <input type="text" id="q2" class="question form-control" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q2_answer" class="corrAns">Enter the correct option:</label>
                                <select id="q2_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q3">3. Enter the question:</label>
                                <input type="text" id="q3" class="question form-control" name="q3" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q3_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q3_answer" name="q3_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q3_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q4">4. Enter the question:</label>
                                <input type="text" id="q4" class="question form-control" name="q4" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q4_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q4_answer" name="q4_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q4_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q5">5. Enter the question:</label>
                                <input type="text" id="q5" class="question form-control" name="q5" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q5_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q5_answer" name="q5_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q5_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                     </div>
                     <div class="column">
                         <div class="childDiv">
                                <label for="q6">6. Enter the question:</label>
                                <input type="text" id="q6" class="question form-control" name="q6" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q6_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q6_answer" name="q6_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q6_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q7">7. Enter the question:</label>
                                <input type="text" id="q7" class="question form-control" name="q7" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q7_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q7_answer" name="q7_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q7_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q8">8. Enter the question:</label>
                                <input type="text" id="q8" class="question form-control" name="q8" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q8_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q8_answer" name="q8_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q8_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q9">9. Enter the question:</label>
                                <input type="text" id="q9" class="question form-control" name="q9" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q9_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q9_answer" name="q9_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q9_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                         
                         <div class="childDiv">
                                <label for="q10">10. Enter the question:</label>
                                <input type="text" id="q10" class="question form-control" name="q10" placeholder=" Question"
                                    required><br>
                                <input type="text" class="option1 form-control" placeholder="Option A"
                                            required><br>
                                <input type="text" class="option2 form-control" placeholder="Option B"
                                            required><br>
                                <input type="text" class="option3 form-control" placeholder="Option C"
                                            required><br>
                                <input type="text" class="option4 form-control" placeholder="Option D"
                                            required><br>
                                <label for="q10_answer" class="corrAns">Enter the correct option:</label>
                                <!-- <input type="text" id="q10_answer" name="q10_answer" class="form-control"
                                    placeholder="Correct option (A, B, C, or D)" required> -->
                                <select id="q10_answer" class="corrAns form-control" required>
                                	<option value="" disabled selected>Please select</option>
									<option value="Option 1">Option 1</option>
									<option value="Option 2">Option 2</option>
									<option value="Option 3">Option 3</option>
									<option value="Option 4">Option 4</option>
								</select>
                            <br>
                         </div>
                       </div>  
                         
             </div>
             <div>               
                <input type="hidden" name="questionData" id="storeData">
            </div>
            <div class="button-container">
                <input type="submit" class="btn btn-custom" value="Submit"  id="bid">
            </div>
        </form>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <script src="/assets/js/addTest.js"></script>

</body>

</html>