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

	<div class="container-fluid">

		<h3>Num : ${dtov.num}</h3>
		<h3>Title : ${dtov.title}</h3>
		<h3>Contents : ${dtov.contents}</h3>
		<h3>WRITER : ${dtov.writer}</h3>
		<h3>REGDATE : ${dtov.regdate}</h3>
		<h3>HITS : ${dtov.hits}</h3>

		<a href="./noticeDelete?num=${dtov.num}">Delete</a>
		<a href="./noticeUpdate?num=${dtov.num}">Update</a>
	</div>
</body>
</html>