<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<form class="col-md-5 mx-auto" action="./update" method="post">
			
				
				<div class="mb-3">
  					<label for="id" class="form-label"></label>
  					<input type="text" readonly="readonly" class="form-control" value="${member.id}" name="id" id="id">
				</div>
			
				<div class="mb-3">
  					<label for="pw" class="form-label">PW</label>
  					<input type="text" class="form-control" name="pw" id="pw" value="${member.pw}">
				</div>
				
				<div class="mb-3">
					<label for="name" class="form-label">Name</label>
  					<input class="form-control" value="${member.name}" name="name" id="name"></input>
  				</div>
				
				<div class="mb-3">
  					<label for="phone" class="form-label">Phone</label>
  					<input type="text" class="form-control" value="${member.phone}" name="phone" id="phone">
				</div>
				
				<div class="mb-3">
  					<label for="email" class="form-label">Email</label>
  					<input type="text" class="form-control" value="${member.email}" name="email" id="email">
				</div>
				
				<div class="mb-3 ml-0">
					<button type="submit" class="btn btn-success">정보 수정</button>
				</div>
			</form>			
		</div>
</body>
</html>