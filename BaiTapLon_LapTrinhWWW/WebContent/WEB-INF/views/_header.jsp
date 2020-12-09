<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> 
				<div class="navbar-inner">
					<ul id="topMenu" class="nav pull-left">
						<li class=""><a
							href="${pageContext.request.contextPath}/home" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-primary">Trang chủ</span></a></li>
					</ul>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a
							href="${pageContext.request.contextPath}/login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-primary">Đăng kí</span></a></li>
						<li class=""><a
							href="${pageContext.request.contextPath}/login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Đăng nhập</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>