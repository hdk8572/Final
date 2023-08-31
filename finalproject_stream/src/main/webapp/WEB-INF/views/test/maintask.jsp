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
			<table border="1">
				<tr>
					<th>업무명</th>
					<th>상태</th>
					<th>담당자</th>
					<th>시작일</th>
					<th>마감일</th>
					<th>등록일</th>
				</tr>
				<tr>
					<td>업무명 입니다</td>
					<td>요청중</td>
					<td>담당자 입니다</td>
					<td>2023-08-31</td>
					<td>2024-08-31</td>
					<td>2023-08-31</td>
				</tr>
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