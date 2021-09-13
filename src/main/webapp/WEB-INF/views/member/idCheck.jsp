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
	<h1>ID Check Page</h1>
	
	<div>
		${param.id}는 
		<c:if test="${empty dto}">
			사용 가능 한 ID 입니다.
		</c:if>
		<c:if test="${not empty dto}">
			중복 ID 입니다.
		</c:if>
	</div>

	<form class="col-md-5 mx-auto" action="./idCheck" method="get" id="frm">

		<div class="mb-3">
			<label for="id" class="form-label">ID를 입력하세요.</label> 
			<input type="text" class="form-control put" name="id" id="id" placeholder="ID" value="${param.id}">
			<button type="submit" id="idCheck">ID 중복 확인</button>
			
			<c:if test="${empty dto}">
				<button type="button" id="useId">ID 사용</button>
			</c:if>
		</div>
	</form>
	<script type="text/javascript">
		const useId = document.getElementById('useId');
		useId.addEventListener('click', function() {
			let id = window.document.getElementById('id').value;
			opener.document.getElementById('id').value=id;
			close();
		});
	</script>

</body>
</html>