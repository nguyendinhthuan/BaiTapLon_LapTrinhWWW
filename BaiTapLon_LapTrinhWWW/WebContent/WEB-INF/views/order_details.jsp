<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>ORDER LIST</title>

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
				<a href="${pageContext.request.contextPath}/"><img width="20%" height="20%"
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
			<h2>Quản lý hóa đơn</h2>
		</header>
		<div style="padding: 5px 5px 5px 5px; margin-top : 40px;">
			<div class="w3-responsive">
				<table class="w3-table-all w3-large" style = "margin-bottom: 20px;">
					<tr>
						<th style = "width : 65%;">Thông tin hóa đơn</th>
						<th style = "width : 10%;">Tổng giá</th>
						<th>Thao tác</th>
					</tr>	
				</table>
				<c:forEach var = "HoaDon" items = "${listorder }">
					<li>Ngày : ${HoaDon.ngayHoaDon } - Tình trạng : <c:choose>
							    		<c:when test="${HoaDon.tinhTrang == 'da duyet'}"><span style = "color : red;">Đã duyệt</span></c:when>    
									    <c:otherwise> <span>Chờ duyệt</span> </c:otherwise>
									</c:choose></li>
					<table class="w3-table w3-large w3-border">
						<tr>
							<td style="width: 65%;" class="w3-row">
								<div class="w3-col" style="width:25%">
									<p class="w3-margin">${ HoaDon.ho} ${ HoaDon.ten}</p>
								</div>
								<div class="w3-col" style="width:45%">
									<div class="w3-margin">
										<span>SĐT: ${ HoaDon.sdt} </span><br> <span> Địa
											chỉ: ${ HoaDon.diaChi} </span>
									</div>
								</div>
								<div class="w3-rest">
									<button
										onclick="document.getElementById('${HoaDon.maHoaDon }').style.display='block'"
										class="w3-button w3-margin w3-red" type="button">Xem
										giỏ hàng</button>
									<div id="${HoaDon.maHoaDon }" class="w3-modal">
										<div class="w3-modal-content" style="height: 70%;">
											<div class="w3-container">
												<span
													onclick="document.getElementById('${HoaDon.maHoaDon }').style.display='none'"
													class="w3-button w3-display-topright">&times;</span>
												<table class="w3-table-all w3-large"
													style="margin-bottom: 20px;">
													<tr>
														<th style="width: 46%;">Sản phẩm</th>
														<th style="width: 15%;">Đơn giá</th>
														<th>Số lượng</th>
													</tr>
												</table>
												<table class="w3-table w3-border">
													<c:forEach var="cthd" items="${HoaDon.chiTietHoaDon}">
														<tr>
															<td style="width: 46%;" class="w3-margin">${cthd.sanPham.tenSanPham}</td>
															<td style="width: 15%;" class="w3-margin">${cthd.sanPham.donGia}</td>
															<td class="w3-margin">${cthd.soLuong}</td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td style="width: 10%;" class="w3-margin">${ HoaDon.tongTien}</td>
							<td><a href="${pageContext.request.contextPath}/admin/completecheck/${HoaDon.maHoaDon}">
									<button class="w3-button w3-margin w3-red" type="button"
									<c:choose>
							    		<c:when test="${HoaDon.tinhTrang == 'cho duyet'}"></c:when>    
									    <c:otherwise> disabled </c:otherwise>
									</c:choose>>Duyệt</button>
							</a> <a href="#">
									<button class="w3-button w3-margin w3-red" type="button">Hủy</button>
							</a></td>
						</tr>
						<tr>

						</tr>
					</table>
				</c:forEach>			
			</div>
		</div>
		
	</div>	
</body>
</html>