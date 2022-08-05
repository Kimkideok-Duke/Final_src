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
<title>일정 관리</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   
      <%-- 
      
      --%>   
   });
	function goMain(){
		location.href="${path}/Main.do"
	}
	

</script>
</head>

<body>
      <h2>일정 관리</h2>
<div>
	<form method="post">
		<input type="hidden" name="itemno" value=""/>
		<input type="hidden" name="pno" value=""/>
		<div class="input">진행도 <input name="progress"></div>
		<div class="input">마감일 <input type="date" name="deadline_s" value="" /> </div>
		<div class="input">댓글 <input name="comm" value=""/></div>
		<div class="input"><input type="hidden" name="auth" value=""/></div>
		<div class="btn"><button type="button" onclick="updateProc()">수정</button></div>
		<div class="btn"><button type="button" onclick="deleteProc()">삭제</button></div>
		<div class="btn"><button type="button" onclick="goMain()">메인화면</button></div>
	</form>
</div>
<script type="text/javascript">
function updateProc(){
	if(confirm("수정하시겠습니까?")){
		$("form").attr("action","${path}/updateSchedule.do");
		$("form").submit();
	}
}
function deleteProc(){
	if(confirm("삭제하시겠습니까?")){
		$("form").attr("action","${path}/deleteSchedule.do");
		$("form").submit();
	}
}
var proc = "${proc}";
if(proc=="upt"){
	alert("수정성공!\n메인화면으로 이동합니다");
	location.href="${path}/goMain.do";
}
if(proc=="del"){
	alert("삭제성공!\n메인화면으로 이동합니다");
	location.href="${path}/goMain.do";
}
</script>     

</body>
</html>