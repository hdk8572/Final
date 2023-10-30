<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
//console.log(contextPath);
window.onload=loadedHandler;

function loadedHandler(){

	//업무리스드 열고 닫기
	$(".jm-box-project-title").on("click", titleClickHandler);
	
	//자세히 보기 클릭 이벤트
	//$(".jm-task-info").on("click", taskDetailButtonClickTestHandler);
	
	//업무 추가 버튼 form submit 이벤트
	$(".addInnerTask").on("submit",ttitleCheckHandler);
	//ajax 원클릭 변경. 현재 미사용
	//$(".jm-inner-task-button").on("click", innerTaskInputHandler);
	//$(".jm-innerTask-insert-button").click(innerTaskaddListHandler);
	
	//업무추가 메뉴 닫기 이벤트
	$('html').on("click", boxOutHandler);
	titleHoverHandler();
	
}

/* 프로젝트 이름 클릭했을시 동작하는 함수 */
titleClickHandler=(event)=>{
	console.log("[JM]===titleClickHandler===")
	const a1 = event.target;
	console.log(event.target);
	
	$(a1).toggleClass('active');	
	if( $(a1).hasClass('active') ){
		$(a1).parent().next('ul').hide();
		$(a1).find(".jm-rotate").css("rotate","90deg");
	}else{
		$(a1).parent().next('ul').show();
		$(a1).find(".jm-rotate").css("rotate","0deg");
	}
} 

/* 업무 자세히 보기 버튼 누를 경우 동작하는 함수 (modal, ajax 동작)*/
taskDetailButtonClickTestHandler=(thisButton)=>{
	console.log("[JM]===taskDetailButtonClickTestHandler===")
	var a1 = thisButton
	console.log(a1);
	var b1 = $(a1).closest('li')[0].id;
	console.log(b1);
	var targetTno = $(a1).next().find("input[name=tno]").val();
	var targetPno = $(a1).next().find("input[name=pno]").val();
	console.log("[JM]===taskDetail Target===")
	console.log(targetTno);
	console.log(targetPno);
	$("#detailPtaskModal").modal("toggle");
	
	$.ajax({
		 	url: contextPath+"/member/ptaskselectOne",
		 	type: "get",
		 	dataType: "json",
		 	data: {tno: targetTno, pno: targetPno},
		 	success: function(result){
		 		$(".wrap-card .tcontent").html(result.tcontent);
		 		$(".wrap-card .ttitle").html(result.ttitle);
		 		$(".wrap-card .tstatus").html(result.tstatus);
		 		$(".wrap-card .userid").html(result.userid);
		 		$(".wrap-card .tstartdate").val(result.tstartdate);
		 		$(".wrap-card .tenddate").val(result.tenddate);
		 		$(".wrap-card input[name=pno]").val(result.pno);
		 		$(".wrap-card input[name=tno]").val(result.tno);
		 		console.log(result);
		 		console.log(result.tno);
		 		targetTno = result.tno;
		 		replyLoadList(targetTno);
		 	},
		 	error: function() {
		 		console.log("detailProject에서 오류 발생");
		 	}
		});
}

/* 오늘 날자 출력 */
functionDateHandler=(e)=>{
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	$(".innerTdate").html("<span>"+dateString+"</span>");
}

/* 하위 업무 추가할 때 동작하는 함수 */
innerTaskInputHandler=(thisElement)=>{
	
	console.log("[JM]==innerTaskInputHadler==")
	const a1 = thisElement;	//button
	console.log(this);   // window  
	console.log(thisElement);  
	console.log(a1);
	console.log($(a1).closest('li').next());
	var a2 = $(a1).closest('li').next().children('form')[0].id;	
	console.log(a2);	//taskInputNo_{tno}
	var a3 = '#'+a2;	//#taskInputNo_{tno}	
	console.log(a3);
	$(a3).find(".jm-innerTaskInput").addClass('row active');
	$(".innerTdate").text(functionDateHandler())
	getProjectMemberList(thisElement);
}

