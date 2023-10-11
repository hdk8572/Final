<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달 -->
<div id="updatecalmodal" class="modal">
	<div class="modal-dialog pcal">
		<!-- Modal content -->
		<div class="modal-content updatecal">
		<span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
			<div class="modal-header pcal"></div>
				
			<div class="modal-body updatecal">
				<div class="card pcal">
					<div class="card-body pcal">
					<div class="card-header pcalTitle">
						<h2 class="pcalTitle"><b>일정 수정</b></h2>
					</div>
						<form>
							<!-- TODO 일정번호 -->
							<input type="hidden" name="sno" value="${sno}">
							<input type="text" class="form-control title" name="title" id="form-content" placeholder="제목을 입력하세요.">
							
							<!-- 날짜 -->
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
								<input type="date" class="form-date" id="start" name="start" required="required"> ~ <input type="date" class="form-date" id="end" name="end" required="required"> <!-- s -->
							 <!-- 작성자&참석자 -->
							 <div class="d-flex align-items-center" id="form-content">
								<div>
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle></svg>
								</div>
								<!-- 작성자 -->
									<input class="form-control userid" type="text" name="userid" value="${principal.username }" readonly>
								<!-- 참가자TODO -->
								<div class="form-userid" id="form-content" >
								</div>
							</div>
							<!-- 지도 -->
							<div>
								<div id="splace"></div>
								<%@ include file="/WEB-INF/views/kakaomap.jsp"%>	
							</div>
							<!-- 내용 -->
							<div id="form-content">
								<textarea class="form-control detail-content" id="csummernote" rows="5" name="smemo" placeholder="프로젝트에 관한 설명을 입력해주세요"></textarea>
						    </div>
							<div align="center">
								<button type="submit" class="btn btn-primary" >등록</button>
								<button  type="reset" class="btn btn-warning">취소</button>
							</div>
						</form>
					</div>
				</div>  <!-- end of card -->
			</div>
			<div class="modal-footer ptask"></div>
		</div>
	</div>
</div>

