<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무 전체보기</title>
</head>
<body>
	<h2>전체 업무</h2>
	<div class="wrap-task">
		<div class="task-form">
			<form action="#">
				<input type="text" placeholder="업무명 또는 업무번호를 검색하세요">
				<input type="submit" value="검색하기">
			</form>
		</div>
		<div class="task-table">
			<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Name</th>
											<th class="d-none d-xl-table-cell">Start Date</th>
											<th class="d-none d-xl-table-cell">End Date</th>
											<th>Status</th>
											<th class="d-none d-md-table-cell">Assignee</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Project Apollo</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										</tr>
										<tr>
											<td>Project Fireball</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-danger">Cancelled</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
										<tr>
											<td>Project Hades</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Sharon Lessman</td>
										</tr>
										<tr>
											<td>Project Nitro</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-warning">In progress</span></td>
											<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										</tr>
										<tr>
											<td>Project Phoenix</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
										<tr>
											<td>Project X</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Sharon Lessman</td>
										</tr>
										<tr>
											<td>Project Romeo</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Christina Mason</td>
										</tr>
										<tr>
											<td>Project Wombat</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-warning">In progress</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
									</tbody>
								</table>
		</div>
	</div>

	<aside>
		<div>
			<ul>
				<li>
					<div>상태</div>
					<div>
						<ul>
							<li><input type="checkbox">요청</li>
							<li><input type="checkbox">진행</li>
							<li><input type="checkbox">피드백</li>
							<li><input type="checkbox">완료</li>
							<li><input type="checkbox">보류</li>
						</ul>
					</div>
				</li>
				
				<li>
					<div>시작일</div>
					<ul>
						<li><input type="radio" name="startdate">전체</li>
						<li><input type="radio" name="startdate">오늘</li>
						<li><input type="radio" name="startdate">이번 주</li>
						<li><input type="radio" name="startdate">이번 달</li>
						<li><input type="radio" name="startdate">미정</li>
					</ul>
				</li>
				<li>
					<div>마감일</div>
					<ul>
						<li><input type="radio" name="enddate">전체</li>
						<li><input type="radio" name="enddate">지연</li>
						<li><input type="radio" name="enddate">오늘</li>
						<li><input type="radio" name="enddate">이번 주</li>
						<li><input type="radio" name="enddate">이번 달</li>
						<li><input type="radio" name="enddate">미정</li>
					</ul>
				</li>
			</ul>
		</div>
	</aside>	
</body>
</html>