<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert product form</title>
<link id="callCss"
	href="<c:url value="/resources/themes/bootshop/bootstrap.min.css" />"
	rel="stylesheet" media="screen">
<link href="<c:url value="/resources/themes/css/base.css" />"
	rel="stylesheet" media="screen" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.w3-sidebar a {
	font-family: "Roboto";
	text-decoration: none;
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat";
}

tr {
	border: 10px solid white;
}

*[id$=errors] {
	color: red;
	font-style: italic;
}
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
		<div class="w3-row w3-large" style="margin-top: 20px;">
			<div class="w3-third">
				<hr class="soft">
			</div>
			<div class="w3-third w3-center">
				<h2>Thêm sản phẩm mới</h2>
			</div>
			<div class="w3-third">
				<hr class="soft">
			</div>
		</div>

		<div class="w3-container">
			<div class="" style="margin-left: 15%;">
				<form:form id="formproduct" class="" action="${pageContext.request.contextPath}/admin/add"
					method="POST">
					<table>
						<tr>
							<td><h5>Mã sản phẩm:</h5></td>
							<td><form:input type="text" path="maSanPham"
									class="w3-padding-16" /> <form:errors path="maSanPham"></form:errors></td>
						</tr>
						<tr>
							<td><h5>Tên sản phẩm:</h5></td>
							<td><form:input type="text" path="tenSanPham"
									class="w3-padding-16" /> <form:errors path="tenSanPham"></form:errors></td>
						</tr>
						<tr>
							<td><h5>Giá sản phẩm:</h5></td>
							<td><form:input type="number" min="1000" step="1000"
									class="w3-padding-16" path="donGia" /></td>
						</tr>
						<tr>
							<td><h5>Hình ảnh:</h5></td>
							<td><form:input type="file" path="urlHinhAnh"
									class="w3-padding-16"/></td>
						</tr>
						<tr>
							<td><h5>Loại sản phẩm:</h5></td>
							<td><form:select path="loaiSanPham" style="margin-top: 25px">
									<form:option value="may in" label="Máy In"></form:option>
									<form:option value="may scan" label="Máy Scan"></form:option>
								</form:select></td>
						</tr>
						<tr>
							<td><h5>Số lượng tồn:</h5></td>
							<td><form:input type="number" min="0" class="w3-padding-16"
									path="soLuongTon" /></td>
						</tr>
						<tr>
							<td><h5>Thông tin sản phẩm:</h5></td>
							<td><form:textarea class="w3-padding-16" path="moTa" /></td>
						</tr>

					</table>
					<div>${message }</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit"
								class="w3-button w3-center w3-black w3-padding-16">Thêm
								sản phẩm</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>

</body>
</html>