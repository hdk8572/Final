<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 달력을 구성  -->
<script>
let calendar;  // 풀캘린더 객체 전체 
let eventClick_defId = 0; // 풀캘린더 클린된 event의 고유 id

function loadCalendarHandler() {
	const calendarEl = document.getElementById('calendar'); 
	
	//달력에 표시될 일정을 가져오겠다.
	$.ajax({
		//동기 async : false, 
		 url: '${pageContext.request.contextPath}/member/pcalselectlist' 	
		,data: { startdate : '2023-09-12', pno: '${pno}', userid:'${principal.username}' } 
		,dataType : "json"
		,success: function(result){	
				 console.log(result); 
				 makeFullCalendar(result);	//makeFullCalendar 함수를 호출한다.
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
			height: '900px',  // 캘린더 칸 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay,listWeek'
			},
			
			//initialDate: '2021-07-15', // 초기 날짜 설정
			locale: 'ko', // 한국어 설정 
			selectable : true, 	// 날짜 선택 여부
			droppable : false,	// 외부 이벤트 끌어오기
			editable : true,	// 달력 일자 드래그 설정
			nowIndicator : false, // 현재 시간 
			dayMaxEvents : true, // 일정 more 
			
			events : eventsDataArr,
			
			eventDataTransform: function(event){
				//if(event.allDay){
					event.end = moment(event.end, 'YYYY-MM-DD').add(1, 'days').format('YYYY-MM-DD');
				//}
				return event;
			},
		 	
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
		
		 	/* 일정 상세정보를 띄우겠다.*/
			eventClick: function(info) {
				console.log(info.event.title);
				var event = info.event; //fullcalendar 이벤트 객체의 일부
				
				console.log(info.event.extendedProps.sno);
				
				//참가자 list readcalmodal
				var htmlval = ''; //sno
				for(var i=0; i<info.event.extendedProps.attenduseridList.length; i++){
					htmlval += '<div class="attenduseridItem" data-attenduserid="'+info.event.extendedProps.attenduseridList[i].userid+'">'+info.event.extendedProps.attenduseridList[i].mname+'</div>';
				}
				$("#readcalmodal.modal  #attenduseridList").html(htmlval); //sno
				
				console.log(info.event._def.defId);
				eventClick_defId = info.event._def.defId;     // 전역변수 eventClick_defId에 캘린더의 고유 id를 저장해두고.. 수정이나 삭제시 적용 //선택한 이벤트에 클릭 이벤트 적용
				
				//캘린더 api에 있는 거 말고 내가 추가한 것들은 extendedProps를 써줘야 한다.
				$("#readcalmodal.modal  #sno").val(info.event.extendedProps.sno);
				$("#readcalmodal.modal  #title").html(info.event.title); 
				$("#readcalmodal.modal  #userid").html(info.event.extendedProps.userid); 
				$("#readcalmodal.modal  #start").html(info.event.startStr);
				$("#readcalmodal.modal  #end").html(info.event.endStr, 'YYYY-MM-DD').add(-1, 'days').format('YYYY-MM-DD');
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