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
<link href="${pageContext.request.contextPath}/css/info.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/streamapp.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Stream - 업무도 흐름이다!</title>
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<main class="content">
			<div class="row" >
				<div class="col-lg-12">
					<h1 class="h3 mb-3">글쓰기</h1>
				</div>

			</div>
			<div class="tablewrapper">
			<form action="/stream/info" method="get">
				<button type="submit" class="btn btn-secondary" id="y_btn_back"
					style="margin: 30px 20px 10px;">목록</button>
			</form>
			<div style="margin-left: 20px;">
				<form action="/stream/info/insert" method="post">

					<table class="col-lg-11">
						<tr class="y_insert_tr">
							<td class="y_insert_td">제목</td>
							<td class="y_insert_td"><input type="text"
								class="form-control" id="ititle" name="ititle" maxlength="50"></td>
						</tr>
						<tr class="y_insert_tr">
							<td class="y_insert_td">작성자</td>
							<td class="y_insert_td"><input type="text"
								class="form-control" value="${name.mname}" id="iwriter"
								name="iwriter" readonly style="background-color: white;"></td>
						</tr>
						<tr class="y_insert_tr">
							<td class="y_insert_td">내용</td>
							<td class="">
							<div id="form-content">
								<textarea class="smemo" id=itext rows="5" name="itext"></textarea>
						    </div>	
							</td>
						</tr>
					</table>
					<button type="submit" class="btn btn-primary btnChk"
						id="y_btn_insertDo" style="margin-top: 10px;">확인</button>
				</form>
			
			</div>
			</div>
			</main>
		</div>
		
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script>
	$("#itext").summernote({					
	     placeholder: '내용을 작성해주세요.',
	     tabsize: 2,
	     height: 450,
	     toolbar: [
	       ['style', ['style']],
	       ['font', ['bold', 'underline', 'clear']],
	       ['color', ['color']],
	       ['para', ['ul', 'ol', 'paragraph']],
	       ['table', ['table']],
	       ['insert'],
	       ['view', ['fullscreen', 'codeview', 'help']]
	     ]
	});
		var error = "${error}";
		if (error) {
			alert(error); 
		}
	</script>

</body>
</html>