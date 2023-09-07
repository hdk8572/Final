window.onload=loadedHandler;

function loadedHandler(){
	$(".jm-move").on("dragstart", dragStart);
	$(".jm-move").on("drag", dragging);
	$(".jm-drop").on("dragenter", dragEnter);
	$(".jm-drop").on("dragover", allowDrop);
	$(".jm-drop").on("drop", drop);
	$(".jm-move").on("dragend", dragEnd );
}

function dragStart(e){
	console.log("dragStart"+this.id);
	console.log("dragStart"+e.target.id);
	event.dataTransfer.setData("abc", event.target.id);
}
function dragging(e){
	console.log("dragging"+this.id);
	event.dataTransfer.setData("abc", event.target.id);
}
function dragEnter(e){
	console.log("드랍 가능한 공간 도착"+this.id);
	this.style.border="3px dotted red";
}
function allowDrop(e){
	event.preventDefault();
	
}
function drop(e){
	event.preventDefault();
	var data = event.dataTransfer.getData("abc");
	console.log("드랍"+data);
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


