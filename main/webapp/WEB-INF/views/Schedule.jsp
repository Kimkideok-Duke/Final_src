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
		<div class="btn"><button type="button" onclick="regeProc()">등록</button></div>
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
  
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

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