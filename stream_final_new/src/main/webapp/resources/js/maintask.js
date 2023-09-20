window.onload=loadedHandler;

function loadedHandler(){
	$(".jm-move").on("dragstart", dragStart);
	$(".jm-move").on("drag", dragging);
	$(".jm-drop").on("dragenter", dragEnter);
	$(".jm-drop").on("dragover", allowDrop);
	$(".jm-drop").on("drop", drop);
	$(".jm-move").on("dragend", dragEnd );
	$(".jm-box-project-title").on("click", titleClickHandler);
	$(".jm-task-info").on("click", projectButtonClickTestHandler);
	$(".jm-inner-task-button").on("click", innerTaskInputHandler);
	$('html').on("click", boxOutHandler)
	$(".jm-innerTask-insert-button").click(innerTaskaddList);
	$("select[name=tstatus]").change(selectOption);
}

function dragStart(e){
	console.log(this.id);
	console.log(e.target.id);
	event.dataTransfer.setData("abc", event.target.id);
}
function dragging(e){
	console.log(this.id);
	event.dataTransfer.setData("abc", event.target.id);
}
function dragEnter(e){
	console.log(this.id);
	this.style.border="3px dotted red";
}
function allowDrop(e){
	event.preventDefault();
	
}
function drop(e){
	event.preventDefault();
	var data = event.dataTransfer.getData("abc");
	console.log(data);
	console.log(event.target);
	var jTargetElement = $(event.target);
	console.log(jTargetElement);
	console.log(jTargetElement.parents(".jm-move"));
	jTargetElement.parents(".jm-drop").append(document.getElementById(data));
	//event.target.appendChild(document.getElementById(data));
}
function dragEnd(e){
	console.log("드래그 종료");
}

titleClickHandler=(event)=>{
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

projectButtonClickTestHandler=(event)=>{
	console.log(event.target);
}

functionDateHandler=(e)=>{
	var today = new Date();
	
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	
	var dateString = year + '-' + month  + '-' + day;
	
	console.log(dateString);
	$(".innerTdate").html("<span>"+dateString+"</span>");
	
}

innerTaskInputHandler=(event)=>{
	console.log(event.target);
	const a1 = event.target;
	$(a1).closest('li').next('form').find(".jm-innerTask-el").addClass('row active');
	$(a1).closest('li').next('form').find(".jm-innerTask-el").css("display","block, flex");
	$(".innerTdate").text(functionDateHandler())
	
}

boxOutHandler=(event)=>{
	const a1 = event.target;
	if( $(".jm-innerTaskInput").hasClass('active') ){
		if(	!$(a1).hasClass("jm-innerTaskInput") 
			&& !$(a1).hasClass("jm-inner-task-button")
			&& !$(a1).parents('li').hasClass("jm-innerTaskInput")
			){
			console.log("영역외");
			console.log(a1);
			$(".jm-innerTaskInput").removeClass('row active');
		}
	}
}

selectOption=()=>{
	var selectedOption = $("select[name=tstatus] option:selected").text();
 	console.log(selectedOption);
 	$(".jm-select-tstatus").val(selectedOption);
}

function innerTaskaddList () {
 const contextPath = "${pageContext.request.contextPath}";
	console.log("ajax간다");
	$.ajax ({
		url: contextPath+"/innertaskinsert",
		type: "post",
		//data: $(".addInnerTask").serialize(),
		data : $(".addInnerTask").serialize(),
		dateType: "json",
		success: function(result){
			console.log("성공");
			// makeView(result);
			// $(".modal").modal("hide");
		},
		error: function() {	
			alert("innerTaskaddList 에서 에러났습니다.");
		}
	});	
}
