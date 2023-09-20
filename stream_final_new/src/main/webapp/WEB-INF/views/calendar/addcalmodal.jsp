<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 모달 -->
<div id="myModal" class="modal ptask " aria-labelledby="myModalLabel">
	<div class="modal-dialog pcal">
		<!-- Modal content -->
		<div class="modal-content pcal">
			<div class="modal-header pcal"></div>
			<div class="modal-body pcal">
				<div class="card">
					<div class="card-body">
					<div class="card-header pcalTitle">
						<h2 class="pcalTitle"><b>일정 작성</b></h2>
					</div>
						<form action="${pageContext.request.contextPath}/insert" method="post">					
						<input type="text" class="form-control title" name="ttitle" placeholder="제목을 입력하세요.">
						<br>
						<input type="hidden" value=sysdate>
						<input type="hidden" name="userid" value="mplsam@kh.co.kr"><!-- kh0002@kh.com -->
						<input type="date" class="form-date" name="sstartDate" required="required"> ~ <input type="date" class="form-date" name="tendDate" required="required"> <!-- s -->
						<br>
						<br>
						
<!-- ATTENUSERID -->
						 <div class="d-flex align-items-center" ><!-- form group -->
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user align-middle me-2">
								  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r= "4"></circle>
								</svg>
							</span>
							    <input type="text" class="form-control" placeholder="Timezone" list="list-timezone" id="clist">
							    	<datalist id="list-timezone">
							            <option>Asia/Aden</option>
							            <option>Asia/Aqtau</option>
							            <option>Asia/Baghdad</option>
							            <option>Asia/Barnaul</option>
							            <option>Asia/Chita</option>
							            <option>Asia/Dhaka</option>
							            <option>Asia/Famagusta</option>
							            <option>Asia/Hong_Kong</option>
							            <option>Asia/Jayapura</option>
							            <option>Asia/Kuala_Lumpur</option>
							            <option>Asia/Jakarta</option>
							        </datalist>
							<div class="form-userid">
								<div class="cal-attenuserid col-lg-1" >${calendar.userid }
									<!-- 사용자목록을 반복 -->
									<c:forEach items="${attendList }" var="caluser">
										<span>${caluser.userid }</span>
									</c:forEach>
								</div>
							</div>
						</div>
						<br>
						<span class="d-flex align-items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin align-middle me-2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
							<input type= "text" class= "form-control place" name="tmember" placeholder= "장소를 입력하세요.">
						</span>
						<br>
					<div>
				
				
					<textarea class="form-control content" name="pcoment" placeholder="내용을 입력해주세요."></textarea>
						<!-- 시큐에디터  위즈윅 -->
						<!-- <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>  -->
						<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> 
						
						<script>
					      ClassicEditor.create(document.querySelector(".form-control.content"), {
					    	  language: "ko"
					      });
					    </script>
					    <!-- ?? -->
					        <script>
						        document.addEventListener('DOMContentLoaded', e => {
						            $('#clist').autocomplete()
						        }, false);
						   </script>
				</div>
						<br>
						<div align="center">
							<button class="btn btn-primary" type="submit">추가</button>
							<button class="btn btn-warning" type="reset">취소</button>
						</div>
						</form>
					</div>
				</div>  <!-- end of card -->
			</div>
			<div class="modal-footer ptask"></div>
		</div>
	</div>
</div>
<!-- 모달 -->