<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.sentences .sentence {
	display: none;
}

.section {
	display: none;
}
</style>
</head>
<body>
	<button class="prevButton">이전</button>
	<button class="nextButton">다음</button>
	<div class="sentences">
		<div class="sentence">첫 번째 문장</div>
		<div class="sentence">두 번째 문장</div>
		<div class="sentence">세 번째 문장</div>
	</div>
	<script>
		let currentIndex = 0;
		showSentence(currentIndex);

		// 이전 버튼 클릭 이벤트 핸들러
		document.querySelector('.prevButton').addEventListener('click',
				function() {
					currentIndex = (currentIndex - 1 + 3) % 3; // 3은 문장의 개수
					showSentence(currentIndex);
				});

		// 다음 버튼 클릭 이벤트 핸들러
		document.querySelector('.nextButton').addEventListener('click',
				function() {
					currentIndex = (currentIndex + 1) % 3; // 3은 문장의 개수
					showSentence(currentIndex);
				});

		// 문장을 표시하는 함수
		function showSentence(index) {
			// 모든 문장을 숨김
			const sentences = document.querySelectorAll('.sentences .sentence');
			sentences.forEach(function(sentence) {
				sentence.style.display = 'none';
			});

			// 현재 인덱스의 문장을 표시
			sentences[index].style.display = 'block';
		}
	</script>
</body>
</html>