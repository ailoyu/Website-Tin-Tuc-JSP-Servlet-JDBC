<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>
</head>
<body>
	<div class="container">
			<div class="main-div">
			<div class="login-form">
			<div class="panel">
   <h2>Admin Login</h2>
   <p>Please enter your email and password</p>
   </div>
			<!-- Nếu message ko empty -> ms báo lỗi -->			
			<c:if test="${not empty message }">
			
				<div class="alert alert-${alert }">
					${message }
				</div>
			
			</c:if>
				
				
				
				<form action="<c:url value='/dang-nhap'/>" id="formLogin"
					method="post">
					<input type="hidden" value="login" name="action" />
					<div class="form-group">
						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="Tên đăng nhập">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Mật khẩu">
					</div>
					<button type="submit" class="btn btn-primary">Đăng nhập</button>
				</form>
					<p class="botto-text" style="color: black;"> Designed by Twinkle</p>
			</div>
		</div>
	</div>
</body>
</html>