<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <head>
	<link href="${pageContext.request.contextPath}/css/Modal.css" rel="stylesheet">
</head> --%>

<!-- 모달 -->
<div id="myModal" class="modal ptask " aria-labelledby="myModalLabel">
	<div class="modal-dialog ptask">
		<!-- Modal content -->
		<div class="modal-content ptask">
			<div class="modal-header ptask"></div>
			<div class="modal-body ptask">
				<div class="card">
					<div class="card-body">
					<input type="text" class="form-control title" name="pname" placeholder="제목을 입력하세요.">
					<br> 
					<textarea class="form-control content" rows="5" name="pcoment" placeholder="프로젝트에 관한 설명을 입력해주세요.(옵션)" ></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer ptask"></div>
		</div>
	</div>
</div>
<!-- 모달 -->