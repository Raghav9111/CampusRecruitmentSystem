<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sp" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<sp:forEach items="${jlist}" var="obj">
		${obj.title} <br>
		${obj.description} <br>
		<a href="/company/edit_job/${obj.jobId}"> Edit</a>
		
		<sp:if test="${obj.exam_status == false }">
			<a href="/company/add_test/${obj.jobId}">Add Test</a>
		</sp:if>
		
	</sp:forEach>
	
</body>
</html>