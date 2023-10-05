<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- 모달 -->
<div id="readScheduleModal" class="modal right fade">
<div class="modal-dialog pcal">
  <!-- Modal content -->
  <div class="modal-content pcal">
  	<div class="modal-header pcal">
  		<div class="read-dropdown-grop">
  			<div class="btn-dropdown-toggle" data-bs-toggle="dropdown">
  				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical me-2"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
  			</div>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#"> 수정</a></li>
					<li><a class="dropdown-item" href="#"> 삭제</a></li>
				</ul>
  		</div>
  		<!-- TODO -->
  		<span class="read-close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
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
						<div id="attenduseridList"></div>
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
		</form>
	</div>
  </div>
    <div class="modal-footer project">
  	</div>
  </div>
</div>


<!-- 모달 -->