<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

<html>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
</head>

<body>

 <jsp:include page="navi.jsp"/>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">
              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">내 프로젝트</h5>
				<c:if test="${not empty myPlist}">
                  <div class="d-flex align-items-center">
                    </div>
                    <c:forEach var="myP" items="${myPlist}">
                    <div class="ps-3">
                      <h6><a class="dropdown-item" href="${path}/goMain.do?pno="+${myP.pno}>${myP.title}</a></h6>
                    </div>
					<div class="progress">
	                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">10%</div>
	              	</div>
	              	</c:forEach>
              	</c:if>
              	<c:if test="${empty myPlist}">
              		<h6>참가중인 프로젝트가 없습니다.</h6>
              	</c:if>
                  </div>
                  
                </div>
              </div>
		<script>
			$(document).ready(function(){
			     if($('.table table-borderless datatable').find('span.badge bg-primary').text()=="완료"){
			    	 $("span.badge bg-primary").attr("class","span.badge bg-success");
			     }
			});
		</script>
            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">


                <div class="card-body">
                  <h5 class="card-title">내 업무목록</h5>
                  <table class="table table-borderless datatable" >
                  <style>
				  th,td {        
				  	text-align: center;
			      }
				  </style>
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">프로젝트명</th>
                        <th scope="col">일정명</th>
                        <th scope="col">진행도</th>
                        <th scope="col">마감일</th>
                        <th scope="col">상태</th>
                        <th scope="col">코멘트</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty mySlist}">
                    <%int cnt=1; %>
                    <c:forEach var="myS" items="${mySlist}">
                      <tr ondblclick="goMain(${myS.pno})">
                        <th scope="row"><%=cnt++ %></th>
                        <td>${myS.title}</td>
                        <td>${myS.sname}</td>
                        <td><span class="badge bg-primary">${myS.status}</span></td>
                        <td><fmt:formatDate value="${myS.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
	                        <div class="progress">
		                		<div class="progress-bar bg-success" role="progressbar" style="width: ${myS.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
		              		</div>
	              		</td>
                        <td><img src="a00_com/images/comment.png" width="30" height="30"/></td>
                      </tr>
                      </c:forEach>
                    </c:if>
                    <c:if test="${empty mySlist}">
                    	<tr><td></td><td></td><td>업무 목록이 없습니다.</td></tr>
                    </c:if>
                    </tbody>
                  </table>
				<script type="text/javascript">
				function goMain(pno){
					location.href="${path}/goMain.do?pno="+pno
				}
				</script>
                </div>

              </div>
            </div>
    </section>

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
  <script src="NiceAdmin/assets/js/main.js"></script>

</body>

</html>