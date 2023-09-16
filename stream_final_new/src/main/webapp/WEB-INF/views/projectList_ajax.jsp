<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
 	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>AdminKit Demo - Bootstrap 5 Admin Template</title>
	
	<!-- Bootstrap CSS -->
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	
	<!-- ProjectList CSS -->
	<link href="${pageContext.request.contextPath}/css/projectList.css" rel="stylesheet">
	<!-- Modal CSS -->
	<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">
	
	<!-- DropDown - Option CSS -->	
	<link href="${pageContext.request.contextPath}/css/projectList.option.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<!-- Tab bar -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
</head>
<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/sidebar.jsp" %>
		<div class="main">
			<%@ include file="/WEB-INF/views/headerNavbar.jsp" %>
			
			
			
			<main class="content">
				<div class="container-fluid p-0">
					
					<h1 class="h3 mb-3" >
						<span>${ul.mname}님의 프로젝트 목록</span>
						<span><button class="btn btn-primary addProject" id="myBtn" data-bs-toggle="modal" data-bs-target="#myModal">프로젝트 추가+</button></span>
					</h1>
						
					<%@ include file="/WEB-INF/views/addProjectModal.jsp" %>
						
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
	
	<!-------------------- Script ----------------------->
	<script src="${pageContext.request.contextPath}/js/stream.js"></script>
	<script src="${pageContext.request.contextPath}/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<script>
	$(document).ready(function() {
		  $(".sidebar-link").mouseover(function() {
		    $(this).css({
		      "background-color": "#009b77",
		    });
		    $(this).find("span").css({
		      "color": "white"	
		    });
		    $(this).find("svg").css({
		      "color": "white"	
		    });
		  }).mouseout(function() {
		    $(this).css({
		      "background-color": "white",
		    });
		    $(this).find("span").css({
		      "color": "#009b77"	
		    });
		    $(this).find("svg").css({
		      "color": "#009b77"	
	    });
	  });
		    loadList();
		    
	});
	
	function loadList() {
		$.ajax({
			url: "${pageContext.request.contextPath}/projectlist.ajax",
			type: "get",
			data: $("#wrap-list").serialize(),
			datatype: "json",
			success: makeView,
			error: function() {
				alert("에러났습니다.");
			}
		});
	}

 	function makeView(data) {
	    var listHtml = "";
	        listHtml += `
	        
	        
	        
	        `
				for(var i=0;i<data.length;i++){
				var ul = data[i];
			listHtml+=`
	        	<div class="col-sm-6 list-card" data-pno="\${ul.pno}" >
		            <div class="card">
		                <form class="frm select" action="${pageContext.request.contextPath}/ptasklist" method="get">
 		                    <input type="hidden" name="pno" value="\${ul.pno}">
		                    <div class="card-body">
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
		                        <h1 class="mt-1 mb-3" id="pname\${ul.pno}">\${ul.pname}</h1>
		                        <div class="mb-0" >
		                            <span class="text-muted" id='pstatus\${ul.pno}' >\${ul.pstatus}</span>
		                            <button class="btn btn-primary addProject" id='newBtn\${ul.pno}' style="display: none;">수정</button>&nbsp&nbsp&nbsp
									<div class="dropdown-option" >
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" 
				                            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												class="feather feather-more-horizontal align-middle me-2 dropbtn-option"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle>
											
										</svg>	
									  <div class="dropdown-content-option">
									    <a href="#" class="dropdown-btn" onClick="updateProject(\${ul.pno})">
									    	<svg onClick="updateProject(\${ul.pno})" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit align-middle me-2 dropdown-btn"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
									    	<span class="dropdown-btn" onClick="updateProject(\${ul.pno})">수정</span>
								    	</a>
								    	<a href="#" class="dropdown-btn">
									    	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-delete align-middle me-2 dropdown-btn"><path d="M21 4H8l-7 8 7 8h13a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2z"></path><line x1="18" y1="9" x2="12" y2="15"></line><line x1="12" y1="9" x2="18" y2="15"></line></svg>
									    	<span class="dropdown-btn">숨김</span>
									    </a>
									  </div>
									</div>
		                        </div>
		                    </div>
		                </form>
		            </div>
	           </div>`;
				}
	    $("#wrap-list").html(listHtml);
	    $(".frm.select").click(abc);  // stream.js -> abc();
	    $(".list-delete").click(listDeleteHandler);
	}
 	
 	
 	
 	function listDeleteHandler(e) {
 		
	}
 	
 	function updateProject(pno) {
 		var newInput = "<input type='text'/>";
 		var newBtn = "<button>수정<button>"
 		$("#pname"+pno).html(newInput);
 		$("#newBtn"+pno).css("display", "inline-block");
 	}
 	
 	
 	function listDelete($thisEle) {
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
 		
	}
 	
 	
	</script>

	
</body>
</html>