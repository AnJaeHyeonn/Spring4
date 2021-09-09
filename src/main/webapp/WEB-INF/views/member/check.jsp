<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot_head.jsp"></c:import>

</head>
<body>
	<c:import url="../temp/boot_nav.jsp"></c:import>
	<h1>Check Page</h1>

	<div class="container-fluid">
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value="" id="ca">
			<label class="form-check-label"	for="flexCheckDefault"> Check ALL </label>
		</div>

		<div class="form-check">
			<input class="form-check-input cl2 ess" type="checkbox" value="">
			<label class="form-check-label"	for="flexCheckDefault"> 약관 1 </label>
		</div>
		
		<div class="form-check">
			<input class="form-check-input cl2 ess" type="checkbox" value="">
			<label class="form-check-label"	for="flexCheckDefault"> 약관 2 </label>
		</div>
		
		<div class="form-check">
			<input class="form-check-input cl2 ess" type="checkbox" value="">
			<label class="form-check-label"	for="flexCheckDefault"> 약관 3 </label>
		</div>
		
		<div class="form-check">
			<input class="form-check-input cl2" type="checkbox" value="">
			<label class="form-check-label"	for="flexCheckDefault"> (광고성) 4 </label>
		</div>
		
		<button id="btn">회원가입</button>
	</div>
	
	<script type="text/javascript" src="../resources/js/check.js"></script>

</body>
</html>