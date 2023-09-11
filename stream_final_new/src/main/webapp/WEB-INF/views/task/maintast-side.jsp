<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/app.css">

<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<!-- <a class="sidebar-brand" href="index.html"> -->
          <span class="align-brand-middle"><a href="projectlist" class="sidebar-brand-new">AdminKit</a></span>
        		<!-- </a> -->

		<ul class="sidebar-nav">
			<li class="sidebar-item active"><a class="sidebar-link"
				href="index.html"> <i class="align-middle"
					data-feather="sliders"></i> <span class="align-middle">내
						프로젝트</span>
			</a></li>

			<li class="sidebar-header">모아보기</li>

			<li class="sidebar-item jm-side"><i class="align-middle"
				data-feather="square"></i> <span class="align-middle">
					<h5 class="card-title mb-0">상태</h5>
					<div>
						<ul>
							<li><label class="form-check"> <input
									class="form-check-input" type="checkbox" value="option1" checked> <span
									class="form-check-label"> 요청 </span>
							</label></li>
							<li><label class="form-check"> <input
									class="form-check-input" type="checkbox" value="option2" checked> <span
									class="form-check-label"> 진행 </span>
							</label></li>
							<li><label class="form-check"> <input
									class="form-check-input" type="checkbox" value="option3" checked> <span
									class="form-check-label"> 피드백 </span>
							</label></li>
							<li><label class="form-check"> <input
									class="form-check-input" type="checkbox" value="option4" checked> <span
									class="form-check-label"> 완료 </span>
							</label></li>
							<li><label class="form-check"> <input
									class="form-check-input" type="checkbox" value="option5" checked> <span
									class="form-check-label"> 보류 </span>
							</label></li>
						</ul>
					</div>
			</span></li>

			<li class="sidebar-item jm-side"><i class="align-middle"
				data-feather="check-square"></i> <span class="align-middle">
					<h5 class="card-title mb-0">시작일</h5>
					<ul>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1"
								name="tsd" checked> <span
								class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2"
								name="tsd" > <span
								class="form-check-label"> 오늘 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3"
								name="tsd" > <span
								class="form-check-label"> 이번 주 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4"
								name="tsd" > <span
								class="form-check-label"> 이번 달 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option5"
								name="tsd" > <span
								class="form-check-label"> 미정 </span>
						</label></li>
					</ul>
			</span></li>

			<li class="sidebar-item jm-side"><i class="align-middle"
				data-feather="grid"></i> <span class="align-middle">
					<h5 class="card-title mb-0">마감일</h5>
					<ul>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option1"
								name="ted" checked> <span
								class="form-check-label"> 전체 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option2"
								name="ted" > <span
								class="form-check-label"> 지연 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option3"
								name="ted" > <span
								class="form-check-label"> 오늘 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option4"
								name="ted" > <span
								class="form-check-label"> 이번 주 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option5"
								name="ted" > <span
								class="form-check-label"> 이번 달 </span>
						</label></li>
						<li><label class="form-check"> <input
								class="form-check-input" type="radio" value="option6"
								name="ted" > <span
								class="form-check-label"> 미정 </span>
						</label></li>
					</ul>
			</span></li>
		</ul>
	</div>
</nav>