function selectOption(e){
	targetPno = $(this).children("[name=pno]").val();
	console.log(targetPno); 
	if($(e.target).hasClass("dropdown-btn-update")) {
		goUpdateForm(targetPno);
		
	} else if($(e.target).hasClass("dropdown-btn-delete")){
		hideProject(targetPno, $(this));
		
			
	} else {
		$(this).submit();
	}
}

function goUpdateForm(pno) {
	$("#updateProjectModal").modal("toggle");
	console.log(pno);
	console.log(contextPath);
	$.ajax({
	 	url: contextPath+"/projectOne/"+pno,
	 	type: "get",
	 	dataType: "json",
	 	success: function(result){
	 		console.log("result :"+result);
	 		console.log("result.pname :"+result.pname);
	 		console.log("result.pcoment :"+result.pcoment);
	 		console.log("result.pstartDate :"+result.pstartDate);
	 		
			$("#updateProjectModal [name=pno]").val(result.pno);
			$("#updateProjectModal [name=pname]").val(result.pname);
			$("#updateProjectModal [name=pcoment]").val(result.pcoment);
			$("#updateProjectModal [name=pstartDate]").val(result.pstartDate);
			$("#updateProjectModal [name=pendDate]").val(result.pendDate);
			$("#updateProjectModal [name=mname]").val(result.mname);
			
	 	},
	 	error: function() {
	 		console.log("selectOne에서 오류 발생");
	 	}
	 });
}

function doUpdateProject() {
	$.ajax ({
		url: contextPath+"/doUpdateProject",
		type: "get",
		data: $("#infoProject").serialize(),
		dataType: "json",
		success: function(result) {
			console.log(result.pname);
		
			$("#updateProjectModal [name=pno]").val(result.pno);
			$("#updateProjectModal [name=pname]").val(result.pname);
			$("#updateProjectModal [name=pcoment]").val(result.pcoment);
			$("#updateProjectModal [name=pstartDate]").val(result.pstartDate);
			$("#updateProjectModal [name=pendDate]").val(result.pendDate);
			$("#updateProjectModal [name=mname]").val(result.mname);
		
		},
		error: function() {
			console.log("doUpdateProject에서 오류 발생");
		}
	});
}


function hideProject(pno, $thisElement) {
	
	$thisElement.closest(".col-sm-6.list-card[data-pno]").remove();
	// ajax	

}

