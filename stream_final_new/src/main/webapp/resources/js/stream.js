function abc(e){
	targetPno = $(this).children("[name=pno]").val();
	console.log(targetPno); 
	if($(e.target).hasClass("dropdown-btn-update")) {
		updateProject(targetPno);
	} else if($(e.target).hasClass("dropdown-btn-delete")){
		hideProject(targetPno);	
	} else {
		$(this).submit();
	}
}

function updateProject(pno) {
	//event.stopPropagation();
	console.log("Update");
	console.log(pno);
	//$("#updateProjectModal").toggle();
	$("#updateProjectModal").modal("toggle");
}


function hideProject(targetPno) {
	console.log("Hide");
	event.stopPropagation();
}
