function abc(e){
//TODO
	//메소드지정
	//$(this).attr("method","post");
	//$(this).attr("action", "${pageContext.request.contextPath}/ptasklist");
	
	if($(e.target).hasClass("dropdown-btn")) {
		console.log("성공");
	} else {
		$(this).submit();
	}
}

$(document).ready(function() {

	$(".col-sm-6").click(function() {
		$(this).submit();
	});
	
});



