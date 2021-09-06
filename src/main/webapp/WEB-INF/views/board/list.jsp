<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>${board}BoardList Page</h1>
	
		<div class="col-md-7 mx-auto my-2">
			<table class="table">
				<tr>
					<th>Num</th>
					<th>Title</th>
					<th>CONTENTS</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><a href="./Select?num=${dto.num}">${dto.title}</a></td>
						<td>${dto.contents}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>