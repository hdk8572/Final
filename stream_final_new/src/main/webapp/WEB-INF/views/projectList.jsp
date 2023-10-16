<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="Stream">

<link rel="shortcut icon" href="img/icons/icon-48x48.png" /> <!-- 로고 결정 요망 -->

<!-- Tab bar -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - Final Project</title>

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/streamapp.css"	rel="stylesheet">

<!-- Modal CSS -->
<link href="${pageContext.request.contextPath}/css/Modal.css"	rel="stylesheet">

<!-- ProjectList CSS -->
<link href="${pageContext.request.contextPath}/css/projectList.css" rel="stylesheet">
<!-- DropDown - Option CSS -->
<link href="${pageContext.request.contextPath}/css/projectList.option.css"	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"	rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- SummerNote CDN -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">


</head>
<body>
	<div class="wrapper">
	
		<%@ include file="/WEB-INF/views/alertmsg.jsp" %>		
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
			<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<span>${principal.username}님의 프로젝트 목록</span>
						 
						<span><button class="btn btn-primary addProject" id="myBtn"	data-bs-toggle="modal" data-bs-target="#addProjectModal">프로젝트 추가+</button></span>
						<svg id="hideBtn" xmlns="http://www.w3.org/2000/svg" width="24"	height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle align-middle me-2 hideView"><circle cx="12" cy="12" r="10"></circle><line x1="8" y1="12" x2="16" y2="12"></line></svg>
					</h1>

					<%@ include file="/WEB-INF/views/addProjectModal.jsp"%>
					<%@ include file="/WEB-INF/views/updateProjectModal.jsp"%>

					<div class="row">
						<div class="col-xl-6 col-xxl-5 d-flex">
							<div class="w-100">
								<div class="row" id="wrap-list">
									<!-- Ajax - loadList() -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

<!-------------------- Script ----------------------->
<script src="${pageContext.request.contextPath}/js/stream.js"></script>
<script src="${pageContext.request.contextPath}/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	/* ajax 용 - contextPath 변수 지정 */
	const contextPath = "${pageContext.request.contextPath}";
	
	/* ajax 용 - principal.username */
	const useridJs = "${principal.username}";
	
	/* listAndHide 버튼 이미지 */
	const minusImg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle align-middle me-2"><circle cx="12" cy="12" r="10"></circle><line x1="8" y1="12" x2="16" y2="12"></line></svg>';
	const plusImg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle align-middle me-2"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>';
