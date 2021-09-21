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
		
		<hr>

		
		<c:if test="${not empty member and member.id == dto.writer}">
			<a href="./delete?num=${dto.num}">Delete</a>
			<a href="./update?num=${dto.num}">Update</a>
		</c:if>
		
		<hr>
		
		<div>
				<div class="mb-3">
					<label for="contents" class="form-label">Contents</label>
  					<textarea class="form-control" placeholder="Input Contents" name="contents" id="contents"></textarea>
  				</div>
				
				<div class="mb-3">
  					<label for="writer" class="form-label">Writer</label>
  					<input type="text" class="form-control" readonly="readonly" name="writer" id="writer" value ="${member.id}">
				</div>
				
				<a href="./select/?num=${dto.num}" class="btn btn-success" id="comment">WRITE</a>		
			</div>
			
		<table class="table">
				<tr>
					<th>CommentNum</th>
					<th>Num</th>
					<th>Writer</th>
					<th>Contents</th>
					<th>RegDate</th>
					<th>Board</th>
				</tr>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.commentNum}</td>
						<td>${dto.num}</td>
						<td>${dto.writer}</td>
						<td>${dto.contents}</td>
						<td>${dto.regDate}</td>
						<td>${dto.board}</td>
					</tr>
				</c:forEach>
			</table>

		<c:if test="${board ne 'notice'}">
			<a href="./reply?num=${dto.num}">Reply</a>
		</c:if>
		
		<script type="text/javascript">
			$('#comment').click(function () {
				// 작성자, 내용 콘솔에 출력
				let writer = $('#writer').val();
				let contents = $('#contents').val();
				
				$.post('./comment', {num:'${dto.num}', writer:writer, contents:contents}, function(result){
					console.log(result.trim());
				});
			});
		</script>


	</div>
</body>
</html>