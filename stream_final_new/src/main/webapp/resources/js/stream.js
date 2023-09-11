 
$(document).ready(function() {
	// a href 대신 button 없이 form 태그 클릭으로 데이터전달
	$(".frm.select").click(function(){
		//메소드지정
		//$(this).attr("method","post");
		$(this).submit();
	});
	
	$(".btn.btn-warning").click(function(){
		$(this);
	});

});




