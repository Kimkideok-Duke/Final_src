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
<script type="text/javascript">
  	var isAddPrj = '${isAddPrj}'
  	if(isAddPrj == "Y"){
  		location.href="${path}/entireDashboard.do"
  	}
</script>
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
                    <div class="list-group">
                    	<a href="${path}/goMain.do?pno=${myP.pno}" class="list-group-item list-group-item-action">
                    		<h2 class="mb-1">${myP.title}</h2>
							<div class="progress">
			                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ${myP.progAvg}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${myP.progAvg}%</div>
			              	</div>
		              	</a>
	              	</div>
	              	</c:forEach>
              	</c:if>
	              	<c:if test="${empty myPlist}">
	              		<h6>참가중인 프로젝트가 없습니다.</h6>
	              	</c:if>
                  </div>
                  <c:if test="${auth eq 'admin'}">
	                  <div class="text-center"> 
	                  	<button type="button" class="btn btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#verticalycentered">프로젝트 등록</button>
	                  </div>
	              </c:if>
	              <c:if test="${auth eq 'pm'}">
	                  <div class="text-center"> 
	                  	<button type="button" class="btn btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#verticalycentered">프로젝트 등록</button>
	                  </div>
	              </c:if>
                </div>
              </div>
              
              
	     <div class="modal fade" id="verticalycentered" tabindex="-1">
	       <div class="modal-dialog modal-dialog-centered">
	         <div class="modal-content">
	           <div class="modal-header">
	             <h5 class="modal-title">프로젝트 등록</h5>
	             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	           </div>
	           <br>
	           <div class="modal-body">
				 <form class="row g-3 needs-validation" action="${path}/addProject.do" novalidate>
				 	<div class="row mb-3">
	                  <label class="col-sm-2 col-form-label">PM번호</label>
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" name="pmno" value="${userno}" readonly>
	                  </div>
	               	</div>
	                <div class="col-md-6">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" name="title" placeholder="프로젝트명" required>
	                    <label for="floatingName">프로젝트명</label>
		                  <div class="invalid-feedback">
		                    필수 입력정보 입니다.
		                  </div>
	                  </div>
	                </div>
	                <div class="col-sm-4">
	                  <div class="form-floating mb-3">
	                    <select name="dept" class="form-select" id="floatingDept" aria-label="Dept">
	                      <option value="개발">개발</option>
	                      <option value="본부">본부</option>
	                      <option value="영업">영업</option>
	                      <option value="인사">인사</option>
	                    </select>
	                    <label for="floatingDept">부서</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary">신규 프로젝트 등록</button>
	                </div>
	              </form>			  
	           </div>
	         </div>
	       </div>
	     </div>
         
        
		<script>
			$(document).ready(function(){
				
			});
		</script>
		
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

				
                <div class="card-body">
                  <c:if test="${auth eq 'user'}">
                  <h5 class="card-title">내 업무목록</h5>
                  </c:if>
                  <c:if test="${auth eq 'pm'}">
                  <h5 class="card-title">관리 업무목록</h5>
                  </c:if>
                  <table class="table table-borderless datatable" >
                    <thead>
                      <tr>
                        <th scope="col">번호</th>
                        <th scope="col">프로젝트명</th>
                        <th scope="col">일정명</th>
                        <th scope="col">상태</th>
                        <th scope="col">마감일</th>
                        <th scope="col">진행도</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${auth eq 'user'}">
                    <c:if test="${not empty mySlist}">
                    <%int cnt=1; %>
                    <c:forEach var="myS" items="${mySlist}">
                      <tr ondblclick="goMain(${myS.pno})">
                        <th scope="row"><%=cnt++ %></th>
                        <td>${myS.title}</td>
                        <td>${myS.sname}</td>
                        <td>
                        <c:if test="${myS.status eq '진행중'}">
                        	<span class="badge bg-primary">${myS.status}</span>
                        </c:if>
                        <c:if test="${myS.status eq '완료'}">
                        	<span class="badge bg-success">${myS.status}</span>
                        </c:if>
                        <c:if test="${myS.status eq '막힘'}">
                        	<span class="badge bg-danger">${myS.status}</span>
                        </c:if>
                        </td>
                        <td><fmt:formatDate value="${myS.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
	                        <div class="progress">
		                		<div class="progress-bar bg-success" role="progressbar" style="width: ${myS.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
		              		</div>
	              		</td>
                      </tr>
                      </c:forEach>
                    </c:if>
                    <c:if test="${empty mySlist}">
                    	<tr><td></td><td></td><td align="center">업무 목록이 없습니다.</td></tr>
                    </c:if>
                    </c:if>
                    
                    <c:if test="${auth eq 'pm'}">
                    <c:if test="${not empty pmSlist}">
                    <%int cnt=1; %>
                    <c:forEach var="pmS" items="${pmSlist}">
                      <tr ondblclick="goMain(${pmS.pno})">
                        <th scope="row"><%=cnt++ %></th>
                        <td>${pmS.title}</td>
                        <td>${pmS.sname}</td>
                        <td>
                        <c:if test="${pmS.status eq '진행중'}">
                        	<span class="badge bg-primary">${pmS.status}</span>
                        </c:if>
                        <c:if test="${pmS.status eq '완료'}">
                        	<span class="badge bg-success">${pmS.status}</span>
                        </c:if>
                        <c:if test="${pmS.status eq '막힘'}">
                        	<span class="badge bg-danger">${pmS.status}</span>
                        </c:if>
                        </td>
                        <td><fmt:formatDate value="${pmS.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
	                        <div class="progress">
		                		<div class="progress-bar bg-success" role="progressbar" style="width: ${pmS.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
		              		</div>
	              		</td>
                      </tr>
                      </c:forEach>
                    </c:if>
                    <c:if test="${empty pmSlist}">
                    	<tr><td></td><td></td><td align="center">업무 목록이 없습니다.</td></tr>
                    </c:if>
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