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
			<form class="col-md-5 mx-auto" action="./join" method="post">
			
				<div class="mb-3">
  					<label for="id" class="form-label">ID를 입력하세요.</label>
  					<input type="text" class="form-control" name="id" id="id" placeholder="ID">
				</div>
				
				<div class="mb-3">
  					<label for="pw" class="form-label">PW를 입력하세요.</label>
  					<input type="text" class="form-control" name="pw" id="pw" placeholder="PW">
				</div>
				
				<div class="mb-3">
  					<label for="pw" class="form-label">PW 확인</label>
  					<input type="text" class="form-control" name="pw" id="pw" placeholder="PW">
				</div>
				
				<div class="mb-3">
  					<label for="name" class="form-label">이름을 입력하세요.</label>
  					<input type="text" class="form-control" name="name" id="name" placeholder="NAME">
				</div>
				
				<div class="mb-3">
  					<label for="phone" class="form-label">핸드폰 번호를 입력하세요.</label>
  					<input type="text" class="form-control" name="phone" id="phone" placeholder="PHONE">
				</div>
				
				<div class="mb-3">
  					<label for="email" class="form-label">이메일을 입력하세요.</label>
  					<input type="text" class="form-control" name="email" id="email" placeholder="EMAIL">
				</div>			
				
				<div class="mb-3 ml-0">
				<button type="submit" class="btn btn-success">회원가입</button>
				</div>
			</form>			
		</div>
</body>
</html>