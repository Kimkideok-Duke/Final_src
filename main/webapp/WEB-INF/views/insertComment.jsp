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
      <h1>Comment 등록</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Comment Insert</li>
        </ol>
      </nav>
    </div>
                                    
                <div class="card">
            <div class="card-body">
              <h5 class="card-title">Comment Form</h5>

              <!-- Floating Labels Form -->
              <form id="frm01" name="frm01" action="${path}/commInsert.do" enctype="multipart/form-data"
               class="form" method="post">
                <input type="hidden" name="sno" value="${param.sno}"/>
                 <input type="hidden" name="pno" value="${param.pno}"/>
                <div class="col-md-12">                  
                   <input type="text" class="form-control" value="${name}" name="writer" readonly>
                </div>
                
                <div class="col-12">        
                    <input class="form-control" type="file" name="report" id="formFile">
                  </div>
                 
                <div class="col-12">
                  <div class="form-floating" style="padding-bottom:30px">
                    <textarea class="form-control" id="content" name="content" style="height: 180px;"></textarea>
                    <label for="floatingTextarea">공유하고싶은 내용을 입력해주세요...</label>
                  </div>
                </div>
                
                
                <div class="text-center">
                  <button type="button" class="btn btn-primary" style="padding:8px 25px 8px 25px"
                   onclick="insertProc()">등록</button>
                  <button type="button" class="btn btn-secondary" style="padding:8px 25px 8px 25px"
                   onclick="goList()">취소</button>
                </div>
              </form><!-- End floating Labels Form -->
              
              <form id="frm02" name="frm02" action="${path}/commentList.do" enctype="multipart/form-data"
               class="form" method="post">
                <input type="hidden" name="sno" value="${param.sno}"/>
                <input type="hidden" name="pno" value="${param.pno}"/>
                </form>

</div>
</div>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
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
  <script src="NiceAdmin/assets/js/main.js">
  </script>

<script type="text/javascript">
var isInsert = "${isInsert}"
	if(isInsert=="Y"){
		confirm("등록성공했습니다!!")
			// 취소 입력시 조회화면 이동..
		$("#frm02").submit();	
	}
	
	function insertProc(){
		if(confirm("등록하시겠습니까?")){	
			var contentVal = $("[name=content]").val();
			if(contentVal == ""){
				alert("내용을 입력하세요");
				$("[name=content]").focus();
				return;
			}	
		document.querySelector("[name=frm01]").submit();
		}
	}
	
	function goList(sno){
	location.href="${path}/commentList.do?sno="+"${param.sno}"+"&pno="+"${param.pno}";
	}
	
</script>

</body>

</html>