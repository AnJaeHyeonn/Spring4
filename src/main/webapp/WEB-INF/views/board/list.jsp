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
	<h1>${board}BoardListPage</h1>


	<div class="container-fluid">

		<div class="col-md-7 mx-auto my-2">

			<!-- Search Form -->
			<form action="./list" method="get">

				<div class="input-group mb-3">
					<select name="kind" class="form-select form-select-sm"
						aria-label=".form-select-sm example">
						<option value="title">Title</option>
						<option value="contents">Contents</option>
						<option value="writer">Writer</option>
					</select> <input type="text" name="search" class="form-control"
						aria-label="Text input with dropdown button">
					<button type="submit" class="btn btn-outline-secondary">Search</button>
				</div>

			</form>
			<!-- Search Form -->

			<table class="table">
				<tr>
					<th>Num</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Hits</th>
				</tr>
				<c:forEach items="${list}" var="dto" varStatus="i">
					<tr>
						<td>${dto.num}</td>
						<td><span class="c1" data-writer-num="${i.index}"> <c:catch>
									<c:forEach begin="1" end="${dto.depth}">
									--	
								</c:forEach>
								</c:catch> ${dto.title}
						</span></td>
						<td id="wr${i.index}">${dto.writer}</td>
						<td>${dto.regdate}</td>
						<td>${dto.hits}</td>
					</tr>
				</c:forEach>
			</table>
			<!-- Pageing -->
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						href="./list?kind=${pager.kind}&search=${pager.search}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>

					<li class="page-item"><a class="page-link"
						href="./list?pn=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"
						aria-label="Previous"> <span aria-hidden="true">&lt;</span>
					</a></li>

					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="n">
						<li class="page-item"><a class="page-link"
							href="./list?pn=${n}&kind=${pager.kind}&search=${pager.search}">${n}
						</a></li>
					</c:forEach>

					<li class="page-item"><a class="page-link"
						href="./list?pn=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"
						aria-label="Previous"> <span aria-hidden="true">&gt;</span>
					</a></li>

					<li class="page-item"><a class="page-link"
						href="./list?pn=${pager.totalPage}&kind=${pager.kind}&search=${pager.search}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
			<!-- Pageing -->

			<a href="./insert" class="btn btn-danger">ADD</a>
			<button id="btn">click</button>

		</div>
	</div>
	<script type="text/javascript" src="../resources/js/list.js"></script>
</body>
</html>