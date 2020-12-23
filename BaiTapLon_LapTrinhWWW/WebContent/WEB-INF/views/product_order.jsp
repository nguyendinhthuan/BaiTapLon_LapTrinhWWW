<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Product Order</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

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
				<a href="home"><img width="30%" height="30%" src="<c:url value="/resources/themes/images/logo-home1.png" />"></a>
			</h3>
		</div>
	</nav>
	<div class="w3-container" style="margin-left: 250px;">
		<header>
			<h2>Giỏ hàng</h2>
		</header>
		<div style="padding: 5px 5px 5px 5px; margin-top : 40px;">
			<div class="span9">
				<table class="table table-bordered" style = "margin-bottom: 20px;">
					<thead>
						<tr>
							<th style = "width : 45%;">Sản phẩm</th>
							<th style = "width : 18%;">Đơn giá</th>
							<th style = "width : 18%;">Số lượng</th>
							<th style = "width : 19%;">Thành tiền</th>
						</tr>
					</thead>
					<tbody style="margin-top: 5px">
						<c:forEach var="map" items="${sessionScope.myCartItems}">
							<tr>
								<td><img width="40" src="<c:url value="/resources/${map.value.sanPham.urlHinhAnh}"/>"
									alt="" />
									${map.value.sanPham.maSanPham} - ${map.value.sanPham.tenSanPham}
								</td>
									
								<td>${map.value.sanPham.donGia} VNĐ</td>
								
								<td>
									<div class="input-append">
										<input class="span1" style="max-width: 34px" placeholder="${map.value.soLuong}"
											id="appendedInputButtons" size="16" type="text">
										<a href="giamSoLuong/${map.value.sanPham.maSanPham}" >
											<button class="btn" type="submit" >
											<i class="icon-minus"></i>
											</button>
										</a>
										<a href="tangSoLuong/${map.value.sanPham.maSanPham}/${map.value.sanPham.soLuongTon}" >
											<button class="btn" type="submit">
												<i class="icon-plus"></i>
											</button>
										</a>
									</div>
								</td>
								
								<td>${map.value.sanPham.donGia * map.value.soLuong} VNĐ</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="6" style="text-align: right"><strong>Tổng Tiền : </strong></td>
							<td class="label label-important" style="display: block"><h6><strong>${sessionScope.myCartTotal} VNĐ</strong></h6></td>
						</tr>
					</tbody>	
				</table>
				
				<div class = "w3-container w3-right w3-xlarge" style="margin-right: 100px">
					<br><a href = "${pageContext.request.contextPath }/home#procontent" class = "w3-button w3-black w3-margin"> <i class = "fa fa-arrow-left"></i>  Tiếp tục mua hàng</a>
					<a href = "${pageContext.request.contextPath}/product_order/summary" class = "w3-button w3-black">Thanh toán<i class = "fa fa-arrow-right"></i></a>
				</div>			
			</div>
		</div>

	</div>
	<footer style="margin-top: 240px;">
		<jsp:include page="_footer.jsp"></jsp:include>
	</footer>
		<script src="<c:url value="/resources/themes/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootstrap.min.js" />"></script>
	<script
		src="<c:url value="/resources/themes/js/google-code-prettify/prettify.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootshop.js" />"></script>
	<script
		src="<c:url value="/resources/themes/js/jquery.lightbox-0.5.js" />"></script>
</body>
</html>