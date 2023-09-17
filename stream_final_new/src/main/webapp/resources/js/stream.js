function abc(e){
	if($(e.target).hasClass("dropdown-btn-update")) {
		updateProject();
	} else if($(e.target).hasClass("dropdown-btn-delete")){
		hideProject();	
	} else {
		$(this).submit();
	}
}

function updateProject() {
	
}


function hideProject() {
	console.log("Hide");
}

$(document).ready(function() {

	$(".col-sm-6").click(function() {
		$(this).submit();
	});
	
});



;