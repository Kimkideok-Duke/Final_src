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
  <!-- padding: 16px 32px; -->
  <style>
  .insertBtn {
  border: none;
  background: #0D6EFD; 
  border-radius : 30px;
  font-weight: bold;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 15px;
  padding: 5px 10px;
  margin-bottom: 20px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.insertBtn:hover {
  background-color: #dee2e6;
  color: #0D6EFD;
  font-weight: bold;
}

.HV:hover{
background-color: #f2f2f2;
}  
  </style>
</head>

<body>
<jsp:include page="navi.jsp"/>
 

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Comment List</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Comment</li>
        </ol>
      </nav>
    </div>
    <section class="section dashboard">
        <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

		
          <div class="card-body pb-0">
          <h5 class="card-title">${title} <span>| ${sname }</span></h5>
	    <form name="form" id="form" action="${path}/commInsertForm.do" method="post">
			<input type="hidden" name="sno" value="${param.sno}"/>
	    	<button type="submit" class="insertBtn">comment 등록</button>
	    </form>
                  <table class="table table-borderless datatable">
                    <thead style="text-align:center">
                      <tr>
                        <th scope="col">NO.</th>
                        <th scope="col">내용</th>
                        <th scope="col">작성자</th>                       
                        <th scope="col">등록일</th>
                        <th scope="col">수정일</th>
                      </tr>
                    </thead>
                    
                     <% int cnt=0; %>
                    <c:forEach var="l" items="${clist}">                 
                    <tbody class="HV">
                      <tr ondblclick="goDetail(${l.cno})" >
                      <td><%=cnt+=1 %></td>
                      <td>${l.content}</td>
                      <td>${l.writer}</td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${l.regdte}"/></td>
                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${l.updte}"/></td>
                      </tr>
                    </tbody>
                    </c:forEach>
                  </table>
                 </div>

              </div>
            </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
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
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
	function goInsert(){
		$("form").submit();	
	}
	
	function goDetail(cno){
		location.href="${path}/commDetail.do?cno="+cno;
	}	
	
</script>
</body>

</html>