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
    <div class="row" style="margin: 0 25px;">
		<div class="col-lg-12" >
			<h1 class="page-header">글쓰기</h1>
		</div>
		
		<hr>
	</div>
	<form action="/stream/member/info"  method="get">
    <button type="submit" class="btn btn-secondary" id="y_btn_back" style="margin: 30px 20px 10px;">목록</button>
	</form>
    <div style="margin-left: 20px;">
   <form action="/stream/member/info/insert"  method="post">
   
    	<table class="y_insert_table">
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">제목</td>
    			<td class="y_insert_td"><input type="text" class="form-control" id="ititle" name="ititle" maxlength="20"></td>
    		</tr>
			<tr class="y_insert_tr">
				<td class="y_insert_td">작성자</td>
				<td class="y_insert_td"><input type="text" class="form-control" value="${name.mname}" id="iwriter" name="iwriter" readonly></td>
			</tr>    		
    		<tr class="y_insert_tr">
    			<td class="y_insert_td">내용</td>
    			<td class="y_insert_td"><textarea name="itext" id="itext" style="margin: 10px; height: 200px; resize: none;"></textarea></td>
    		</tr>
    	</table>
    	<button type="submit" class="btn btn-primary btnChk" id="y_btn_insertDo" style="margin-top: 10px;">확인</button>
    </form>
    </div>
    </div>
    </div>
    	<script src="${pageContext.request.contextPath}/js/app.js"></script>
  <script>
    var error = "${error}"; // 컨트롤러에서 전달한 에러 메시지
    if (error) {
        alert(error); // 에러 메시지를 경고 팝업으로 표시
    }
</script>
    
  </body>
</html>