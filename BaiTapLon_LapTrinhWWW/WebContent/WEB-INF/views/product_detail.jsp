<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<title>Product Detail</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap style -->
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
		<header class="w3-container w3-xxlarge">
			<div class="w3-left" style="margin-top: 10px">Chi tiết sản phẩm</div>
			<div class="w3-right w3-margin-right w3-right-align" style="margin-top: 15px">
				<p>
					<a href="product_order"><i class="fa fa-shopping-cart "></i></a>
				</p>
			</div>
			<div class="w3-row w3-right w3-section"
				style="width: 40%; margin-right: 30px;">
				<div class="w3-col" style="width: 50px;">
					<a href="#"><i class="fa fa-search "></i></a>
				</div>
				<div class="w3-rest ">
					<input class="w3-input w3-border w3-padding-16" name="" type="text"
						placeholder="Search ...">
				</div>
			</div>
		</header>
		<div class="w3-row w3-cell-row w3-border">
			<div class="w3-container w3-half w3-cell-middle">
				<div class="w3-margin w3-display-container">
					<a href="<c:url value="/resources/${SanPham.urlHinhAnh}"/>"
						title="Epson801"> <img
						src="<c:url value="/resources/${SanPham.urlHinhAnh}"/>"
						style="width: 100%" alt="Epson801" />
					</a>
				</div>
			</div>
			<div class="w3-container w3-half w3-cell-middle">
				<div class="w3-margin">
					<h3>${SanPham.tenSanPham}</h3>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><h2><span style="color:red">${SanPham.donGia}</span></h2></label>
									<div class="controls">
										<a href="${pageContext.request.contextPath }/themGioHang/${SanPham.maSanPham}">
											<button style="margin-top: 20px; margin-left: 50px" type="button" class="btn btn-warning"
												<c:choose>
							    					<c:when test="${SanPham.soLuongTon > 0}">
							    					</c:when>    
							    					<c:otherwise>
							       					disabled
							    					</c:otherwise>
												</c:choose>>Thêm vào giỏ hàng
										 		<i class=" icon-shopping-cart"></i>
											</button>
										</a>
									</div>
								</div>
							</form>

							<hr class="soft" />
							
							<c:choose>
							    <c:when test="${SanPham.soLuongTon > 0}">
							       <h4>Còn hàng</h4>
							    </c:when>    
							    <c:otherwise>
							       <h4 style="color:red">Hết hàng</h4>
							    </c:otherwise>
							</c:choose>
							<hr class="soft clr" />
							<p>${SanPham.moTa}</p>
							<br class="clr" />
							<hr class="soft" />
				</div>
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="_footer.jsp"></jsp:include>
	</footer>
	
	<script src="<c:url value="/resources/themes/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/themes/js/google-code-prettify/prettify.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootshop.js" />"></script>
	<script src="<c:url value="/resources/themes/js/jquery.lightbox-0.5.js" />"></script>
</body>
</html>