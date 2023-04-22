<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Đăng Nhập" /></title>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="<c:url value='/template/login/style.css' />" rel="stylesheet" type="text/css" media="all"/>
	

</head>
	

<body id="LoginForm">
   	
   	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    <br>
    <br>
    <br>
    <br>
    <br> 	
    <div class="container">
    	<dec:body/>
    </div>
    
	
	
</body>
</html>