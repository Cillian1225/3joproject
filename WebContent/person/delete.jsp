<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script>
$(function(){
	$("#delsubmit").on("click",function(){
		
		if($("#delid").val()==""){
			alert("삭제할  ID를 입력해주세요")
			return false;
		}
	})
	
	
})


</script>


<body>

<table border=1 align=center>
	<tr>
			<th colspan=4>Person List
	</tr>

	<tr>
			<td align=center>ID
			<td align=center>Name
			<td align=center>Contact
		
	</tr>
	

	<c:forEach var="i" items="${list}">
	<tr>
			<td>${i.id}
			<td>${i.name}
			<td>${i.contact}
			
	</tr>
	</c:forEach>
	
	
	
	<tr>
		<td colspan=4 align=center>
		<form action="deleteController" method=get id = delform>
		<input type= text name= delid placeholder="삭제할 ID" id="delid">
		<input type=submit id=delsubmit value=" 삭제">
		</form>
	
	
	</tr>

			<td colspan=4 align="center"><a href="index.jsp"><button>Back</button></a>
		
	
	


</table>








</body>
</html>