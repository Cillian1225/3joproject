<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Person Main</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
    *{box-sizing:border-box;}
    div{text-align:center; background-color:rgba(233, 255, 192, 0.5);border-radius:20px;}
    .container{width:1000px; height:150px; margin: auto; }
    .head{width:1000px; height:50px; text-align:center;line-height:50px;font-size:30px;}
    .head~div{float: left; width:25%; height:100px;line-height:100px;}
    div>button{width:60%; height:70%; border:0px; border-radius:10px; background-color: aquamarine; font-size:20px;}
    div>button:hover{border:2px dotted rgb(180, 243, 63); background-color:#ffc400; cursor: pointer;}
</style>
<script>
    $(function(){
        $("#inputBtn").on("click",function(){
            location.href="personInput.person";
        })
        $("#outputBtn").on("click",function(){
        	location.href="personList.person";
        })
         $("#deletBtn").on("click",function(){
        	location.href="personDelete.person";
        })
         $("#modifyBtn").on("click",function(){
        	location.href="personModify.person";
        })
    })
</script>
</head>
<body>
<div class="container">
    <div class="head">Person</div>
    <div class="input">
        <button id="inputBtn">PersonInput</button>
    </div>
    <div class="output">
        <button id="outputBtn">PersonList</button>
    </div>
    <div class="delete">
        <button id="deletBtn">PersonDelete</button>
    </div>
    <div class="modify">
        <button id="modifyBtn">PersonModify</button>
    </div>
</div>
</body>
</html>