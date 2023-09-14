function abc(e){
//TODO
	//메소드지정
	//$(this).attr("method","post");
	//$(this).attr("action", "${pageContext.request.contextPath}/ptasklist");
	
	console.log(e.target);
	console.log(event.target);
	console.log($(e.target).parent());
	console.log($(e.target).hasClass("feather-more-horizontal"));
	console.log(this);

	if($(e.target).hasClass("feather-more-horizontal")){
		
	} else {
		$(this).submit();
	}
}

$(document).ready(function() {

	$(".col-sm-6").click(function() {
		$(this).submit();
	});
	
});
