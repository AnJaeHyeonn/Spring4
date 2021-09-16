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

	<h1>My Page</h1>
	<h1>ID : ${member.id}</h1>
	<h1>Email : ${member.email}</h1>
	<div>
		<img alt="" src="../resources/upload/member/${member.memberFilesDTO.fileName}">
	</div>

	<a href="./update" class="btn btn-danger">정보 수정</a>
	<a href="./delete?id=${member.id}" class="btn btn-danger">회원 탈퇴</a>

</body>
</html>