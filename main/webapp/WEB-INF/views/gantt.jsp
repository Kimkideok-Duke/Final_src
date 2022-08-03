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
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	function SetValue(this){
	range_val.value = this.value;
	}
	$("#frm01 [name=title]").val(event.title)
	$("#frm01 [name=startdate]").val(event.startdate)
	$("#frm01 [name=enddate]").val(event.enddate)
	$("#frm01 [name=progress]").val(event.progress)
</script>
</head>
<%@ include file="/WEB-INF/views/Modal.html" %>
<body>
<jsp:include page="navi.jsp"/>

	  <h1>간트차트
	     <a class="btn-open-popup">
           <i class="bi bi-plus-circle-fill"></i>
         </a>
	  </h1>
	   <div class="box"></div>
		<div class="gantt-target">
		 <div class="modal">
      	  <div class="modal_body">
      	  <form id="frm01"  method="post">
      	  <h1 style="text-align: center">일정추가</h1>
      	  <div class="box">일정명 <input type="text" name="title" class="form-control"style="width:300px"></div>
      	  <div class="box">시작일 <input type="date" name="startdate" class="form-control" style="width:300px"></div>
      	  <div class="box">마감일 <input type="date" name="enddate" class="form-control" style="width:300px"></div><br>
      	  <div class="box_1">
      	   진행도 <input type="range" name="progress" class="form-range" id="customRange1" value="0" min="0" max="100" style="width:220px"
      	   oninput="document.getElementById('value1').innerHTML=this.value;">
      	   <span id="value1">0</span>%
      	   </div>
      	   </form>
      	   <button type="submit" class="btn btn-primary" style="margin:auto; display:block;">등록</button>
      	  </div>
    	 </div>
		</div>
	<script>
	var tasks = [
		{
			start: $("#frm01 [name=startdate]").val(event.startdate),
			end: $("#frm01 [name=enddate]").val(event.enddate),
			name: $("#frm01 [name=title]").val(event.title),
			id: "",
			progress: $("#frm01 [name=progress]").val(event.progress)
		},
		{
			start: '2022-07-15',
			end: '2022-07-20',
			name: '플로우차트',
			id: "Task 1",
			progress:90,
			dependencies: 'Task 2'
		}
	]
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
console.log(gantt_chart);
const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
  modal.classList.toggle('show');

  if (modal.classList.contains('show')) {
    body.style.overflow = 'hidden';
  }
});

modal.addEventListener('click', (event) => {
  if (event.target === modal) {
    modal.classList.toggle('show');

    if (!modal.classList.contains('show')) {
      body.style.overflow = 'auto';
    }
  }
});


</script>

</body>
</html>