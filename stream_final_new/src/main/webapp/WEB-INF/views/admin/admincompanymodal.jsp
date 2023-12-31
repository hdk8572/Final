<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 모달 -->
<!-- The Modal -->
<div id="detailCompanyModal" class="modal project right fade"	aria-labelledby="myModalLabel">
	<div class="modal-dialog addProject">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body">
				<div class="wrap-card">
					<div class="card-bodye">
						<div class="card-header">
							<div>
								<h2><b>회사 상세 조회</b></h2>
							</div>
							<hr>
							<div class="jm-find-cname">
								<h3 class="admin-result-cname"></h3>
							</div>
						</div>
						<div class="card-body">
							<div class="jm-companydetail">
								<ul>
									<li class="col-lg-3 admin-cen admin-deptname">
										<div><span>부서명</span></div>
									</li>
									<li class="col-lg-3 admin-cen admin-usercount">
										<div><span>사원수</span></div>
									</li>
									<li class="col-lg-3 admin-cen admin-projectcount">
										<div><span>프로젝트수</span></div>
									</li>
									<li class="col-lg-3 admin-cen admin-taskcount">
										<div><span>업무수</span></div>
									</li>
								</ul>
							</div>
							<div class="jm-companydetail admin-result">
							</div>
							<br><br>
							<div class="admin-chart-pie">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 모달 -->