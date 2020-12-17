<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="w3-padding-64 w3-large w3-text-grey"
	style="font-weight: bold">
	<a onclick="myAccFunc()" href="javascript:void(0)"
		class="w3-button w3-block w3-white w3-left-align" id="myBtn"> Danh
		mục <i class="fa fa-caret-down"></i>
	</a>
	<div id="demoAcc"
		class="w3-bar-block w3-hide w3-padding-large w3-medium">
		<a href="#" class="w3-bar-item w3-button w3-light-grey"><i
			class="fa fa-caret-right w3-margin-right"></i>Máy In</a> <a href="#"
			class="w3-bar-item w3-button w3-light-grey"><i
			class="fa fa-caret-right w3-margin-right"></i>Máy Scan</a>
	</div>
	<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
		<div class="w3-bar-item w3-padding-24 w3-wide">
			<img src="<c:url value="/resources/themes/images/logo.png" />">
		</div>
		<a href="javascript:void(0)"
			class="w3-bar-item w3-button w3-padding-24 w3-right"
			onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header>
	<div class="w3-overlay w3-hide-large" onclick="w3_close()"
		style="cursor: pointer" title="close side menu" id="myOverlay"></div>
</div>

