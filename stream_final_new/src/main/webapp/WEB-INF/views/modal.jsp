<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 모달 -->
<div class="addProject modal right fade" id="myModal">
	<div class="addProject modal-dialog" id="modal-dialog">
		<div class="addProject modal-content">

			<!-- Modal Header -->
			<div class="addProject modal-header">
				<h4 class="addProject modal-title"></h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="addProject modal-body">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">프로젝트 만들기</h5>
					</div>
					<div class="card-body">
						<input type="text" class="form-control" placeholder="제목을 입력해주세요.">
					</div>
					<div class="card-body">
									<textarea class="form-control" rows="2" placeholder="프로젝트에 관한 설명 입력 (옵션)"></textarea>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="addProject modal-footer">
				<button type="button" class="btn btn-primary"
					data-bs-dismiss="modal">추가</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">삭제</button>
			</div>

		</div>
	</div>
</div>
<!-- 모달 -->