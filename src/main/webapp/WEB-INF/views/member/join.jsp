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
			<form class="col-md-5 mx-auto" action="./join" method="post" id="frm">
			
				<div class="mb-3">
  					<label for="id" class="form-label">ID를 입력하세요.</label>
  					<input type="text" class="form-control put" name="id" id="id" placeholder="ID">
  					<button type="button" id="idCheck">ID 중복 확인</button>
  					<div id = "idResult"></div>
				</div>
				
				<div class="mb-3">
  					<label for="pw1" class="form-label">PW를 입력하세요.</label>
  					<input type="password" class="form-control put pw" name="pw" id="pw1" placeholder="PW1">
				</div>
				
				<div class="mb-3">
  					<label for="pw2" class="form-label">PW 확인</label>
  					<input type="password" class="form-control put pw" id="pw2" placeholder="PW2">
				</div>
				
				<div class="mb-3">
  					<label for="name" class="form-label">이름을 입력하세요.</label>
  					<input type="text" class="form-control put" name="name" id="name" placeholder="NAME">
				</div>
				
				<div class="mb-3">
  					<label for="phone" class="form-label">핸드폰 번호를 입력하세요.</label>
  					<input type="text" class="form-control put" name="phone" id="phone" placeholder="PHONE">
				</div>
				
				<div class="mb-3">
  					<label for="email" class="form-label">이메일을 입력하세요.</label>
  					<input type="text" class="form-control put" name="email" id="email" placeholder="EMAIL">
				</div>			
				
				<div class="mb-3 ml-0">
				<button type="submit" class="btn btn-success" id="btn">회원가입</button>
				</div>
			</form>			
		</div>
		
		<script type="text/javascript" src="../resources/js/join.js"></script>
		
</body>
</html>