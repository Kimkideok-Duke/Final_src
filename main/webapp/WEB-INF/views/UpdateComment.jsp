<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>

</head>

<body>
<jsp:include page="navi.jsp"/>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Comment 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Comment Update</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
              <form id="frm02" name="frm02" action="${path}/commentList.do" enctype="multipart/form-data"
               class="form" method="get">
             <input type="hidden" name="sno" value="${param.sno}"/>
             <input type="hidden" name="pno" value="${param.pno}"/>
             </form>
                                             
                <div class="card">
            <div class="card-body">
              <h5 class="card-title">Comment Update</h5>

              <!-- Floating Labels Form -->
              <form id="frm01" name="frm01"  class="form" method="post"  enctype="multipart/form-data"
              action="${path}/commentList.do">
              
              <input type="hidden" name="cno" value="${comment.cno}">
              
                <div class="col-md-12">                  
                   <input type="text" class="form-control" value="${comment.writer}" disabled>
                </div>
                
                <div class="input-group mb-3">         
                      <span class="input-group-text">업로드된 파일</span>
                     <input type="text" class="form-control" value="${comment.fname}" aria-label="Server" readonly>
                </div>
                
                 
                <div class="col-12">
                  <div class="form-floating" style="padding-bottom:30px">
                    <textarea class="form-control" id="content" name="content" style="height: 180px;">${comment.content}</textarea>
                    <label for="floatingTextarea">수정할 내용을 입력해 주세요...</label>
                  </div>
                </div>
                
                
                <div class="text-center">
                  <button type="button" class="btn btn-primary" style="padding:8px 25px 8px 25px"
                   onclick="goUpdate()">수정</button>
                  <button type="button" class="btn btn-secondary" style="padding:8px 25px 8px 25px"
                   onclick="goList()">취소</button>
                </div>
              </form><!-- End floating Labels Form -->
              

</div>
</div>

  </main><!-- End #main -->

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
  <script src="NiceAdmin/assets/js/main.js">
  </script>

<script type="text/javascript">	
	function goList(){
	location.href="${path}/commentList.do?sno="+"${param.sno}"+"&pno="+"${param.pno}";
	}
	
	function goUpdate(){
			if(confirm("수정하시겠습니까?")){
				var contentVal = $("[name=content]").val();
				$("[name=frm01]").attr("action","${path}/commUpdate.do?sno="+"${param.sno}"+"&pno="+"${param.pno}");
				$("[name=frm01]").submit();
			}
	}
	var upt = "${upt}"
	if(upt=="Y"){
		if(confirm("수정완료!!\n 조회화면으로 이동!")){
			$("#frm02").submit();
		}
	}

</script>


</body>

</html>