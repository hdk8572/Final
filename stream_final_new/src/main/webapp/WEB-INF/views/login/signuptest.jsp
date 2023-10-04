<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>테이블 행 추가 및 삭제 예제</title>
<script>
	var rowCount = 0; // 행 번호 초기화

	// 행 추가 함수
	function addRow() {
		var table = document.getElementById("data-table");
		var row = table.insertRow(-1); // 마지막에 행 추가

		// 입력 값 추가
		var inputField = document.getElementById("input-value");
		var value = inputField.value;

		// 행 번호 추가
		var cell1 = row.insertCell(0);
		cell1.innerHTML = rowCount + 1;

		// 값 열에 입력된 값 추가
		var cell2 = row.insertCell(1);
		cell2.innerHTML = value;

		// 삭제 버튼 추가
		var cell3 = row.insertCell(2);
		var deleteButton = document.createElement("button");
		deleteButton.innerHTML = "삭제";
		deleteButton.onclick = function() {
			removeRow(row);
		};
		cell3.appendChild(deleteButton);

		// 입력 필드 리셋
		inputField.value = "";

		// 행 번호 증가
		rowCount++;
	}

	// 행 삭제 함수
	function removeRow(row) {
		var table = document.getElementById("data-table");
		table.deleteRow(row.rowIndex);
		rowCount--; // 행이 삭제될 때 행 번호 감소
	}
</script>
</head>
<body>
	<h1>테이블 행 추가 및 삭제 예제</h1>
	<input type="text" id="input-value" placeholder="값 입력">
	<button onclick="addRow()">행 추가</button>
	<table id="data-table">
		<tr>
			<th>번호</th>
			<th>값</th>
			<th>삭제</th>
		</tr>
	</table>
	<input type="submit" value="제출">
</body>
</html>