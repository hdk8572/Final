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
<body id="wrapper">

	<div class="wrapper" >
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
		<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>
			<div >
			
				<div class="row" style="margin: 0 25px;">
					<div class="col-lg-12">
						<h1 class="page-header">공지사항</h1>
					</div>
				
					<hr>
				</div>

				<div style="margin: 20px 0;">
					<div class="select_outer"
						style="display: flex; justify-content: center;">
						
						<select id="select_search" name="select_search"
							class="form-select mb-3" style="width: 100px;">
							<option value="ititle">제목</option>
							<option value="iwriter">작성자</option>
						</select> <input type="text" class="form-control" name="search_bar"
							id="search_bar"
							style="width: 270px; height: 38px; margin: 0 6px;">
						<button class="btn btn-sm btn-primary" name="btnSearch" 
							id="y_btn_search" style="height: 38px;">검색</button>
					</div>
				</div>
				<!-- search{e} -->


				<form id="deleteForm" action="/stream/member/info/delete" method="post">
					
					<div class="container y_outer_div" 
						style="display: flex; justify-content: center;">
						
						<table class="table table-striped table-hover"
							style="text-align: center;">
							<tr>
								
   

								<td><input type="checkbox" id="allCheck" name="allCheck"></td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
							</tr>
							<c:if test="${not empty noSearchResult}"> <div>${noSearchResult}</div></c:if>
							<c:forEach items="${list}" var="i">
								<tr>
									<td><input type="checkbox" id="rowCheck" name="rowCheck"
										value="${i.ino }"></td>
									<td class="y_td_no" style="display: none;">${i.ino }</td>
									<td id="y_td_hover"><a class="infolist" href="<c:url value='/member/info/select'><c:param name='ino' value='${i.ino }'/></c:url>">${i.ititle }</a></td>
									<td>${i.iwriter }</td>
									<td>${i.idate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</form>

				<div style="margin: 0 230px; display:  flex; justify-content: flex-start;">
					<form action="/stream/member/info/insert" method="get">	
						<button type="submit" class="btn btn-primary" id="y_btn_insert" style="margin: 5px">글쓰기</button>
					</form>					
						<button type="submit" class="btn btn-secondary"  id="y_btn_delete" style="margin: 5px" >삭제</button>
				</div>

			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
	$(document).ready(function () {
    // "전체 선택" 체크박스 클릭 이벤트 처리
    var allCheck = document.getElementById('allCheck');
    allCheck.addEventListener('click', function () {
        var rowCheckboxes = document.querySelectorAll('input[name="rowCheck"]');
        for (var i = 0; i < rowCheckboxes.length; i++) {
            rowCheckboxes[i].checked = allCheck.checked;
        }
    });

    // 검색 버튼 클릭 이벤트 처리
    $("#y_btn_search").click(function () {
        var valueSelect = $("#select_search option:selected").val();
        var valueInput = $("#search_bar").val();
        if (valueInput === "") {
            alert("검색어를 입력하세요.");
        } else {
            $.ajax({
                url: "${pageContext.request.contextPath}/member/info",
                type: "get",
                data: { "select_search": valueSelect, "search_bar": valueInput },
                success: function (result) {
                    console.log(result);
                    $("#wrapper").html(result);
                },
                error: function () {
                    alert("검색 중 오류가 발생했습니다.");
                }
            });
        }
    });

    // "삭제" 버튼 클릭 이벤트 처리
    $("#y_btn_delete").click(function () {
        submitDeleteForm();
    });
});

function submitDeleteForm() {
    // 선택된 체크박스에서 'ino' 값을 가져옵니다.
    var selectedInoArray = [];
    var checkboxes = document.querySelectorAll('input[name="rowCheck"]:checked');
    
    for (var i = 0; i < checkboxes.length; i++) {
        selectedInoArray.push(checkboxes[i].value);
    }

    // 만약 선택된 'ino' 값이 없다면 아무 작업을 수행하지 않습니다.
    if (selectedInoArray.length === 0) {
        alert("삭제할 항목을 선택하세요.");
        return;
    }

    // 'ino' 값을 폼 필드로 추가합니다.
    var deleteForm = document.getElementById('deleteForm');
    selectedInoArray.forEach(function (ino) {
        var input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'ino';
        input.value = ino;
        deleteForm.appendChild(input);
    });

    // 폼을 제출합니다.
    deleteForm.submit();
}
	
</script>

	




</body>
</html>