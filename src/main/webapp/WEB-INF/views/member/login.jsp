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

	<h1>Login Page</h1>

	<form class="col-md-5 mx-auto" action="login" method="post" id="frm">

		<div class="mb-3">
			<label for="id" class="form-label">ID를 입력하세요.</label> <input
				type="text" class="form-control put" name="id" id="id" placeholder="ID">
		</div>

		<div class="mb-3">
			<label for="pw1" class="form-label">PW를 입력하세요.</label> <input
				type="password" class="form-control put pw" name="pw" id="pw" placeholder="PW">
		</div>

		<div class="mb-3 ml-0">
			<button type="submit" class="btn btn-success" id="btn">로그인</button>
		</div>
	</form>

</body>
</html>