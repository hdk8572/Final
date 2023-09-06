<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 모달 -->
<!-- The Modal -->
<div id="myModal" class="modal right fade" aria-labelledby="myModalLabel">
<div class="modal-dialog">
  <!-- Modal content -->
  <div class="modal-content">
  	<div class="modal-header">
  		<span class="close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body">
<!-- 	    <div>
	    	<span class="modal-text"><strong>프로젝트 만들기</strong></span>
	    </div> -->
	    <div class="card">
			<div class="card-header">
				<h5 class="card-title mb-0">프로젝트명 및 설명을 입력해주세요.</h5>
			</div>
			<div class="card-body">
				<input type="text" class="form-control" placeholder="제목을 입력해주세요.">
				<br>
				<textarea class="form-control" rows="2" placeholder="프로젝트에 관한 설명을 입력해주세요.(옵션)"></textarea>
			</div>
		</div>
		<div class="card">
			<div class="card-header">
				<h5 class="card-title mb-0">프로젝트명을 입력해주세요.</h5>

			</div>
			<div class="card-body">
				<input type="date" class="form-date" values="${today}"> ~ <input type="date" class="form-date">
			</div>
		</div>
  	</div>
    <div class="modal-footer">
  		
  	</div>
    
    
  </div>
</div>
</div>
<!-- 모달 -->