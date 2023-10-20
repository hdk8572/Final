<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<div>
				<div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">공지사항</h1>
		</div>
		
		<hr>
		
		<div class="pannel-heading">전체 ${totalCnt}건의 게시물이 있습니다.</div>
	</div>
	
	<div style="margin: 20px 0;">
		<div class="select_outer" style="display: flex; justify-content: center;">
			<select id="select_search" name="select_search" class="form-select mb-3" style="width: 100px;">
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer">작성자</option>
			</select>
			<input type="text" class="form-control" name="search_bar" id="search_bar" style="width: 270px; height: 38px; margin: 0 6px;">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="y_btn_search" style="height: 38px;">검색</button>
		</div>
	</div>
	<!-- search{e} -->

	
	<form id="y_board_delete" action="<%= request.getContextPath()%>/board/delete" method="POST">
	<div class="container y_outer_div" style="display: flex; justify-content: center;">
		<table class="table table-striped table-hover" style="text-align: center;">
			<tr>
				<td><input type="checkbox" id="allCheck" name="allCheck"></td>
				<td>No</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		<c:forEach items="${selectBoard}" var="i">
			<tr>
				<td><input type="checkbox" id="rowCheck" name="rowCheck" value="${i.board_no }"></td>
				<td class="y_td_no">${i.board_no }</td>
				<td id="y_td_hover"><a href="javascript:void(0)" id="y_board_view" class="y_board_view">${i.board_title }</a></td>
				<td>${i.board_writer }</td>
				<td>${i.board_date }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	</form>
	
	<div style="margin: 0 15px;">
		<button type="button" class="btn btn-primary" id="y_btn_insert">글쓰기</button>
		<button type="button" class="btn btn-secondary" id="y_btn_delete">삭제</button>
	</div>

		<nav aria-label="Page navigation example" style="display: flex; justify-content: center; margin-top: 50px;">
			<ul class="pagination">
				<c:if test="${startPage > 1 }">
				<li class="page-item pre"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<c:if test="${currentPage eq i }">
						<li class="page-item num active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
					<c:if test="${currentPage ne i }">
						<li class="page-item num"><a class="page-link" href="#">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
				<li class="page-item next"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
			</ul>
		</nav>
			</div>
		</div>
	</div>

	

	
	<script src="${pageContext.request.contextPath}/js/app.js"></script>

</body>
</html>