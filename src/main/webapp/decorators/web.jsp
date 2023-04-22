<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>

    <!-- css -->
    <link href="<c:url value='/template/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
    <!-- Thư viện twbsPagination (Phân trang) -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
    
    
</head>
<body>
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div style="margin-left: 30px;margin-right: 30px">
    	<dec:body/>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	
    <script type="text/javascript" src="<c:url value='/template/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	
</body>
</html>