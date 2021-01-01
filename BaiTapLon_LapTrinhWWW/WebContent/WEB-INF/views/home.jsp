<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
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
		style="z-index: 3; width: 220px" id="mySidebar">
		<div class="w3-container w3-display-container w3-padding-16">
			<h3 class="w3-wide">
				<a href="home"><img width="20%" height="20%" src="<c:url value="/resources/themes/images/logo-home1.png" />"></a>
			</h3>
		</div>
		<jsp:include page="_navbar.jsp"></jsp:include>
	</nav>

	<div id="mainBody">
		<!-- !PAGE CONTENT! -->
		<div class="w3-main" style="margin-left: 250px">

			<header class="w3-container w3-xxlarge">
				<div class="w3-left">Trang chủ</div>
				<div class="w3-right w3-margin-right w3-right-align" style="margin-top: 20px">
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
						<input class="w3-input w3-border w3-padding-16" name=""
							type="text" placeholder="Search ...">
					</div>
				</div>
			</header>

			<!-- Image header -->
			<div class="w3-display-container w3-container">
				<img src="<c:url value="/resources/themes/images/desktop.png" />"
					alt="image" style="width: 85%; height: 70%">
				<div class="w3-display-topleft w3-text-white"
					style="padding: 24px 48px">
					<h1 class="w3-jumbo w3-hide-small" style="padding: 20px 0px">Mua
						bán máy in, máy scan</h1>
					<h1 class="w3-hide-small" style="padding: 20px 0px">Cũ - mới</h1>
					<p>
						<a href="#procontent"
							class="w3-button w3-black w3-padding-large w3-large">XEM NGAY</a>
					</p>
				</div>
			</div>
			
			<div class="container" id="procontent" style="margin-left: 45px; width: 85%">
				<div class="row">
					<h4>Danh sách sản phẩm</h4>
					<ul class="thumbnails">
						<c:forEach var="sanpham" items="${list}">
							<li class="span3">
								<div class="thumbnail">
									<a href="product_detail/${sanpham.maSanPham}"><img
										src="<c:url value="/resources/${sanpham.urlHinhAnh}" />"
										alt="" /></a>
									<div class="caption">
										<h5>Mã: ${sanpham.maSanPham}</h5>
										<h5>Tên: ${sanpham.tenSanPham}</h5>
										<h4 style="text-align: center">
											<p href="product_detail/${sanpham.maSanPham}">Giá: ${sanpham.donGia} VNĐ</p>
										</h4>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>

	<script>
		// Accordion 
		function myAccFunc() {
			var x = document.getElementById("demoAcc");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}

		// Click on the "Jeans" link on page load to open the accordion for demo purposes
		document.getElementById("myBtn").click();

		// Open and close sidebar
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("myOverlay").style.display = "block";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("myOverlay").style.display = "none";
		}
	</script>

	<script src="<c:url value="/resources/themes/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/themes/js/google-code-prettify/prettify.js" />"></script>
	<script src="<c:url value="/resources/themes/js/bootshop.js" />"></script>
	<script src="<c:url value="/resources/themes/js/jquery.lightbox-0.5.js" />"></script>
</body>
</html>