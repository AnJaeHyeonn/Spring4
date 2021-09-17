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
	<h1>${board}BoardSelectPage</h1>


	<div class="container-fluid">

		<h3>Num : ${dto.num}</h3>
		<h3>Title : ${dto.title}</h3>
		<div>
			${dto.contents}
		</div>
		<h3>WRITER : ${dto.writer}</h3>
		<h3>REGDATE : ${dto.regdate}</h3>
		<h3>HITS : ${dto.hits}</h3>

		<c:forEach items="${dto.files}" var="f">
			<div>
				<a href="./down?fileName=${f.fileName}">${f.oriName}</a>
			</div>
		</c:forEach>
		
		<c:if test="${not empty member and member.id == dto.writer}">
			<a href="./delete?num=${dto.num}">Delete</a>
			<a href="./update?num=${dto.num}">Update</a>
		</c:if>

		<c:if test="${board ne 'notice'}">
			<a href="./reply?num=${dto.num}">Reply</a>
		</c:if>


	</div>
</body>
</html>