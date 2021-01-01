<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>SUMNARY</title>
<!-- Bootstrap style -->
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
/* tr{ border : 10px solid white;} */
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
				<a href="home"><img width="20%" height="20%" src="<c:url value="/resources/themes/images/logo-home1.png" />"></a>
			</h3>
		</div>
	</nav>
	<div class="w3-container" style="margin-left: 250px; max-width : 90%;">
		<header>
			<h2>Thông tin thanh toán</h2>
		</header>
		<form:form action = "checkout" method = "POST" style="margin-top: 30px;">
			
			<div class = "w3-row">
				<div class = "w3-col" style="width:35%">
					<div class="w3-row-padding">
						<div class="w3-half">
							<label>Họ</label>
							<form:input class="w3-input w3-border w3-padding-16" type="text"
								path="ho" />
						</div>
						<div class="w3-half">
							<label>Tên</label>
							<form:input class="w3-input w3-border w3-padding-16" type="text"
								path="ten" />
						</div>
					</div>
					<label>Số điện thoại</label>
					<form:input class="w3-input w3-border w3-padding-16"
						type="text" path="sdt" />
					<label>Email</label>
					<form:input class="w3-input w3-border w3-padding-16"
						type="email" path="email" />
					<label>Địa chỉ</label>
					<form:textarea class="w3-input w3-border w3-padding-16"
						path="diaChi" />
				</div>
				<div class = "w3-rest">
					<div class="w3-container w3-margin">
						<table class="w3-table-all" style="margin-bottom: 10px;">
							<tr>
								<th style="width: 60%;">Sản phẩm</th>
								<th style="width: 15%;">Số lượng</th>
								<th style="width: 15%;">Thành tiền</th>
							</tr>
						</table>
						<table class="w3-table w3-border">
							<c:forEach var="mapped" items="${sessionScope.myCartItems}">
								<tr>
									<td style="width: 60%;" class="w3-row">
										<div class="w3-col" style="width: 60%;">
											<p class="">${mapped.value.sanPham.tenSanPham}</p>
										</div>
										<div class="w3-rest">
											<div class="">
												<span>${mapped.value.sanPham.loaiSanPham}</span><br>
												<span>${mapped.value.sanPham.donGia} vnđ/ 1 sản phẩm</span>
											</div>
										</div>
									</td>
									<td style="width: 15%;" class="w3-margin">${mapped.value.soLuong}</td>
									<td style="width: 15%;" class="w3-margin">${mapped.value.soLuong * mapped.value.sanPham.donGia}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>			
			</div>
			<hr class = "soft">
			<div class="w3-right w3-xlarge" style="margin-right: 40px;">
				Tổng tiền: <br>${sessionScope.myCartTotal}<br>
				<button type="submit" class="w3-button w3-black">Thanh toán</button>
			</div>
		</form:form>
	</div>
	<footer style="margin-top: 150px;">
		<jsp:include page="_footer.jsp"></jsp:include>
	</footer>
</body>
</html>