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

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
      
		--%>   
	});
	var auth = "<%= (String)session.getAttribute("auth") %>"
	if(auth != "pm" && auth != "admin"){
		alert("접근이 불가한 페이지입니다.")
		location.href="${path}/entire.do"
	}
</script>
</head>
<body>
<jsp:include page="navi.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
	  <h1>Project Management</h1>

      <nav> <%-- 페이지 경로 --%>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${path}/entire.do">Main</a></li>
          <li class="breadcrumb-item">Manager</li>
          <li class="breadcrumb-item active">Project Management</li>
        </ol>
      </nav>
    </div>
    <div class="col-lg-10">
         <div class="card">
            <div class="card-body">
              <h5 class="card-title">프로젝트 등록</h5>

              <!-- Floating Labels Form -->
              <form class="row g-3 needs-validation" novalidate>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name" required>
                    <label for="floatingName">프로젝트명</label>
	                  <div class="invalid-feedback">
	                    필수 입력정보 입니다.
	                  </div>
                  </div>

                </div>
                <div class="col-md-6">
                  <div class="form-floating">
                    <input type="email" class="form-control" id="floatingEmail" placeholder="Your Email" required>
                    <label for="floatingEmail">담당자 번호</label>
	                  <div class="invalid-feedback">
	                    필수 입력정보 입니다.
	                  </div>
                  </div>
                </div>
                
                <div class="col-sm-5">
                	<label for="ptype" class="form-label">프로젝트 유형</label>
                  <div class="col">
                    <select name="ptype" class="form-select" aria-label="Default select example">
                      <option selected>프로젝트 유형</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                    </select>
                  </div>
                </div>
                
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">신규 프로젝트 등록</button>
                </div>
              </form><!-- End floating Labels Form -->

            </div>
          </div>
	</div>

    <div class="col-lg-12">

		<div class="card">
            <div class="card-body">
              <h5 class="card-title">전체 프로젝트 현황</h5>

			  <form class="row g-3" name="schUserForm">
                <div class="col-md-6">
                  <label for="inputPname" class="form-label">프로젝트명</label>
                  <input type="text" class="form-control" id="inputPname">
                </div>
              </form>

              <!-- Table with hoverable rows -->
              <table class="table table-hover">
			      <col width="10%">
			      <col width="40%">
			      <col width="20%">
			      <col width="30%">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">프로젝트명</th>
                    <th scope="col">진행도</th>
                    <th scope="col">담당자</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>@</td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->

            </div>
          </div>
    </div>
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