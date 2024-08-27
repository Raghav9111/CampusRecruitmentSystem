<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="header.jsp"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
      h1 {
            margin-top: 0;
            color: #333;
        }
        p {
            color: #666;
            line-height: 1.6;
        }
        
          #instructions {
      width: 50%;
      margin: 50px auto;
      padding: 20px;
      background-color: #f4f4f4;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
         .button {
             padding: 10px 20px;
            font-size: 16px;
            background-color: #10898d;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #097175;
        }
</style>
</head>
<body>


<div id= "instructions">
    <p><strong>Introduction:</strong><br>
        This test is designed to assess your skills and suitability for the role. There are ten questions. All of them are mandatory.
    </p>
    <p><strong>Technical Requirements:</strong><br>
        Ensure a stable internet connection and use a supported browser (Chrome, Firefox, Safari). Use a laptop or desktop computer for the best experience.
    </p>
  
    <p><strong>Issue:</strong><br>
     We appreciate your interest in the position. Contact us with any tecnical issues or concerns.
    </p>
   

	<sp:if test="${check == false}">
    	<a class="button" href="/jobseeker/test/${jid}"> Start</a>
    </sp:if>
    <sp:if test="${check == true}">
    	<h1>You already have applied!!</h1>
    </sp:if>
</div>    
    
</body>
</html>