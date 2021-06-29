<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Person modify</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
	.container{border:1px solid #ddd;margin:auto;align:center;}
    #main{width:100%;}
    h2{width:100%;text-align:center;}
    table{width:90%;text-align:center;}
    #head{height:50px;background-color:rgba(100, 148, 237, 0.699);}
    #body{height:40px;}
    #footer{width:90%;margin:auto;}
    #navi{line-height:35px;}
    #backdiv{text-align:right;}
    #search{text-align:right;}
</style>
<script>
	$(function(){
		$(".modibtn").on("click",function(){
			if($(this).val()=='수정'){
        		$(this).val('완료'); 
        		$(this).parents(".body").find(".name").attr("contenteditable","true");
        		$(this).parents(".body").find(".contact").attr("contenteditable","true");
            	$(this).parents(".body").find(".name").focus();
        	}else{
        		let name = $(this).parents(".body").find(".name").text();
        		$(this).parents(".body").find(".modiname").val(name);
        		
        		let contact = $(this).parents(".body").find(".contact").text();
        		$(this).parents(".body").find(".modicontact").val(contact);
        		
         		$(this).parents(".frm").attr("action","modifyProc.person").submit(); 
        	}
		})
		
        $("#back").on("click",function(){
            location.href = "index.jsp";
        })
	})
</script>
</head>
<body>
	<div class="container p-3">
        <div class="row pt-4" id="main">
            <h2><strong>자유게시판</strong></h2>
        </div>
        <table border="1" align="center">
            <tr id="head">
            	<th align="center">NO</th>
                <th align="center">ID</th>
                <th align="center">NAME</th>
                <th align="center">CONTACT</th>
                <th align="center">MODIFY</th>
            </tr>
        <c:forEach var="list" items="${list}" varStatus="s">
        <form action="" method="get" class="frm">
        	<tr class="body">
            	<td>${s.count}</td>
                <td>
                	${list.id} <input type="hidden" name="id" value=${list.id }>
                </td>
                <td class="name">
                	${list.name} <input type="hidden" name="name" class="modiname" value=${list.name }>
                </td>
                <td class="contact">
                	${list.contact} <input type="hidden" name="contact" class="modicontact" value=${list.contact }>
                </td>
                <td>
                	<button class="modibtn btn btn-outline-primary" type="button">수정</button>
                </td>
            </tr>
        </form>
        </c:forEach>
        </table>
        <div id="footer" class="row pt-2">
		</div>	
     		<div class="col-2 p-0" id="backdiv">
				<input type="button" value="뒤로가기" id="back" class="btn btn-secondary">
     		</div>       
        </div>
        
        <c:choose>
   		<c:when test="${result>0}">
   			<script>
   				alert("회원정보 수정에 성공하셨습니다.");
   				location.href= "index.jsp";
   			</script>
   		</c:when>
   		<c:otherwise>
   			<script>
   				alert("회원정보 수정에 실패하셨습니다.");
   				location.href= "index.jsp";
   			</script>
   		</c:otherwise>
   </c:choose>
</body>
</html>
            