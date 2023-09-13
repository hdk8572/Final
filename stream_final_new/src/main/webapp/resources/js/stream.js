function abc (){
	//메소드지정
	//$(this).attr("method","post");
	//$(this).attr("action", "${pageContext.request.contextPath}/ptasklist");
	$(this).submit();
	console.log(this);
}

$(document).ready(function() {

	$(".btn.btn-warning").click(function(){
		$(this);
	});
	
	$(".col-sm-6").click(function() {
		$(this).submit();
	});
	
});