/* 하위업무 입력박스 외 부분 클릭시 동작하는 함수 */
boxOutHandler=(event)=>{
	const a1 = event.target;
	if( $(".jm-innerTaskInput").hasClass('active') ){
		if(	!$(a1).hasClass("jm-innerTaskInput") 
			&& !$(a1).hasClass("jm-inner-task-button")
			&& !$(a1).parents('div').hasClass("jm-innerTaskInput")
			){
			$(".jm-innerTaskInput").removeClass('row active');
			var size = $('.addInnerTask').length;
			var i = 0;
			for(i=0;i<size;i++){
			$('.addInnerTask')[i].reset();
			$(a1).parents('div').find(".jm-title-tstartdate").find(".jm-dateChage").html('<span>시작일</span>');
			$(a1).parents('div').find(".jm-title-tenddate").find(".jm-dateChage").html('<span>마감일</span>');
			}
		}
	}
	
}
/* 프로젝트 참가자들을 구하는 함수 (ajax) */
function getProjectMemberList(thisElement){
	console.log("[JM]===getProjectMemberList===")
	var a1 = thisElement;
	console.log(a1);
	var a2 = $(a1).closest('li').next().find('select[name=tmember]')[0].id;
	console.log(a2);
	var a3 = '#'+a2;
	console.log(a3);
	var a4 = $(a1).next().next().find('input[name=pno]').val();
	console.log(a4);
	var htmlTarget = $(a1).closest('li').next().find('select[name=tmember]')[0];
	console.log(htmlTarget);
		$.ajax({
			url:contextPath+"/member/showprojectmemberlist",
			type:"get",
			data : {
				pno : a4,
				userid : principal_username
			},
			dataType: "json",
			success: (data)=>{
				console.log(data);
				console.log("성공하였습니다.");
				showProjectMemberView(data, htmlTarget)
			},
			error:function(request, status, error){
			console.log(request);
			console.log(status);
			console.log(error);
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
/* 프로젝트 참가자들을 구하는 함수 (ajax) */
function showProjectMemberView(data, htmlTarget){
	console.log("[JM]===showProjectMemberView===")
		console.log(data)
		console.log("성공하였습니다.")
		console.log(data[0]);
		var listHtml = "";
		for (var i=0; i<data.length; i++){
			var mname = data[i];
			listHtml += `<option value="\${mname.userid}">\${mname.mname}</option>`; //data를 뿌리고 그걸 option에다가 넣어줌 //value=userid
		}
		$(htmlTarget).html(listHtml);
}


ttitleCheckHandler=(event)=>{
	console.log("[JM]===ttileCheckHandler===")
	var a1 = event.target;
	console.log(a1);
}

/* 하위 업무 추가를 위한 함수 (ajax) */
function innerTaskaddListHandler (data) {
if(jmRegExp(data) == false){
		return;
	} 
console.log("[JM]===innerTaskaddListHandler===")

//const pathname = "/" + window.location.pathname.split("/")[1] + "/";
//const origin = window.location.origin;
//const contextPath = origin + pathname;
	console.log("ajax간다");
	console.log(event.target);
	var a1 = event.target;
	//???
	var d1 = $(a1).closest(".addInnerTask").serialize();
	console.log(d1);
	$.ajax ({
		url: contextPath+"/member/innertaskinsert",
		type: "post",
//		data : $(this).closest(".addInnerTask").serialize(),
		data : d1,
		dataType: "json",
		success: function(result){
				console.log("성공 ProjectVo with taskList ");
				console.log(result);
				makeView(result);
				//location.href=contextPath+"maintask"
			//}else{
			//	alert("전송된 값 없음");
			//}
		},
		error:function(request, status, error){
		console.log(request);
		console.log(status);
		console.log(error);
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function makeView(project) {
console.log(project);
console.log(project.pname);
	    var listHtml = "";
	    //if(data)
        listHtml += `
												<div class="jm-grey">
													<div class="jm-box-project-title jm-gr">
														<span class="jm-imgpd">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
															 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
															  class="feather feather-play align-middle jm-rotate"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
														</span>
														<span class="jm-project-title">\${project.pname }</span> 
														<span class="jm-project-task-count">(\${project.maintaskList.length})</span>
														<form class="jm-dn" action="${contextPath}/ptasklist" method="get">
															<input type="hidden" name="pno" value="\${project.pno}" >
															<button class="jm-tp">바로가기</button>
														</form>
													</div>
												</div>
												<ul class="jm-inner-task">
													<li class="jm-wrap-section-task-title jm-gr">
														<ul class="jm-serction-task-title">
			`;
	//project.maintaskList.map(function(task){
	for (var idx = 0; idx < project.maintaskList.length; idx++) {

		const task = project.maintaskList[idx];
listHtml += `
															<li class="plusplus row" id="taskNo_\${task.tno}">
																<div class="jm-title-ttitle jm-col-a jm-grey">
																	<span class="jm-margin-left">
			`;
		for(var i=0; i<task.brelevel; i++) {
listHtml +=															"<span>&#8618;</span>"
		}
listHtml +=															task.ttitle;
listHtml += `
																	</span>
			`;
		if(task.brelevel == 0) {
listHtml += `
																	<button class="jm-inner-task-button jm-hidden-btn" onclick="innerTaskInputHandler(this); DateInputCheckHandler(this);">업무추가</button>
			`; 
		}
listHtml += `
																	<button class="jm-tp jm-task-info jm-hidden-btn" onclick="taskDetailButtonClickTestHandler(this);">자세히 보기</button>
																	<div class="jm-hidden">
																			<input type="hidden" name="pno" value="\${project.pno}">
																			<input type="hidden" name="tno" value="\${task.tno }">
																	</div>
																</div>
																<div class="jm-title-tstatus jm-col-b jm-grey jm-cenalign"><span>\${task.tstatus }</span></div>
																<div class="jm-title-tmember jm-col-b jm-grey jm-cenalign"><span>\${task.mname }</span></div>
																<div class="jm-title-tstartdate jm-col-b jm-grey jm-cenalign"><span>\${task.tstartdate }</span></div>
																<div class="jm-title-tenddate jm-col-b jm-grey jm-cenalign"><span>\${task.tenddate }</span></div>
																<div class="jm-title-tdate jm-col-b jm-grey jm-gr jm-cenalign"><span>\${task.tdate }</span></div>
																<div class="jm-title-tno jm-col-b jm-grey jm-gr jm-cenalign"><span>\${task.tno }</span></div>
															</li>
															<li class="jm-ajax-InnertaskIn">
																<form class="addInnerTask" id="taskInputNo_\${task.tno}">
																	<div class="jm-innerTaskInput jm-hidden">
																		<div class="jm-title-ttitle jm-col-a jm-grey">
																			<input class="jm-input-length jm-margin-left" type="text" placeholder="하위업무명을 입력하세요" name="ttitle" required="required">
																		</div>
																		<div class="jm-title-tstatus jm-col-b jm-grey jm-cenalign">
																			<select class= "selectCategory ml-2 " name="tstatus">
																				<option value="미진행" class="status request" selected="selected">미진행</option>
																				<option value="진행" class="status progress">진행</option>
																				<option value="보류" class="status remain">보류</option>
																			</select>
																		</div>
																		<div class="jm-title-tmember jm-col-b jm-grey jm-cenalign">
																			<select name="tmember" id="tmember_select_pno_\${project.pno }">

																			</select>
																		</div>
																		<div class="dropdown jm-title-tstartdate jm-col-b jm-grey jm-cenalign">
																			<div data-bs-toggle="dropdown">
																				<span>시작일</span>
																			</div>
																			<div class="mini-pop dropdown-menu dropdown-menu-end">
																				<input type="date" name="tstartdate">
																			</div>
																		</div>
																		<div class="dropdown jm-title-tenddate jm-col-b jm-grey jm-cenalign">
																			<div data-bs-toggle="dropdown">
																				<span>마감일</span>
																			</div>
																			<div class="mini-pop dropdown-menu dropdown-menu-end">
																				<input type="date" name="tenddate">
																			</div>
																		</div>
																		<div class="jm-title-tdate jm-col-b jm-grey jm-gr">
																			<div class="innerTdate jm-cenalign"></div>
																		</div>
																		<div class="jm-title-tno jm-col-b jm-grey jm-gr jm-cenalign">
																			<input type="hidden" name ="tno" value="\${task.tno}">
																			<input type="hidden" name="tcontent" value="default">
																			<input type="hidden" name="pno" value="\${project.pno}">
																			<input type="hidden" name="userid" value="\${principal_username}"> <!-- 로그인 세션 받아서 등록 -->
																			<button type="button" onclick="innerTaskaddListHandler(this)">추가하기</button>
																		</div>
																	</div>
																</form>
															</li>
	        `;
		// });  // map
		} // for 
listHtml += `
														</ul>
													</li>
												</ul>
`;
        
		var id = "#projectNo_"+ project.pno;
		$(id).html(listHtml);
		console.log(id);
		titleHoverHandler()
}

</script>