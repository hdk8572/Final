function detailProject() {
    targetTno = $(this).closest("tr").find("input[name=tno]").val();
    targetPno = $(this).closest("tr").find("input[name=pno]").val();
    $("#detailProjectModal").modal("toggle");
    
    $.ajax({
         url: "${pageContext.request.contextPath}/ptaskselectOne",
         type: "get",
         dataType: "json",
         data: {tno: targetTno, pno: targetPno},
         success: function(result){
             $(".wrap-card .tcontent").html(result.tcontent);
             $(".wrap-card .ttitle").html(result.ttitle);
             $(".wrap-card .tstatus").html(result.tstatus);
             $(".wrap-card .userid").html(result.userid);
             $(".wrap-card .tstartdate").val(result.tstartdate);
             $(".wrap-card .tenddate").val(result.tenddate);
         },
         error: function() {
             console.log("detailProject에서 오류 발생");
         }
    });
}