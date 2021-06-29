<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Person List</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<table border="1">
		<tr ><th colspan="3">Person Information
		</tr>
		<tr>
			<th>ID
			<th>NAME
			<th>CONTACT
		</tr>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.id}
				<td>${i.name}
				<td>${i.contact}
		</c:forEach>
		<tr><td colspan="3" align=center><a href="index.jsp"><button>Main</button></a>
		</tr>
</table>
</body>
</html>