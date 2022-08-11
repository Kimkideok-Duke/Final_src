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
      <div class="col-12">
        <div class="card recent-sales overflow-auto">

          <div class="filter">
            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
              <li class="dropdown-header text-start">
                <h6>Filter</h6>
              </li>

              <li><a class="dropdown-item" href="#">Today</a></li>
              <li><a class="dropdown-item" href="#">This Month</a></li>
              <li><a class="dropdown-item" href="#">This Year</a></li>
            </ul>
          </div>

          <div class="card-body">
            <h5 class="card-title">일정 목록 <span>| </span></h5>

            <table class="table table-borderless datatable">
            <thead>
              	<tr>
           	    <th scope="col">번호</th>
				<th scope="col">일정명</th>
				<th scope="col">상태</th>
				<th scope="col">진행도</th>
				<th scope="col">시작일</th>
				<th scope="col">마감일</th>
				<th scope="col">예산${schedule.sname}</th>	
                </tr>
			</thead>
			<tbody>
				<c:forEach var="schedule" items="${slist}">
				<tr data-bs-toggle="modal" data-bs-target="#basicModal">
				<th scope="row">${schedule.sno}</th>
				<td>${schedule.sname}</td>
				<td>${schedule.status}</td>
				<td>${schedule.progress}</td>
				<td>${schedule.startDate}</td>
				<td>${schedule.endDate}</td>
				<td>${schedule.budget}</td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
   		 </div>
	</div>
</div>

<!-- Basic Modal -->
<div class="modal fade" id="basicModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">일정 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  		<form id="uptSchedule" class="row g-3 needs-validation" novalidate>
             <div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">일정명</label>
               <div class="col-sm-10">
                 <input type="text" id="sname" name="sname" class="form-control" value="">
               </div>
             </div>
             <div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">상태</label>
               <div class="col-sm-10">
                 <input type="text" id="status" name="status" class="form-control" value="" >
               </div>
             </div>
             <div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">진행도</label>
               <div class="col-sm-10">
                 <input type="text" id="progress" name="progress" class="form-control" value="" >
               </div>
             </div>
			<div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">시작일</label>
               <div class="col-sm-10">
                 <input type="text" id="startDate" name="startDate" class="form-control" value="" >
               </div>
             </div>
             <div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">마감일</label>
               <div class="col-sm-10">
                 <input type="text" id="endDate" name="endDate" class="form-control" value="" >
               </div>
             </div>
             <div class="row mb-3">
               <label for="inputText" class="col-sm-2 col-form-label">예산</label>
               <div class="col-sm-10">
                 <input type="text" id="budget" name="budget" class="form-control" value="${schedule.budget }" >
               </div>
             </div>
             <button type="button" id="uptBtn" class="btn btn-primary">수정</button>
              </form>
           </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div><!-- End Basic Modal-->

<script type="text/javascript">
$("#basicModal").click(function(){
	var sno = $("#sno").val()
	$.ajax({
		url:"${path}/scheduleModal.do",
		data:"sno="sno,
		dataType:"json",
		success:function(data){
			console.log(data)
			var schedule = data.schedule
			$('input[name=sname]').attr('value',schedule.sname);
			$('input[name=status]').attr('value',schedule.status);
			$('input[name=progress]').attr('value',schedule.progress);
			$('input[name=startDate]').attr('value',schedule.startDate);
			$('input[name=endDate]').attr('value',schedule.endDate);
			$('input[name=budget]').attr('value',schedule.budget);
			$("#sno").html(addHTML)
		}
	});
	
});
function clickBtn(btn){
	var value = $(btn).val()
	$.ajax({
		url:"${path}/scheduleModal.do",
		data:"userno="+value,
		dataType:"json",
		success:function(data){
			var uVal = data.uptModalInfo
			$("#uptName").val(uVal.name)
			$("#uptDept").val(uVal.dept)
			$("#uptPosition").val(uVal.position)
			$('#uptAuth').val(uVal.auth).prop("selected",true)
			$("#uptUserno").val(value)
		}
	})
}
function uptModal(){
	
}

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