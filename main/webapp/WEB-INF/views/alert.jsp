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
  <style>
#card{
	text-align: center;
}
.box{
	margin:30px 0 20px 0;
}
.card-foot{
	display: block;
   	width: 100%;
    height: 5%;
    position: absolute;  
    bottom: 3%;
    left: 0;
}
</style>

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
</script>
</head>
<body>
<jsp:include page="navi.jsp"/>

	<%-- main태그 안에 body 코드 작성 --%>
  <main id="main" class="main">
    <div class="pagetitle">
	  <h1>Notification<%--페이지 제목 입력 --%></h1>

      <nav> <%-- 페이지 경로 --%>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${path}/entire.do">Main</a></li>
          <li class="breadcrumb-item active">Notification</li>
        </ol>
      </nav>
    </div>
	<div class="box"></div>
	    <div class="card" id="card" style="margin-left: auto; margin-right: auto; width:70%; height:100vh;padding:3%"">
	      <div class="card-body">
	        <table class="table" style="margin-left: auto; margin-right: auto; width:90%;">
	          <thead>
	            <tr>
	              <th scope="col">프로젝트</th>
	              <th scope="col">일정</th>
	              <th scope="col">알림내용</th>
	            </tr>
	          </thead>
	          <tbody>
	          <c:forEach var="art" items="${art}">
	            <tr>
	            	<!-- 프로젝트명 -->
	              <td>${art.title}</td>
	              <!-- 일정명 -->
	              <td>${art.sname}</td>
	              <!-- 마감 며칠전입니다.-->
	              <c:choose>
					<c:when test="${art.dday > 0}">
						<td>마감기한 ${art.dday}일전 입니다.</td>
					</c:when>
					<c:when test="${art.dday == 0}">
						<td style="color:red">마감 당일 입니다.</td>
					</c:when>
					<c:otherwise>
						<td style="color:red">마감기한이 ${art.dday-(art.dday*2)}일 지났습니다.</td>
					</c:otherwise>
				</c:choose>
	            </tr>
	           </c:forEach> 
	          </tbody>
	        </table>
	      <div class="card-foot">
	     <!--
            <nav aria-label="Page navigation example">
              <ul class="pagination" style=" justify-content : center;">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
              </ul>
            </nav>
            -->
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