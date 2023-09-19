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
	console.log(pno);
	console.log(contextPath);
	$.ajax({
	 	url: contextPath+"/projectOne/"+pno,
	 	type: "get",
	 	// data: {"pno":pno},
	 	dataType: "json",
	 	success: function(result){
	 		console.log(result);
	 		console.log(result.pno);
			$("#updateProjectModal [name=pno]").val(result.pno);
			$("#updateProjectModal [name=pname]").val(result.pname);
			$("#updateProjectModal [name=pcoment]").val(result.pcoment);
			$("#updateProjectModal [name=pstartDate]").val(result.pstartDate);
			$("#updateProjectModal [name=pendDate]").val(result.pendDate);
			 
	 	},
	 	error: function() {
	 		console.log("selectOne에서 오류 발생");
	 	}
	 });
}




function hideProject(targetPno) {
	console.log("Hide");
	event.stopPropagation();
}
