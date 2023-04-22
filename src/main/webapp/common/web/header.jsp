<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href='<c:url value="/index.jsp"/>'>Twinkle</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button><form action="SearchControl" method="post">
		<div class="collapse navbar-collapse" id="navbarResponsive">
		
			<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<input class="form-control me-2" type="text"
					placeholder="Nội Dung Tìm Kiếm" aria-label="Search" name="txtSearch">
			</li>
			<li class="nav-item" style="margin-left: 1em; margin-right: 1em;">
				<button class="btn btn-outline-success" type="submit" name="btnGo">Tìm</button>
			</li>
				<c:if test="${not empty USERMODEL }">
					<c:if test="${ USERMODEL.roleId != 1}">
						<li class="nav-item"><a class="nav-link" href='<c:url value="/index.jsp"/>'>Welcome,
								${USERMODEL.fullName }</a></li>
						<li class="nav-item"><a class="nav-link"
							href='<c:url value="/thoat?type=dangNhap&action=logout"/>'>Thoát</a></li>
					</c:if>
					<c:if test="${ USERMODEL.roleId == 1}">
						<li class="nav-item active"><a class="nav-link"
							href='<c:url value="/admin-home"/>'>Trang quản trị <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/index.jsp"/>'>Welcome,
								${USERMODEL.fullName }</a></li>
						<li class="nav-item"><a class="nav-link"
							href='<c:url value="/thoat?type=dangNhap&action=logout"/>'>Thoát</a></li>
					</c:if>
				</c:if>
				<c:if test="${empty USERMODEL }">
					<li class="nav-item"><a class="nav-link"
						href='<c:url value="/dang-nhap?type=dangNhap&action=login"/>'>Đăng nhập</a></li>
				</c:if>

			</ul>
		</div>
		</form>
	</div>
</nav>