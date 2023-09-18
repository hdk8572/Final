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
	$("#updateProjectModal").modal("toggle");

 		var updeptName = $('[name=deptName"+pno+"]');
 		
 		console.log(updeptName.dataset.deptName);
	
}


function hideProject(targetPno) {
	console.log("Hide");
	event.stopPropagation();
}
