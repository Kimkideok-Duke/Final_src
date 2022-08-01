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
	margin:30px 0 20px 0;
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
   $(document).ready(function(){
   });
</script>
</head>

<body>
<jsp:include page="navi.jsp"/>
	  <h1>간트차트</h1>
	   <div class="box"></div>
		<div class="gantt-target"></div>
	<script>
	var tasks = [
		{
			start: '2022-07-29',
			end: '2022-08-02',
			name: '요구사항정의서',
			id: "Task 3",
			progress: 40
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
	view_mode: 'Month',
	language: 'en'
});
console.log(gantt_chart);
</script>

</body>
</html>