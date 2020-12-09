<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

    <meta charset="utf-8">
    <title>Bootshop online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
 <!-- Bootstrap style --> 
	<link id="callCss" href="<c:url value="/resources/themes/bootshop/bootstrap.min.css" />" rel="stylesheet"  media="screen">
	<link href="<c:url value="/resources/themes/css/base.css" />" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="<c:url value="/resources/themes/css/bootstrap-responsive.min.css" />" rel="stylesheet"/>
	<link href="<c:url value="/resources/themes/css/font-awesome.css" />" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="<c:url value="/resources/themes/js/google-code-prettify/prettify.css" />" rel="stylesheet"/>
	<link rel="shortcut icon" href="<c:url value="/resources/themes/images/ico/favicon.ico" />">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/resources/themes/images/ico/apple-touch-icon-144-precomposed.png" />">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/resources/themes/images/ico/apple-touch-icon-114-precomposed.png" />">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/resources/themes/images/ico/apple-touch-icon-72-precomposed.png" />">
    <link rel="apple-touch-icon-precomposed" href="<c:url value="/resources/themes/images/ico/apple-touch-icon-57-precomposed.png" />">
</head>
<body>
	<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> User</strong></div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index"><img src="<c:url value="/resources/themes/images/logo.png" />" alt="Bootsshop"/></a>
		<form class="form-inline navbar-search" method="post" action="index" >
		<input id="srchFld" class="srchTxt" type="text"  />

		  <button type="submit" id="submitButton" class="btn btn-primary">Tìm</button>
    </form>
    <ul id="topMenu" class="nav pull-right">
     <li class=""><a href="contact.jsp">Liên hệ</a></li>
     <li class="">
            <a href="${pageContext.request.contextPath}/login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-primary">Đăng kí</span></a>
            
     </li>
	 <li class="">
	 <a href="${pageContext.request.contextPath}/login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Đăng nhập</span></a>

	</li>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->

<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	<div id="sidebar" class="span3">
		<div class="well well-small"><a href="${pageContext.request.contextPath}/product_summary"><img src="<c:url value="/resources/themes/images/ico-cart.png" />" alt="cart">${sessionScope.myCartNum} Items in your cart  <span class="badge badge-warning pull-right">$${sessionScope.myCartTotal}</span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> DANH MỤC</a>
				<ul>
				<li><a class="active" href="${pageContext.request.contextPath}/products_mayin"><i class="icon-chevron-right"></i>MÁY IN</a></li>
				<li><a href="${pageContext.request.contextPath}/products_mayscan"><i class="icon-chevron-right"></i>MÁY SCAN</a></li>
				</ul>
			</li>
		</ul>
		<br/>
	</div>
<!-- Sidebar end=============================================== -->
		<div class="span9">		
		<h4>Các sản phẩm</h4>
			
			  <ul class="thumbnails">
			  	<c:forEach var="sanpham" items="${list}" >
				<li class="span3">
					
					  <div class="thumbnail">
						<a  href="product_details/${sanpham.maSanPham}"><img src="<c:url value="/resources/${sanpham.urlHinhAnh}" />"  alt=""/></a>
						<div class="caption">
						  <h5>${sanpham.maSanPham} </h5>
						  <h5>${sanpham.tenSanPham} </h5>
						  <h4 style="text-align:center"><a class="btn" href="#"> <i class="icon-zoom-in"></i></a>   
						  <a class="btn btn-primary" href="product_details/${sanpham.maSanPham}">${sanpham.donGia}</a></h4>
						</div>
					  </div>
				  
				</li>
				</c:forEach>
			  </ul>	
			
		</div>
		</div>
	</div>
</div>
<script src="<c:url value="/resources/themes/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/themes/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/themes/js/google-code-prettify/prettify.js" />"></script>
<script src="<c:url value="/resources/themes/js/bootshop.js" />"></script>
<script src="<c:url value="/resources/themes/js/jquery.lightbox-0.5.js" />"></script>
</body>
</html>