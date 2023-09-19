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
	 $.ajax({
	 	url: "${}/project/selectOne"
	 	,data: {pno:pno}
	 	,success: function(result){
			$("#updateProjectModal [name=pno]").val(result.pno);
			$("#updateProjectModal [name=pcode]").val(result.pcode);
			$("#updateProjectModal [name=pname]").val(result.pname);
	 	}
	 });
// 		var updeptName = $('[name=deptName]');
// 		console.log(updeptName.dataset.deptName);
	
}


function hideProject(targetPno) {
	console.log("Hide");
	event.stopPropagation();
}
