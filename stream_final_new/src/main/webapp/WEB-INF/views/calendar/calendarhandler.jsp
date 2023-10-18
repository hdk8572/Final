<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 달력을 구성  -->
<script>
let calendar;  // 풀캘린더 객체 전체 
let eventClick_defId = 0; // 풀캘린더 클린된 event의 고유 id

function loadCalendarHandler() {
	const calendarEl = document.getElementById('calendar'); //calender라는 id를 가진 요소를 찾아 calendarEl 변수에 할당한다. 이건 fullcalendar를 표시할 컨테이너이다.
	
	//<달력에 표시될 일정을 가져옴>
	// calendar date get from db 
	$.ajax({
		//동기 async : false, 
		url: '${pageContext.request.contextPath}/member/pcalselectlist'	
		,data: { startdate : '2023-09-12', pno: '${pno}', userid:'${principal.username}' } //pcalselectlist로 정보보냄
		,dataType : "json"
		,success: function(result){	//요청이 성공적으로 완료될 때 실행할 콜백 함수를 정의 //console에 정보를 뿌림
				 console.log(result);  // result == event Data Arr //서버에서 반환된 데이터를 담고 있는 매개변수이다.
				 makeFullCalendar(result);	//받은 데이터를 이용하여 makeFullCalendar 함수를 호출한다.
		}
		,error : ( request, status, error) => {
			console.log(request);
			console.log(status);
			console.log(error);
			alert("code:" +request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	function makeFullCalendar ( eventsDataArr ){	//makeFullCalendar 이 함수는 ajax 요청에서 받은 이벤트 데이터 배열 eventDataArr을 인자로 받는다.
		calendar = new FullCalendar.Calendar(calendarEl, {
			height: '900px',  // 캘린더 칸 높이 설정(이거 안하고 more 코드 작성하면 칸 크기가 중구난방임)
	        expandRows: true, // 화면에 맞게 높이 재설정
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			
			titleFormat : function(date) {
				return date.date.year + '년 '
						+ (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator : true, // 현재 시간 마크
			dayMaxEvents : true, // 일정 more 
			//locale: 'ko', // 한국어 설정 
			
			events : eventsDataArr
		 	,
		 	
		 	//공휴일
		 	googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE"
		    , eventSources : [
		    	{
		   			googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
		            , className : "koHolidays"
		            , color : "white"
		            , textColor : "red"
		        }
			],
			
	/* 		eventClick: function(info) {
				var event = info.event;
				if(event.extendedProps.googleCalendarId === 'ko.south_korea#holiday@group.v.calendar.google.com'){
					return; //info.jsEvent.preventDefault();
				}
			},			
		 	/* 일정 상세정보를 띄우겠다.*/
			eventClick: function(info) {
				console.log(info.event.title);
				var event = info.event; //fullcalendar 이벤트 객체의 일부
				
				console.log(info.event.extendedProps.sno); //sno 찍어보기
				/* var abc = $('#sno').val();
				console.log(abc); */
				
				//참가자 list
				var htmlval = ''; //그리고 여기도 sno로 채워짐
				for(var i=0; i<info.event.extendedProps.attenduseridList.length; i++){
					htmlval += '<div>'+info.event.extendedProps.attenduseridList[i].mname+'</div>';
				}
				$("#readcalmodal.modal  #attenduseridList").html(htmlval); //여기서 sno가 들어옴
				
				//TODO 찍어봐라
				console.log("info.event 구분짓는 id는 defId !!!!!!!");
				console.log(info.event.id);  //아무값도 없음.
				console.log(info.event._def.defId);
				eventClick_defId = info.event._def.defId;   // 전역변수 eventClick_defId에 캘린더의 고유 id를 저장해두고.. 수정이나 삭제시 적용
				
				//캘린더 api에 있는 거 말고 내가 추가한 것들은 extendedProps를 써줘야 한다.(api)
				
				$("#readcalmodal.modal  #sno").val(info.event.extendedProps.sno);
				$("#readcalmodal.modal  #title").html(info.event.title); 
				$("#readcalmodal.modal  #userid").html(info.event.extendedProps.userid); 
				$("#readcalmodal.modal  #start").html(info.event.startStr);
				$("#readcalmodal.modal  #end").html(info.event.endStr);
				$("#readcalmodal.modal  #smemo").html(info.event.extendedProps.smemo);
				$("#readcalmodal.modal  #splace").html(info.event.extendedProps.splace);
				$("#readcalmodal").modal("toggle"); 
				console.log(sno);
				
				readshowMap(); //일정상세 지도
			}
		});
		calendar.render();
	}
}
</script>