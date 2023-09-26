<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<!-- The Modal -->
<div id="addChatModal" class="modal project right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog addProject">
		<!-- Modal content -->
		<div class="modal-content addProject">
			<div class="modal-header addProject"></div>
			<div class="modal-body addProject">
				<div class="card">
					<div class="card-body addProjectTitle">
						        <article style="float: left;">
            <div id="s_sub_menu_box">
                <button id="s_chat_btn" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#roomModal">방 만들기</button>
				<!-- 서브 메뉴 -->
				<div id="s_sub_menu">
	                <button id="s_emp_list" class="btn btn-primary s_chat_menu">참여자목록</button>
	                <button id="s_chat_list" class="btn btn-light s_chat_menu" style="width: 120px; height: 45px">채팅 리스트</button>
                </div>
                <!-- 사원 목록 클릭 시 띄울 내용 -->
                <div id="s_menu_box1" class="s_menu_box s_scroll">
                 <c:forEach items="${list}" var="i">
	                <div class="s_emp_box">
	                	<!-- 로그인한 사람의 프로필 사진 -->
	                	<%-- <img class="s_img_style" src="${selectOne.emp_file_path }"> --%>
	                	<!-- 로그인한 사람의 부서명, 이름 -->
	                	<%-- <div class="s_dn_en">${selectOne.dept_name } - ${selectOne.emp_name }</div> --%>
 	                	<img class="chatimg" src="img/avatars/user1.jpg" ><h3 style="margin-top: 10px">${i.mname}</h3>
	                </div>
	             	</c:forEach>
	                <div id="s_f_list">참여자 리스트</div>
	              	
	                <!-- 로그인한 사람 제외한 사원 리스트만큼 반복문 실행 -->
	                <c:forEach items="" var="i">
		                <div class="s_emp_box">
		                	
		                	<!-- 사원의 프로필 사진 -->
		                	<%-- <img class="s_img_style" src="${i.emp_file_path }"> --%>
		                	<!-- 사원의 부서명, 이름 -->
		                	<%-- <div class="s_dn_en">${i.dept_name } - ${i.emp_name }</div> --%>
		                	
	                	</div>
	                </c:forEach>
                </div>
                <!-- 채팅 리스트 클릭 시 띄울 내용 -->
                <div id="s_menu_box2" class="s_menu_box s_scroll">
                	<!-- 채팅방 리스트만큼 반복문 실행 -->
                	<c:forEach items="${selectRoom }" var="i">
	                	<div class="s_chat_box">
	                		<!-- 채팅방 상세조회 시 넘길 방 번호 hidden으로 주기 -->
	                		<input type="hidden" id="${i.room_no }" value="${i.room_no }">
	                		<!-- 방 제목 표기 -->
		                	<div class="s_room_tt">${i.room_title }</div>
		                	<!-- 해당 방 마지막 대화 표기 -->
		                	<c:if test="${empty i.ch_content}">
		                		<div>대화를 시작해주세요.</div>
		                	</c:if>
		                	<c:if test="${not empty i.ch_content }">
		                		<div>${i.ch_content }</div>
		                	</c:if>
	                	</div>
                	</c:forEach>
                </div>
            </div>
        </article> 
					</div>
				</div>
			</div>
			<!-- <div class="modal-footer ptask"></div> -->
		</div>
	</div>
</div>
<script>
	$("#btn-submit").click(addList);
	$("#myBtn").click(selectOption);
//	$(".dropdown-btn-update").click(updateOption);
    $("select[name=addpstatus]").change(selectOption);
    $("select[name=updatepstatus]").change(updateOption);
    
	function addList () {
		var data = myEditor.getData();
		$("[name=pcontent]").val(data);
		
		console.log($("#addProject").serialize());  // "n1=v1&n2=v2"&pcontent=rkqdfjklfjlddfld
		$.ajax ({
			url: "${pageContext.request.contextPath}/projectInsert",
			type: "post",
			//data: $("#addProject").serialize(),
			data : $("#addProject").serialize(),
			dateType: "json",
			success: function(result){
				
				console.log(result);
				makeView(result);
				$(".modal").modal("hide");
			},
			error: function() {	
				alert("addList에서 에러났습니다.");
			}
		});	
	}
	
 	function selectOption() {
 	    var selectedOption = $("select[name=addpstatus] option:selected").text();
 	    $("#valuePstatus").val(selectedOption);
	}
 	
 	function updateOption() {
 	    var updatedOption = $("select[name=updatepstatus] option:selected").text();
 	    $("#valuePstatus").val(updatedOption);
 	   	console.log($("#valuePstatus").val(updatedOption));
	}
	

</script>

<!-- 모달 -->