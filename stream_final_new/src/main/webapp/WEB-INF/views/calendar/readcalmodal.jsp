<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<!-- 모달 -->
<!-- The Modal -->
<div id="readScheduleModal" class="modal right fade">
<div class="modal-dialog pcal">
  <!-- Modal content -->
  <div class="modal-content pcal">
  	<div class="modal-header pcal">
  		<div>
  			<button>
  				<svg viewBox="0 0 24 24" focusable="false" height="24" width="24"><path d="M0 0h24v24H0z" fill="none"></path><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg>
 	 		</button>
 	 		<div class="dropdown-menu dropdown-menu-end show" data-bs-popper="none">
				<a class="dropdown-item" href="pages-profile.html"> 수정</a>
				<a class="dropdown-item" href="#"> 삭제</a>
			</div>
  		</div>
  		<!-- TODO -->
  		<!-- <span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span> --> 
  	</div>
 	<div class="modal-body">
 		<form id="addProject">
	    	<div class="card">
				<div class="card-header">
					<!-- 작성자 -->
					<div id="userid"></div> <!-- 여기에 뭐 적으면x -->
				</div>
				<div class="card-body">
					<!-- 제목 -->
					<div class="stitle" id="title"></div>
				
					<div class="d-flex align-items-center" id="form-content">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar align-middle me-2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
						<input type="date" class="form-date" name="start" required="required">
						~
						<input type="date" class="form-date" name="end" required="required">
					</div>
				
						<!-- 지도 -->
						<!-- 참석자  -->
						<!-- 내용 -->
						<div id="smemo"></div>
					<div>
				
						<!-- 댓글 -->
					<div class="cal-comment" >
						<form id="commentFrm">
							<h4>댓글쓰기</h4>
							<div class="comment-box">
								<input type="text" class="form-control comment" placeholder="Input">
								<input type="submit" class="c-btn" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

			<div align="center">
				<button class="btn btn-primary" id="btn-submit" type="button">수정</button><!-- TODO -->
				<button class="btn btn-warning" type="reset">취소</button>
			</div>
			<div>
			
			</div>
		</form>
	</div>
  </div>
    <div class="modal-footer project">
  	</div>
  </div>
</div>


<!-- 모달 -->