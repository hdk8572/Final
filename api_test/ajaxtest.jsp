<script>
	function getMemberProjectListHandler(thisElement){
		console.log("calendar_pno: "+calendar_pno);
		console.log("logined_userid: "+logined_userid);
		$.ajax({
			url:'${pageContext.request.contextPath}/memberProjectList',
			type:"get",
			data : {
				pno : calendar_pno,
				userid : logined_userid
			},
			dataType: "json",
			success: showProjectMemberView,
			error:memberError
		});
	}
	function showProjectMemberView(data){
		console.log(data)
		console.log("성공하였습니다.")
		var listHtml = "";
		for (var i=0; i<data.length; i++){
			var mname = data[i];
			listHtml += `<option value="\${mname.userid}">\${mname.mname}</option>`; //data를 뿌리고 그걸 option에다가 넣어줌 //value=userid
		}
		$("#calmemberlist").html(listHtml);
	}
	function memberError(){
		var listHtml = "";
		listHtml += `<option selected>해당하는 이름이 없습니다.</option>`;
		$("#calmemberlist").html(listHtml);
	}
</script>

function getProjectMemberList(thisElement){
    $.ajax({
        url:contextPath+"/showprojectmemberlist",
        type:"get",
        data : {
            pno :pno,
            userid : userid
        },
        dataType: "json",
        success: showProjectMemberView,
        error:function(request, status, error, data){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}