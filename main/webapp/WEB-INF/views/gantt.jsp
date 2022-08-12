<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>PMS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="NiceAdmin/assets/img/favicon.png" rel="icon">
  <link href="NiceAdmin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="NiceAdmin/assets/css/style.css" rel="stylesheet">
  <style>
	body {
		font-family: sans-serif;
		background: #ccc;
	}
	.container {
		width: 80%;
		margin: 0 auto;
	}
	/* custom class */
	.gantt .bar-milestone .bar {
		fill: tomato;
	}
	.box{
	margin:20px 0 20px 0;
	}
	.box_1{
	margin:0 0 30px 0;
	}
</style>
<link rel="stylesheet" href="gantt-master/gantt-master/dist/frappe-gantt.css" />
<script src="gantt-master/gantt-master/dist/frappe-gantt.js"></script>
  

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	var task = new Vue({
		el:".gantt-target",
		data:{start:"",end:"",name:"",progress:"",
			ganttList:[] // 검색된 리스트데이터
		}
	});	

	function SetValue(this){
	range_val.value = this.value;
	}
	var tasks = [
		{
			start: {{gantt.start}},
			end: {{gantt.end}},
			name: {{gantt.name}},
			progress:{{gantt.progress}}
		}
	]
</script>

</head>
<body>
<jsp:include page="navi.jsp"/>

	<%-- main태그 안에 body 코드 작성 --%>
  <main id="main" class="main">
    <div class="pagetitle">
	  <h1>간트차트<%--페이지 제목 입력 --%>
	  <a data-bs-toggle="modal" data-bs-target="#basicModal">
           <i class="bi bi-plus-circle-fill"></i>
      </a>
	  </h1>

      <nav> <%-- 페이지 경로 --%>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${path}/entire.do">Main</a></li>
          <li class="breadcrumb-item active">간트차트<li>
        </ol>
      </nav>
    </div>
	  <div class="box"></div>
		<div class="gantt-target">
          <div class="modal fade" id="basicModal" tabindex="-1">
              <div class="modal-dialog">
                 <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">일정추가</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
			      	  <div class="box">일정명 <input type="text" name="title" class="form-control"style="width:300px"></div>
			      	  <div class="box">시작일 <input type="date" name="startDate" class="form-control" style="width:300px"></div>
			      	  <div class="box">마감일 <input type="date" name="endDate" class="form-control" style="width:300px"></div>
			      	  <div class="box">예산 <input type="text" name="budget" class="form-control" style="width:300px"></div>			      	  <div class="box_1">
			      	  <!--
			      	   진행도 <input type="range" name="progress" class="form-range" id="customRange1" value="0" min="0" max="100" style="width:220px"
			      	   oninput="document.getElementById('value1').innerHTML=this.value;">
			      	   <span id="value1">0</span>%
			      	    -->
                     </div>
                    <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" style="margin:auto; display:block;">등록</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->
      	  </div>
    	</div>
    	<div class="chart-controls">
		    <p>Change Chart Timescale</p>
		    <div class="button-cont">
		        <button id="day-btn">
		            Day
		        </button>
		
		        <button id="week-btn">
		            Week
		        </button>
		
		        <button id="month-btn">
		            Month
		        </button>
		    </div>
		</div>
	<script>
document.querySelector(".chart-controls #day-btn").addEventListener("click", () => {
    ganttChart.change_view_mode("Day");
})
document.querySelector(".chart-controls #week-btn").addEventListener("click", () => {
    ganttChart.change_view_mode("Week");
})
document.querySelector(".chart-controls #month-btn").addEventListener("click", () => {
    ganttChart.change_view_mode("Month");
})	
var gantt_chart = new Gantt(".gantt-target", tasks, {
	on_click: function (task) {
		console.log(task);
	},
	on_date_change: function(task, start, end) {
		console.log(task, start, end);
	},
	on_progress_change: function(task, progress) {
		console.log(task, progress);
	},
	on_view_change: function(mode) {
		console.log(mode);
	},
	view_mode: 'Day',
	language: 'en'
});
var gantt = new Gantt('#gantt', tasks, {
	// can be a function that returns html
	// or a simple html string
	custom_popup_html: function(task) {
	  // the task object will contain the updated
	  // dates and progress value
	  const end_date = task._end.format('MMM D');
	  return `
		<div class="details-container">
		  <h5>${task.name}</h5>
		  <p>Expected to finish by ${end_date}</p>
		  <p>${task.progress}% completed!</p>
		</div>
	  `;
	}
});	
	gantt.change_view_mode('Week')
console.log(gantt_chart);
	</script>

</main>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="NiceAdmin/assets/vendor/chart.js/chart.min.js"></script>
  <script src="NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="NiceAdmin/assets/vendor/quill/quill.min.js"></script>
  <script src="NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="NiceAdmin/assets/js/main.js"></script>
</body>
</html>