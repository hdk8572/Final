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
  		<span class="close" data-bs-dismiss="modal" aria-label="Close">&times;</span>
  	</div>
 	<div class="modal-body">
 		<form id="addProject">
	    	<div class="card">
				<div class="card-header">
					<!-- 작성자 -->
					<div id="userid">${calendar.userid }</div>
				</div>
				<div class="card-body">
					<!-- 제목 -->
					<div id="title"></div>
					<br> 
					<div>
						<input type="date" class="form-date" name="pstartdate" required="required">
						~
						<input type="date" class="form-date" name="penddate" required="required">
					</div>
					<br>
						<!-- 지도 -->
						<!-- 참석자  -->
						<!-- 내용 -->
						<div id="smemo"><p>${calendar.smemo }</p></div>
					<div>
					<br>
						<!-- 댓글 -->
						<ul class="c-comment">
							<li class="c-comment-form">
								<form id="c-commentFrm">
									<h4>댓글쓰기 <span></span></h4>
									<span class="cbox">
										<input type="text" placeholder="댓글 내용을 입력해주세요" class="int" name="c-content">
									</span>
									<input type="submit" class="c-btn" value="등록">
								</form>
							</li>
							<li id="c-comment-list"></li>
						</ul>
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