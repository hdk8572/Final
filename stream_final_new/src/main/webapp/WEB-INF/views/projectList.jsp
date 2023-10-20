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

<!-- Tab bar -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Stream - 업무도 흐름이다!</title>

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
	
		<%@ include file="/WEB-INF/views/sidebar.jsp"%>
			<div class="main">
			<%@ include file="/WEB-INF/views/headernavbar.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<span id="userName">${principal.username}님의 프로젝트 목록</span>
						<!-- <form>
							<div class="search">
								<input name="keyword" type="text" placeholder="검색어를 입력해주세요.">
							</div>
							<button>검색하기</button>
						</form> -->
						<span><button class="btn btn-primary addProject" id="myBtn"	data-bs-toggle="modal" data-bs-target="#addProjectModal">프로젝트 추가+</button></span>
						<svg id="hideBtn" xmlns="http://www.w3.org/2000/svg" width="24"	height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus-circle align-middle me-2 hideView"><circle cx="12" cy="12" r="10"></circle><line x1="8" y1="12" x2="16" y2="12"></line></svg>
						<input class="form-control searchBar" name="keyword" type="text" id="searchProjectListHandler" placeholder="검색 - 프로젝트명을 입력해주세요.">
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
	const deleteImg = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>'
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
		       ['view', ['codeview'/* , 'fullscreen', 'help' */]]
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
		       ['view', ['codeview'/* , 'fullscreen', 'help' */]]
		     ]
		});
		
		$('.modal').on('hidden.bs.modal', function (e) {
			var resett1 = $(this).find('form')[0].reset();
			$(this).find('form')[0].reset();
			$("#summernote").summernote('code', "");				// addProjectModal 닫을 시 summernote 값 초기화
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
			var projectOne = data[i];
			listHtml+=`
	        	<div class="col-sm-6 list-card" data-pno="\${projectOne.pno}" >
		            <div class="card">
		                <form class="frm select" action="${pageContext.request.contextPath}/member/ptasklist" method="get">
		                    <input type="hidden" name="pno"  value="\${projectOne.pno}">
		                    <input type="hidden" name="userid"  value="\${projectOne.userid}">
		                    <div class="card-body list">
	                    </form>
	                        <div class="row">
	                            <div class="col mt-0">
	                                <h5 class="card-title">
	                                    <span>\${projectOne.deptname}</span>: <span>\${projectOne.mname}</span><span> \${projectOne.mrank}</span>님
	                                </h5>
	                            </div>
	                            
	                            <div class="col-auto">
	                                <div class="stat text-primary">
	                                    \${projectOne.countmember}명
	                                </div>	
	                            </div>
	                        </div>
	                        <h1 class="mt-1 mb-3" data-pname="\${projectOne.pname}">\${projectOne.pname}</h1>
	                        <div class="mb-0" >
	                            <span class="text-muted" data-pstatus="\${projectOne.pstatus}">\${projectOne.pstatus}</span>
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
	    $("#updateBtn").click(function() {
	    	doUpdateProject();
	    });
	    //writerUserid = $(".frm.select [name=userid]").val();
	}
	
	$("#searchProjectListHandler").keydown(function(event) {
		if(event.keyCode == 13) {
			event.preventDefault();
			SerachProjectList();			
			$(".form-control.searchBar").val("");
		} else { 			null;
		}
	});
	
	function SerachProjectList() {
		console.log("useridJs :"+useridJs);
		$.ajax({
			url: "${pageContext.request.contextPath}/member/serachProjectList",
			type: "get",
			data: {keyword: $("#searchProjectListHandler").val(), userid: useridJs},
			dataType: "json",
			success: function(result) {
				makeView(result);
			},
			error: function() {
				console.log("검색 실패");
			}
		})
	}

	function selectOption(e){
		targetPno = $(this).children("[name=pno]").val(); // 중요하다
		var writerUserid = $(this).find("[name=userid]").val();
		if($(e.target).hasClass("dropdown-btn-update")) {
				
			if('${principal.username}' != writerUserid) {
				alert("작성자만 수정할 수 있습니다.");
				return null; 
			} else {
				goUpdateForm(targetPno);
			}
				updateMemberList();
		} else if($(e.target).hasClass("dropdown-btn-hide")){
			
			if('${principal.username}' != writerUserid) {
				alert("작성자만 숨길 수 있습니다.");
				return null; 
			} else {
				hideProject(targetPno, $(this));
			}
		} else {
			$(this).submit();
		}
	}
	
	function goUpdateForm(pno) {
		$("#updateProjectModal").modal("toggle");
		console.log("pno :"+pno);
		console.log("useridJs :"+useridJs);
		
		$.ajax({
		 	url: contextPath+"/member/projectOne",
		 	type: "get",
		 	data: {pno:pno, userid:useridJs},
		 	async : false,
		 	dataType: "json",
		 	success: function(result){
		 		console.log("불러왔습니다.");
				$("#updateProjectModal [name=pno]").val(result.pno);
				$("#updateProjectModal [name=pname]").val(result.pname);
				$('#summernote-update').summernote('code', result.pcontent);	// updateProjectModal 닫을 시 summernote 기존 입력값 부여
				$("#updateProjectModal [name=pstartdate]").val(result.pstartdate);
				$("#updateProjectModal [name=penddate]").val(result.penddate);
				$('#updateProjectModal select[name=addpstatus]').val(result.pstatus).attr("selected",true);
				$("input[name=pstatus]").val(result.pstatus);		// 선택된 pStatus 조회 1-1
		 	},
		 	error:function(){
				console.log("goUpdateForm에서 에러 발생");
			}
		 	
		 });
		console.log("불러왔습니다2.");
		$("#updateStatus").change(function(){
			var changedPstatus = $("#updateStatus").val();
			$("input[name=pstatus]").val(changedPstatus);
		});
		
	}
	
	function doUpdateProject() {
		console.log("업데이트 실행");
	 	$.ajax ({
			url: contextPath+"/member/doUpdateProject",
			type: "get",
			async: false,
			data: $("#infoProject").serialize(),
			success: function(result) {  // result int type 
				if(result > 0){
					location.href=contextPath+"/member/projectlist";
				} else {
					alert("ek");
				}		
			},
			error: function() {
				console.log("doUpdateProject에서 오류 발생");
			}
		});	
	 	//deleteAllCurrentMember();
	}
	/* 
	function deleteAllCurrentMember() {	
		console.log("멤버 삭제 실행"); 
		$.ajax ({
		 	url: "${pageContext.request.contextPath}/member/deleteAllCurrentMember",
		 	type: "post",
		 	data: {pno: pno},
		 	dataType: "json",
		 	success: function(){
		 		console.log("삭제했습니다.");
		 	},
		 	error:function(){
				console.log("deleteAllCurrentMember에서 에러 발생");
			}
		});
		console.log("삭제했습니다2.");
	}
 */
	function hideProject($thisElement) {
	    //var pstatus = $thisElement.closest(".list-card").find(".text-muted").attr("data-pstatus");// 엄청 중요합니다.
	    var pno = $thisElement;
	    $.ajax ({
	    	url: contextPath+"/member/doUpdateProjectHide",
	    	type: "get",
	    	data: {pno:pno, userid:useridJs},
			dataType: "json",
			success: function(result) {
				console.log("hide 다녀왔습니다");
				location.href=contextPath+"/member/projectlist";
			},
			error: function() {
				console.log("doUpdateProject.direct에서 오류 발생");
			}
	    });
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
