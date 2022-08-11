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
<section class="section">
  <div class="row">
    <div class="col-lg-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">일정 관리</h5>

          <!-- General Form Elements -->
          <form>
            <div class="row mb-3">
              <label for="inputText" class="col-sm-2 col-form-label">일정명</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${schedule.sname}">
              </div>
            </div>
            <div class="row mb-3">
              <label for="inputText" class="col-sm-2 col-form-label">상태</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${schedule.status}">
              </div>
            </div>            
            <div class="row mb-3">
              <label for="inputText" class="col-sm-2 col-form-label">진행도</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${schedule.progress}">
              </div>
            </div>
            <!--
            <div class="row mb-5">
	            <label class="col-sm-2 col-form-label">진행도</label>
	            <div class="col-sm-10">
	              <div>
	                <label for="customRange2" class="form-label">0~100까지 선택</label>
	                <input type="range" class="form-range" min="0" max="100" step="1" id="customRange2">
	              </div>
	            </div>
            </div>
            -->            
            <div class="row mb-3">
	            <label for="inputDate" class="col-sm-2 col-form-label">시작일</label>
	            <div class="col-sm-10">
	              <input type="date" class="form-control" value="${schedule.startDate}">
	            </div>
            </div>         
            <div class="row mb-3">
	            <label for="inputDate" class="col-sm-2 col-form-label">마감일</label>
	            <div class="col-sm-10">
	              <input type="date" class="form-control" value="${schedule.endDate}">
	            </div>
            </div>               
            <div class="row mb-3">
              <label for="inputText" class="col-sm-2 col-form-label">예산</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="${schedule.budget}">
              </div>
            </div>
			<div class="row mb-3">
				<div class="col-sm-10">
				  <button type="button" onclick="regSchedule()" class="btn btn-success">등록</button>
				  <button type="button" onclick="uptSchedule()" class="btn btn-primary">수정</button>
				  <button type="button" onclick="delSchedule(${schedule.sno})" class="btn btn-danger">삭제</button>
				</div>
			</div>
           </form>
           </div>
		</div>
		</div>
	</div>
</section>

<script type="text/javascript">
function uptSchedule(){	
	if(confirm("수정하시겠습니까?")){
		$("form").attr("action","${path}/uptSchedule.do");
		$("form").submit();
	}
}
function delSchedule(){
	if(confirm("삭제하시겠습니까?")){
		$("form").attr("action","${path}/delSchedule.do");
		$("form").submit();
	}
}
var proc = "${proc}";
if(proc=="upt"){
	alert("수정성공!\n일정목록으로 이동합니다");
	location.href="${path}/goSchedule.do";
}
if(proc=="del"){
	alert("삭제성공!\n일정목록으로 이동합니다");
	location.href="${path}/goSchedule.do";
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