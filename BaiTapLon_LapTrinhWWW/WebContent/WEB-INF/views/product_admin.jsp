<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Admin</title>
<link id="callCss"
	href="<c:url value="/resources/themes/bootshop/bootstrap.min.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/themes/css/base.css" />"
	rel="stylesheet" media="screen" />
<link rel="stylesheet"  href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.w3-sidebar a {font-family: "Roboto"; text-decoration : none;}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat";}
 tr{ border : 10px solid white;}
</style>

<!-- Bootstrap style responsive -->
<link
	href="<c:url value="/resources/themes/css/bootstrap-responsive.min.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/themes/css/font-awesome.css" />"
	rel="stylesheet" type="text/css">

<body>
	<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top"
		style="z-index: 3; width: 250px" id="mySidebar">
		<div class="w3-container w3-display-container w3-padding-16">
			<h3 class="w3-wide">
				<a href="${pageContext.request.contextPath}/"><img width="30%" height="30%"
					src="<c:url value="/resources/themes/images/logo-home1.png" />"></a>
			</h3>
		</div>
		<div id="demoAcc"
			class="w3-bar-block w3-padding-large w3-medium">
			<a href="${pageContext.request.contextPath}/admin" class="w3-bar-item w3-button w3-light-grey"><i
				class="fa fa-caret-right w3-margin-right"></i>Quản lý sản phẩm</a>
			<a href="${pageContext.request.contextPath}/admin/quanlyhoadon" class="w3-bar-item w3-button w3-light-grey"><i
				class="fa fa-caret-right w3-margin-right"></i>Quản lý hóa đơn</a> 
			<a href="${pageContext.request.contextPath}/admin/showforminsert" class="w3-bar-item w3-button w3-light-grey"><i
				class="fa fa-caret-right w3-margin-right"></i>Thêm mới sản phẩm</a>
		</div>
	</nav>	
	<div class="w3-container" style="margin-left: 250px;">
		<header>
			<h2>Quản lý sản phẩm</h2>
		</header>
		<div style="padding: 5px 5px 5px 5px; margin-top : 40px;">
			<div class="w3-responsive">
				<table class="w3-table-all w3-large" style = "margin-bottom: 20px;">
					<tr>
						<th style = "width : 46%;">Sản phẩm</th>
						<th style = "width : 15%;">Đơn giá</th>
						<th>Thao tác</th>
					</tr>	
				</table>
				<table class="w3-table w3-large w3-border">
					<c:forEach var = "sanpham" items = "${listpros }">
						<tr>
							<td style="width: 46%;" class="w3-row">
								<div class="w3-third">
									<img
										src="<c:url value="/resources/${sanpham.urlHinhAnh}" />"
										alt="image" style="width: 100px">
								</div>
								<div class="w3-third">
									<p class="w3-margin">${sanpham.tenSanPham}</p>
								</div>
								<div class="w3-third">
									<div class="w3-margin">
										<span>${sanpham.loaiSanPham}</span><br> 
										<span><c:choose>
												<c:when test="${sanpham.soLuongTon > 0}">
													<h4>Còn hàng</h4>
												</c:when>
												<c:otherwise>
													<h4 style="color: red">Hết hàng</h4>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
								</div>
							</td>
							<td style="width: 15%;" class="w3-margin"	>${sanpham.donGia}</td>
							<td>
								<a href="${pageContext.request.contextPath}/admin/showformedit/${sanpham.maSanPham}">
									<button class="w3-button w3-margin w3-red" type="button">Sửa</button></a>
								<a href="${pageContext.request.contextPath}/admin/delete/${sanpham.maSanPham}">
									<button class="w3-button w3-margin w3-red" type="button">Xóa</button></a>
							</td>
						</tr>
					</c:forEach>
				</table>			
			</div>
		</div>

	</div>
</body>
</html>