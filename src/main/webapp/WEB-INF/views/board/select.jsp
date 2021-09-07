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
		<h1>${board}Board Select Page</h1>
	

	<div class="container-fluid">

		<h3>Num : ${dto.num}</h3>
		<h3>Title : ${dto.title}</h3>
		<h3>Contents : ${dto.contents}</h3>
		<h3>WRITER : ${dto.writer}</h3>
		<h3>REGDATE : ${dto.regdate}</h3>
		<h3>HITS : ${dto.hits}</h3>

		<a href="./delete?num=${dto.num}">Delete</a> <a
			href="./update?num=${dto.num}">Update</a>
	</div>
</body>
</html>