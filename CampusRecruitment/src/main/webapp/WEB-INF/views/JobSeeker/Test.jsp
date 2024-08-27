<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>

<style>
.container1 {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #10898d;
            border-radius: 10px;
        }
        .question {
            margin-bottom: 20px;
        }
</style>

</head>
<body>

  <div class="container1">
   <form onsubmit="generateJson(event)" action="/jobseeker/save_result/${job.jobId}" method="POST">
 	
 	   <div id="box" >
 		<sp:set var="count" value="1"/>
 		<sp:forEach items="${qlist}" var="obj">
 			<input type="hidden" value="${obj.questionId}">
 			<label class="question"><b>Question ${count} : ${obj.question}</b></label><br>
 			<input type="radio" onchange="set(event)" name="${obj.questionId}" value="${obj.option1}"required>
 			<label>${obj.option1}</label> <br>			
 			<input type="radio" onchange="set(event)" name="${obj.questionId}" value="${obj.option2}"required>
 			<label>${obj.option2}</label> <br>
 			<input type="radio" onchange="set(event)" name="${obj.questionId}" value="${obj.option3}"required>
 			<label>${obj.option3}</label> <br>
 			<input type="radio" onchange="set(event)" name="${obj.questionId}" value="${obj.option4}"required>
 			<label>${obj.option4}</label><br><br>
			<sp:set var="count" value="${count + 1}"/>
			<input type="hidden" name="resData" id="setRes">
			
 		</sp:forEach>
 	</div>
 	<input class="btn btn-success" type="submit" value="Submit">
 </form>
 </div>
</body>

<script>
var answers=[];

function set(event)
{
	var ele = event.target;
	var ans= ele.value;
	var ques = ele.name;
	var existingData = answers.find(function(item) {
        return item.ques === ques;
    });
	if (existingData) {
        existingData.ans = ans;
    } else {
        var obj = {ques,ans};
        answers.push(obj);
    }
	console.log(answers);
}
function generateJson(event){
	//event.preventDefault();
	const resData = JSON.stringify(answers);
	//console.log(answers);
	document.getElementById('setRes').value = resData
	
	console.log(document.getElementById('setRes').value);
}

</script>
</html>