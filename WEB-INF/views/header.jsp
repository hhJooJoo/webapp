<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cpath}/resources/css/style.css" rel="stylesheet">
</head>
<body>
  <h1>REST</h1>
  
  <ul>
    <li><a href="${cpath }">home</a></li>
    <li><a href="${cpath }/ajax">ajax</a></li>
  </ul>
  
  <hr>