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
		<div class="col-md-7 mx-auto my-2">
			<table class="table table-hover">
				<tr>
					<th>Num</th>
					<th>Title</th>
					<th>CONTENTS</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><a href="./noticeSelect?num=${dto.num}">${dto.title}</a></td>
						<td>${dto.contents}</td>
					</tr>
				</c:forEach>
			</table>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
				<a href="./noticeList?pn=${n}">${n}</a>
			</c:forEach>
			
			<a href="./noticeInsert" class="btn btn-danger">ADD</a>
		</div>
	</div>
</body>
</html>