</script>
<script>
	$(document).ready(function (){
		loadList();									// 화면 리스트 호출 - loadList 컨트롤러
		
		$("#summernote").summernote({				//  위즈윅 - summerNote		
		     placeholder: '프로젝트 설명을 입력해주세요.',
		     tabsize: 2,
		     height: 120,
		     toolbar: [
		       ['style', ['style']],
		       ['font', ['bold', 'underline', 'clear']],
		       ['color', ['color']],
		       ['para', ['ul', 'ol', 'paragraph']],
		       ['table', ['table']],
		       ['insert' /* ['link', 'picture', 'video'] */],
		       ['view', ['fullscreen', 'codeview', 'help']]
		     ]
		});
		$("#summernote-update").summernote({				//  위즈윅 - summerNote		
		     placeholder: '프로젝트 설명을 입력해주세요.',
		     tabsize: 2,
		     height: 120,
		     toolbar: [
		       ['style', ['style']],
		       ['font', ['bold', 'underline', 'clear']],
		       ['color', ['color']],
		       ['para', ['ul', 'ol', 'paragraph']],
		       ['table', ['table']],
		       ['insert' /* ['link', 'picture', 'video'] */],
		       ['view', ['fullscreen', 'codeview', 'help']]
		     ]
		});
		
	}); 
		
	$("#hideBtn").click(listAndHide);
	
	function listAndHide() {
	    if ($(this).css("color") === "rgb(0, 155, 119)") {
	    	$(this).css("color", "black");
	         $(this).html(plusImg);
	        loadHide();	        
	        $(".dropdown-btn-hide").closest("a").hide();
	    } else {
	         $(this).html(minusImg);
	        $(this).css("color", "#009b77");
	        loadList();
	        $(".dropdown-btn-hide").closest("a").show();
	    }
	}
	
	function loadHide() {
		$.ajax({
			url: "${pageContext.request.contextPath}/member/loadHide",
			type: "get",
			data: $("#wrap-list").serialize(),
			async : false,
			datatype: "json",
			success: makeView,
			error: function() {
				alert("loadHide에서 에러났습니다.");
			}
		});
		console.log("loadHide 실행");
	}
	
	function loadList() {
		$.ajax({
			url: "${pageContext.request.contextPath}/member/loadList",
			type: "get",
			data: $("#wrap-list").serialize(),
			async : false,
			datatype: "json",
			success: makeView,
			error: function() {
				alert("loadList에서 에러났습니다.");
			}
		});
		console.log("loadList 실행");
	}
	
	function makeView(data) {
	    var listHtml = "";
	    listHtml += `
	    
	        `;
	    for(var i=0;i<data.length;i++){
			var ul = data[i];
			listHtml+=`
	        	<div class="col-sm-6 list-card" data-pno="\${ul.pno}" >
		            <div class="card">
		                <form class="frm select" action="${pageContext.request.contextPath}/member/ptasklist" method="get">
		                    <input type="hidden" name="pno"  value="\${ul.pno}">
		                    <div class="card-body list">
	                    </form>
	                        <div class="row">
	                            <div class="col mt-0">
	                                <h5 class="card-title">
	                                    <span>\${ul.deptName}</span>: <span>\${ul.mname}</span><span> \${ul.mrank}</span>님
	                                </h5>
	                            </div>
	                            
	                            <div class="col-auto">
	                                <div class="stat text-primary">
	                                    \${ul.prow}
	                                </div>	
	                            </div>
	                        </div>
	                        <h1 class="mt-1 mb-3" data-pname="\${ul.pname}">\${ul.pname}</h1>
	                        <div class="mb-0" >
	                            <span class="text-muted" data-pstatus="\${ul.pstatus}">\${ul.pstatus}</span>
								<div class="dropdown-option" >
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" 
			                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
											class="feather feather-more-horizontal align-middle me-2 dropbtn-option"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle>
									</svg>	
								  <div class="dropdown-content-option">
								    <a href="#" class="dropdown-btn-update">
								    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle me-2 dropdown-btn-update"><path class="dropdown-btn-update" d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path class="dropdown-btn-update" d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
								    	<span class="dropdown-btn-update">수정</span>
							    	</a>
							    	
							    	<a href="#" class="dropdown-btn-hide">
							 	    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2 dropdown-btn-hide"><path class="dropdown-btn-hide" d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line class="dropdown-btn-hide" x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>
								    	<span class="dropdown-btn-hide">숨김</span>
								    </a>
								  </div>
								</div>
	                        </div>
	                    </div>	
		            </div>
	           </div>`;
				}
	    $("#wrap-list").html(listHtml);
	    $(".frm.select").click(selectOption);  // stream.js -> abc();
	    $("#updateBtn").click(doUpdateProject);
	}
	
/*  	function listDelete($thisEle) {
 		console.log($thisEle.parents("[name=pno]").val());
		$.ajax ({
			url: "${pageContext.request.contextPath}/deleteList.ajax",
			type: "get",
			data: {pno: $thisEle.parents("[name=pno]").val()} ,
			
			dataType: "json", 
			success: function(result) {
				console.log(result.result);// delete
				console.log(result.pno);// delete - pno 
				if($thisEle.closest(".list-card").data("pno") ==result.pno){
					$thisEle.closest(".list-card").remove();	
				}
			}, // listDeleteHandler
			error: function() {
				alert("에러났습니다.");
			}
		});
 		
	} */
	</script>

</html>
