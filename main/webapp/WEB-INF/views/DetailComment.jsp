<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html>

<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>


 <style> 
.HV:hover{
color:red;
text-decoration:underline;
}
 </style>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	
	$("[name=fname]").click(function(){
			var fileVal = $("[name=fname]").val();
			if(fileVal == ""){
				alert("등록된 파일이 없습니다!!");
				$("[name=fname]").focus();
				return;
			}	
		confirm("다운로드하시겠습니까?");
		location.href="${path}/download.do?fname="+$(this).val()
	});
	
});
	
	
</script>

</head>

<body>
<jsp:include page="navi.jsp"/>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Comment Detail</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item">Comment</li>
					<li class="breadcrumb-item active">Detail</li>
				</ol>
			</nav>
		</div>
	
 <section class="section profile">
		<!-- Comment Detail -->
		
		   <div class="card">
            <div class="card-body">       
              <h5 class="card-title" style="font-weight: bold">일정 이름</h5>
		    <form  id="form" action="${path}/commentList.do" method="post">
			<input type="hidden" name="sno" value="${param.sno}"/>
			<input type="hidden" name="pno" value="${param.pno}"/>
			<input type="text" name="sname" value="${sname}"/>			
			<input type="text" name="state" value="댓글삭제"/>
			<input type="text" name="writer" value="${name}"/>
			</form>
	    
		     <div class="row g-3">     
		     <div class="col-md-6">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingEmail"
                    value="<fmt:formatDate pattern="yyyy-MM-dd  |  hh:mm:ss a" value="${comment.regdte}"/>"  readonly>
                    <label for="floatingEmail">등록일</label>
                  </div>
                </div>
                
               <div class="col-md-6">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingPassword"
                    value="<fmt:formatDate pattern="yyyy-MM-dd  |  hh:mm:ss a" value="${comment.updte}"/>"  readonly>
                    <label for="floatingPassword">수정일</label> 
                  </div>
                </div>
                        
     
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName"  value="${name}"  readonly>
                    <label for="floatingName">작성자</label>
                  </div>
                </div>
                
                   <div class="col-md-12">
                  <div class="form-floating">      
                    <input type="text" name="fname" class="form-control HV"  id="floatingName" value="${comment.fname}">
                    <label for="floatingName">첨부파일</label>
                  </div>
                </div>
                
                  <div class="col-md-12">
                    <div class="form-floating">
                      <input type="text" class="form-control" id="floatingCity" 
                      style="height: 100px;" value="${comment.content}" readonly>
                      <label for="floatingCity">내용</label>
                    </div>
                  </div>

                
               <div align="right">
             <div class="btn-group" role="group" aria-label="Basic example">
               <button type="button" class="btn btn-primary" style="padding:6px 30px 6px 30px"
               onclick="goUpdate(${comment.cno})">수정</button>
                <button type="button" class="btn btn-primary" style="padding:6px 30px 6px 30px"
                onclick="goDelete(${comment.cno})">삭제</button>
             </div>
</div>
 
                </div>

				</div>
				</div>

<%-- 
          <div class="card">
            <div class="card-body">       
              <h5 class="card-title" style="font-weight: bold">댓글 List</h5>
		             
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
              <h2>Kevin Anderson</h2>
              <h3>Web Designer</h3>
              <div class="social-links mt-2">
                <h2>안녕</h2>
              </div>
            </div>
            </div>
--%>            
          </div>
        </section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
     
    </div>
    <div class="credits">
     
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
  
<script type="text/javascript">

	function goUpdate(cno){
		if(confirm("수정하시겠습니까?\n수정화면으로 이동!")){
			location.href="${path}/commUpForm.do?cno="+cno+"&sno="+"${param.sno}"+"&pno="+"${param.pno}";
		}
	}
	function goDelete(cno){
		if(confirm("삭제하시겠습니까?")){
			location.href="${path}/commDelete.do?cno="+cno+"&sno="+"${param.sno}"+"&pno="+"${param.pno}";
		}
	}
	
	var proc = "${proc}"
	if(proc=="del"){
		alert("삭제완료!!\n조회화면으로 이동!")
		$("#form").submit();
	}

</script>
</body>

</html>