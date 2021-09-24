<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot_head.jsp"></c:import>
<style type="text/css">
	.more{
		cursor: pointer;
	}
</style>

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
				
				<!-- <a href="./select/?num=${dto.num}" class="btn btn-success" id="comment">WRITE</a> -->
				
           		<button type="submit" class="btn btn-success" id="comment">WRITE</button>
         </div>		
			</div>
		
		<!-- 
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
		 -->
		
		<!-- COMMENT LIST -->
		<div id="commentList" data-board-num="${dto.num}">
			
		
		</div>

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
					
					$('#contents').val('');
					getCommentList(pn);
				});
			});

			getCommentList(1);
			let content='';
			
			$("#commentList").on("click", ".commentDel", function() {
				let commentNum = $(this).attr("data-comment-del")
				console.log(commentNum);
				
				$.ajax({
		            type : "POST",
		            url : "./commentDel",
		            data : {commentNum:commentNum},
		            success:function(result){
		            	result = result.trim();
		            	
		            	if(result>0) {
		            		alert('삭제 성공');
		            		getCommentList(1);
		            	} else {
		            		alert('삭제 실패')
		            	}	            	
		            },
		            error:function() {
		            	alert('삭제 실패');
		            }
		            
		         });
			});
			
			$("#commentList").on("click", ".commentUpdate", function() {
				let commentNum = $(this).attr("data-comment-update")
				
				content = $("#content"+commentNum).text().trim();
				$("#content"+commentNum).children().css('display','none');
				let ta = '<textarea class="form-control" placeholder="Input Contents" name="contents" id="beforeUpdate">';
				ta = ta+content.trim()+'</textarea>';
				ta = ta + '<button class="btn btn-primary up">Update</button>';
				ta = ta + '<button class="btn btn-danger can">Cancle</button>';
				$("#content"+commentNum).append(ta);
			});
			
			//cancle
			$("#commentList").on('click', ".can", function(){
		         $(this).parent().children('div').css('display', 'block');
		         $(this).parent().children('textarea').remove();
		         $(this).parent().children('button').remove();
		     });
			
			//update
			$("#commentList").on('click', ".up", function() {
				let contents = $(this).prev().val();
				let cn = $(this).parent().prev().text().trim();
				let selector=$(this);
				$.ajax({
					type : "POST",
					url : "./commentUpdate",
					data : {contents:contents, commentNum:cn},
					success:function(result) {
						result = result.trim();
		            	
		            	if(result.trim()>0) {
		            		alert('업데이트 성공');
		            		selector.parent().children('div').text(contents);
		            		selector.parent().children('div').css('display', 'block');
		            		selector.parent().children('textarea').remove();
		            		selector.parent().children('button').remove();
		            	} else {
		            		alert('업데이트 실패')
		            	}
					}
				});
			});
			
			$("#commentList").on("click", ".more", function() {
				let pn = $(this).attr("data-comment-pn")
				getCommentList(pn);
			});
			
			$(".more").click(function() {
				console.log("more");
			});
			
			function getCommentList(pageNumber) {
				let num = $("#commentList").attr("data-board-num")
		         $.ajax({
		            type : "GET",
		            url : "./getCommentList",
		            data : {num:num, pn:pageNumber},
		            success : function(result){
		               result = result.trim();
		               $('#commentList').html(result);
		            },
		            error : function(xhr, status, error){
		               console.log(error);
		            }
		         });
		      }
		</script>


	</div>
</body>
</html>