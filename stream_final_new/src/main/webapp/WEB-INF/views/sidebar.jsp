<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link href="css/app.css" rel="stylesheet">
    
	<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<!-- <a class="sidebar-brand" href="index.html"> -->
          <span class="align-brand-middle"><a href="projectlist" class="sidebar-brand-new">AdminKit</a></span>
        		<!-- </a> -->

				<ul class="sidebar-nav">
					<li class="sidebar-item active">
						<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">내 프로젝트</span>
            </a>
					</li>

					<li class="sidebar-header">
						모아보기
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="maintask">
              <i class="align-middle" data-feather="square"></i> <span class="align-middle">전체업무</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="pcallist">
              <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">캘린더</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="ui-cards.html">
              <i class="align-middle" data-feather="grid"></i> <span class="align-middle">파일함</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="ui-typography.html">
              <i class="align-middle" data-feather="align-left"></i> <span class="align-middle">내 게시물</span>
            </a>
					</li>
					
										<li class="sidebar-item">
						<a class="sidebar-link" href="ui-typography.html">
              <i class="align-middle" data-feather="align-left"></i> <span class="align-middle">직원 초대</span>
            </a>
					</li>
				</ul>
		</div>
	</nav>
	
	<script>
	$(document).ready(function() {
		  $(".sidebar-link").mouseover(function() {
		    $(this).css({
		      "background-color": "#009b77",
		    });
		    $(this).find("span").css({
		      "color": "white"	
		    });
		    $(this).find("svg").css({
		      "color": "white"	
		    });
		  }).mouseout(function() {
		    $(this).css({
		      "background-color": "white",
		    });
		    $(this).find("span").css({
		      "color": "#009b77"	
		    });
		    $(this).find("svg").css({
		      "color": "#009b77"	
	    });
	  });
		  
	});
	</script>