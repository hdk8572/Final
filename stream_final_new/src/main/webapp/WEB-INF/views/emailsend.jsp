<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-email">
		<form action="/stream/send" method="post">
			<div class="standard-rectangle">
				<label>수신자</label> <input type="text" name="to">
			</div>
			<div class="standard-rectangle">
				<label>메일 제목</label> <input type="text" name="subject">
			</div>
			<div class="standard-rectangle">
				<label>본문</label>
				<textarea rows="8" cols="60" name="text"></textarea>
			</div>
			<div class="standard-rectangle">
				<label>발신자</label> <input type="text" name="from">
			</div>
			<div>
				<input type="submit" class="submit" value="Submit">
			</div>
		</form>
	</div>
</body>
</html>