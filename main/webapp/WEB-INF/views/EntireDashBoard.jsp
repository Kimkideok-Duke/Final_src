<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html>

<html>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Entire DashBoard</title>
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
  	
	$(document).ready(function(){
		$("#selLan").val("${param.lang}")
		$("#selLan").change(function(){
			if($(this).val()!=""){
				$("[name=lang]").val($(this).val())
				$("#selLang").submit();
			}
		});
	});
</script>
 <jsp:include page="navi.jsp"/>

  <main id="main" class="main">
	 <div class="col-lg-4">
    <div class="pagetitle">
     <c:if test="${auth eq 'admin'}">
      <h1><spring:message code="adminDashboard"/></h1>
     </c:if>
     <c:if test="${auth eq 'pm'}">
      <h1><spring:message code="pmDashboard"/></h1>
     </c:if>
     <c:if test="${auth eq 'um'}">
      <h1><spring:message code="umDashboard"/></h1>
     </c:if>
     <c:if test="${auth eq 'user'}">
      <h1><spring:message code="entireDashboard"/></h1>
     </c:if>
     	
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html"><spring:message code="Home"/></a></li>
          <li class="breadcrumb-item active"><spring:message code="Dashboard"/></li>
        </ol>
      </nav>
      </div>
      <select class="selLang" id="selLan">
		<option value="ko"><spring:message code="ko"/></option>
		<option value="en"><spring:message code="en"/></option>
	</select>
	<form id="selLang" class="form-inline" method="post">
		<input type="hidden" name="lang" value=""/>
	</form>
    </div><!-- End Page Title -->
   	
    <section class="section dashboard">
    	<div class="row">
    	<c:if test="${auth eq 'admin'}">
	       <div class="col-lg-4">
	       	 <div class="card">
	            <div class="card-body">
	              <h5 class="card-title"><spring:message code="deptBudget"/></h5>
	
	              <!-- Donut Chart -->
	              <div class="budgetChart" id="donutChart"></div>
	
	              <script>
					
					var deptbudget = []
					var dept = []
					$.ajax({
						url:"${path}/getDeptBudget.do",
						dataType:"json",
						async:false,
						success:function(data){
							var data = data.deptbudget
							$(data).each(function(idx, d){
								deptbudget.push(Number(d.deptbudget))
								dept.push(d.dept)
							})
						}
					})
	                document.addEventListener("DOMContentLoaded", () => {
	                  new ApexCharts(document.querySelector(".budgetChart"), {
	                    series: deptbudget,
	                    chart: {
	                      height: 250,
	                      type: 'donut',
	                      toolbar: {
	                        show: true
	                      }
	                    },
	                    labels: dept,
	                  }).render();
	                });
	              </script>
	              <!-- End Donut Chart -->
	
	            </div>
	          </div>
            </div>
            
            <div class="col-lg-4">
	          <div class="card">
	            <div class="card-body">
	              <h5 class="card-title"><spring:message code="deptprjCnt"/></h5>
	
	              <!-- Bar Chart -->
	              <canvas class="projectCntChart" id="barChart" style="max-height: 183px;"></canvas>
	              <script>
	              	var deptcnt = []
					var cntdept = []
					$.ajax({
						url:"${path}/getDeptCnt.do",
						dataType:"json",
						async:false,
						success:function(data){
							var data = data.deptcnt
							$(data).each(function(idx, d){
								deptcnt.push(Number(d.deptcnt))
								cntdept.push(d.dept)
							})
						}
					})
	                document.addEventListener("DOMContentLoaded", () => {
	                  new Chart(document.querySelector('.projectCntChart'), {
	                    type: 'bar',
	                    data: {
	                      labels: cntdept,
	                      datasets: [{
	                        label: '프로젝트 수',
	                        data: deptcnt,
	                        backgroundColor: [
	                          'rgba(255, 99, 132, 0.2)',
	                          'rgba(255, 159, 64, 0.2)',
	                          'rgba(255, 205, 86, 0.2)',
	                          'rgba(75, 192, 192, 0.2)',
	                          'rgba(54, 162, 235, 0.2)',
	                          'rgba(153, 102, 255, 0.2)',
	                          'rgba(201, 203, 207, 0.2)'
	                        ],
	                        borderColor: [
	                          'rgb(255, 99, 132)',
	                          'rgb(255, 159, 64)',
	                          'rgb(255, 205, 86)',
	                          'rgb(75, 192, 192)',
	                          'rgb(54, 162, 235)',
	                          'rgb(153, 102, 255)',
	                          'rgb(201, 203, 207)'
	                        ],
	                        borderWidth: 1
	                      }]
	                    },
	                    options: {
	                      scales: {
	                        y: {
	                          beginAtZero: true
	                        }
	                      }
	                    }
	                  });
	                });
	              </script>
	              <!-- End Bar CHart -->
	
	            </div>
	          </div>
        	</div>
		       <div class="col-lg-4">
		       	 <div class="card">
		            <div class="card-body">
		              <h5 class="card-title"><spring:message code="deptCnt"/></h5>
		
		              <!-- Donut Chart -->
		              <a href="${path}/goUmPage.do">
		              <div class="memberChart" id="donutChart"></div>
					  </a>
		              <script>
						
						var count = []
						var deptmem = []
						$.ajax({
							url:"${path}/deptCnt.do",
							dataType:"json",
							async:false,
							success:function(data){
								var data = data.deptCnt
								$(data).each(function(idx, d){
									count.push(Number(d.count))
									deptmem.push(d.dept)
								})
							}
						})
		                document.addEventListener("DOMContentLoaded", () => {
		                  new ApexCharts(document.querySelector(".memberChart"), {
		                    series: count,
		                    chart: {
		                      height: 250,
		                      type: 'donut',
		                      toolbar: {
		                        show: true
		                      }
		                    },
		                    labels: deptmem,
		                  }).render();
		                });
		              </script>
		              <!-- End Donut Chart -->
		
		            </div>
		          </div>
	            </div> 
            </c:if>
    	<c:if test="${auth eq 'admin'}">
      		<div class="col-lg-12">
      		<div class="card recent-sales overflow-auto">
	      		<div class="card-body">
	      		<h5 class="card-title"><spring:message code="entireProject"/></h5>
	      		<table class="table datatable" >
                    <thead>
                      <tr>
                        <th scope="col"><spring:message code="pno"/></th>
                        <th scope="col"><spring:message code="title"/></th>
                        <th scope="col"><spring:message code="dept"/></th>
                        <th scope="col"><spring:message code="manager"/></th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty plist}">
                    <%int cnt=1; %>
                    <c:forEach var="p" items="${plist}">
                      <tr ondblclick="goMain(${p.pno})">
                        <th scope="row"><%=cnt++ %></th>
                        <td>${p.title}</td>
                        <td>${p.dept}</td>
                        <td>${p.name}</td>
                      </tr>
                    </c:forEach>
                    </c:if>
                    </tbody>
                  </table>
	                  <div class="text-center"> 
	                  	<button type="button" class="btn btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#verticalycentered">프로젝트 등록</button>
	                  </div>
                  </div>
              </div>
            </div>
      	</c:if>
      	<c:if test="${auth ne 'admin'}">
      	<c:if test="${auth eq 'pm'}">
      	<div class="col-lg-7">
      		<div class="card info-card customers-card">
                <div class="card-body">
      				<h5 class="card-title"><spring:message code="mgPrjList"/></h5>
      	</c:if>
      	<c:if test="${auth eq 'user'}">
      	<div class="col-lg-12">
      		<div class="card info-card customers-card">
                <div class="card-body">
                	<h5 class="card-title"><spring:message code="myPrjList"/></h5>
      	</c:if>
      	<c:if test="${auth eq 'um'}">
      	<div class="col-lg-7">
      		<div class="card info-card customers-card">
                <div class="card-body">
                	<h5 class="card-title"><spring:message code="myPrjList"/></h5>
      	</c:if>
				<c:if test="${not empty myPlist}">
                  <div class="d-flex align-items-center">
                    </div>
                    <c:forEach var="myP" items="${myPlist}">
                    <div class="list-group">
                    	<a href="${path}/goMain.do?pno=${myP.pno}" class="list-group-item list-group-item-action">
                    	  <div class="d-flex w-100 justify-content-between">
                    		<h2 class="mb-1">${myP.title}</h2>
                    		<small>${myP.dept}</small>
			              </div>
			              <div class="progress">
			              	<c:if test="${not empty myP.progAvg}">
			                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ${myP.progAvg}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${myP.progAvg}%</div>
		              	  	</c:if>
		              	  	<c:if test="${empty myP.progAvg}">
			                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 0%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">0%</div>
		              	  	</c:if>
		              	  </div>
		              	</a>
	              	</div>
	              	</c:forEach>
              	</c:if>
	              	<c:if test="${empty myPlist}">
	              		<h6><spring:message code="noprjmsg"/></h6>
	              	</c:if>
                  </div>
                  
	              <c:if test="${auth eq 'pm'}">
	                  <div class="text-center"> 
	                  	<button type="button" class="btn btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#verticalycentered">프로젝트 등록</button>
	                  </div>
	              </c:if>
                </div>
              </div>
            </c:if>
              
              
	     <div class="modal fade" id="verticalycentered" tabindex="-1">
	       <div class="modal-dialog modal-dialog-centered">
	         <div class="modal-content">
	           <div class="modal-header">
	             <h5 class="modal-title"><spring:message code="deptBudget"/></h5>
	             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	           </div>
	           <br>
	           <div class="modal-body">
				 <form class="row g-3 needs-validation" action="${path}/addProject.do" novalidate>
				 	<div class="row mb-3">
	                  <label class="col-sm-2 col-form-label"><spring:message code="deptBudget"/></label>
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" name="pmno" value="${userno}" readonly>
	                  </div>
	               	</div>
	                <div class="col-md-8">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" name="title" placeholder="프로젝트명" required>
	                    <label for="floatingName"><spring:message code="title"/></label>
		                  <div class="invalid-feedback">
		                    <spring:message code="nesmsg"/>
		                  </div>
	                  </div>
	                </div>
	                <div class="col-sm-4">
	                  <div class="form-floating mb-3">
	                    <select name="dept" class="form-select" id="floatingDept" aria-label="Dept">
	                      <option value="개발부"><spring:message code="deptDev"/></option>
	                      <option value="본부"><spring:message code="deptHQ"/></option>
	                      <option value="영업부"><spring:message code="deptsales"/></option>
	                      <option value="인사부"><spring:message code="deptHR"/></option>
	                    </select>
	                    <label for="floatingDept"><spring:message code="dept"/></label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-primary"><spring:message code="register"/></button>
	                </div>
	              </form>
	              			  
	           	</div>
	          </div>
	       	</div>
	       
         </div>
         <c:if test="${auth eq 'um'}">
	       <div class="col-lg-5">
	       	 
	       	 <div class="card">
	            <div class="card-body">
	              <h5 class="card-title"><spring:message code="deptCnt"/></h5>
	
	              <!-- Donut Chart -->
	              <a href="${path}/goUmPage.do">
	              <div id="donutChart"></div>
				  </a>
	              <script>
					
					var count = []
					var dept = []
					$.ajax({
						url:"${path}/deptCnt.do",
						dataType:"json",
						async:false,
						success:function(data){
							var data = data.deptCnt
							$(data).each(function(idx, d){
								count.push(Number(d.count))
								dept.push(d.dept)
							})
						}
					})
	                document.addEventListener("DOMContentLoaded", () => {
	                  new ApexCharts(document.querySelector("#donutChart"), {
	                    series: count,
	                    chart: {
	                      height: 250,
	                      type: 'donut',
	                      toolbar: {
	                        show: true
	                      }
	                    },
	                    labels: dept,
	                  }).render();
	                });
	              </script>
	              <!-- End Donut Chart -->
	
	            </div>
	          </div>
	          
            </div> 
            </c:if>
            
            
            <c:if test="${auth eq 'pm'}">
		       <div class="col-lg-4">
		       	 <div class="card">
		            <div class="card-body">
		              <h5 class="card-title"><spring:message code="deptBudget"/></h5>
		
		              <!-- Donut Chart -->
		              <div class="projectbudgetChart" id="donutChart"></div>
		
		              <script>
						
						var projectbudget = []
						var title = []
						$.ajax({
							url:"${path}/getProjectBudget.do",
							dataType:"json",
							async:false,
							success:function(data){
								var data = data.projectbudget
								$(data).each(function(idx, d){
									projectbudget.push(Number(d.projectbudget))
									title.push(d.title)
								})
							}
						})
		                document.addEventListener("DOMContentLoaded", () => {
		                  new ApexCharts(document.querySelector(".projectbudgetChart"), {
		                    series: projectbudget,
		                    chart: {
		                      height: 250,
		                      type: 'donut',
		                      toolbar: {
		                        show: true
		                      }
		                    },
		                    labels: title,
		                  }).render();
		                });
		              </script>
		              <!-- End Donut Chart -->
		
		            </div>
		          </div>
		          
		       	 <div class="card">
		            <div class="card-body">
		              <h5 class="card-title"><spring:message code="prjparCnt"/></h5>
		
		              <!-- Donut Chart -->
		              <canvas class="projectUserChart" id="barChart" style="max-height: 400px;"></canvas>
		
		              <script>
						
						var usercnt = []
						var titleu = []
						$.ajax({
							url:"${path}/getProjectUserCnt.do",
							dataType:"json",
							async:false,
							success:function(data){
								var data = data.projectusercnt
								$(data).each(function(idx, d){
									usercnt.push(Number(d.usercnt))
									titleu.push(d.title)
								})
							}
						})
		                document.addEventListener("DOMContentLoaded", () => {
		                  new Chart(document.querySelector('.projectUserChart'), {
		                    type: 'bar',
		                    data: {
		                      labels: titleu,
		                      datasets: [{
		                        label: '인원 수',
		                        data: usercnt,
		                        backgroundColor: [
		                          'rgba(255, 99, 132, 0.2)',
		                          'rgba(255, 159, 64, 0.2)',
		                          'rgba(255, 205, 86, 0.2)',
		                          'rgba(75, 192, 192, 0.2)',
		                          'rgba(54, 162, 235, 0.2)',
		                          'rgba(153, 102, 255, 0.2)',
		                          'rgba(201, 203, 207, 0.2)'
		                        ],
		                        borderColor: [
		                          'rgb(255, 99, 132)',
		                          'rgb(255, 159, 64)',
		                          'rgb(255, 205, 86)',
		                          'rgb(75, 192, 192)',
		                          'rgb(54, 162, 235)',
		                          'rgb(153, 102, 255)',
		                          'rgb(201, 203, 207)'
		                        ],
		                        borderWidth: 1
		                      }]
		                    },
		                    options: {
		                      scales: {
		                        y: {
		                          beginAtZero: true
		                        }
		                      }
		                    }
		                  });
		                });
		              </script>
		              <!-- End Donut Chart -->
		
		            </div>
		          </div>
	            </div>
            </c:if>
          </div>
		<script>
			$(document).ready(function(){
				
			});
		</script>
		
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

				
                <div class="card-body">
               	  <c:if test="${auth eq 'admin'}">
                  <h5 class="card-title"><spring:message code="fullsch"/></h5>
                  </c:if>
                  <c:if test="${auth eq 'user'}">
                  <h5 class="card-title"><spring:message code="mysch"/></h5>
                  </c:if>
                  <c:if test="${auth eq 'um'}">
                  <h5 class="card-title"><spring:message code="mysch"/></h5>
                  </c:if>
                  <c:if test="${auth eq 'pm'}">
                  <h5 class="card-title"><spring:message code="mgsch"/></h5>
                  </c:if>
                  <table class="table datatable" >
                    <thead>
                      <tr>
                        <th scope="col"><spring:message code="pno"/></th>
                        <th scope="col"><spring:message code="title"/></th>
                        <th scope="col"><spring:message code="sname"/></th>
                        <th scope="col"><spring:message code="status"/></th>
                        <th scope="col"><spring:message code="deadline"/></th>
                        <th scope="col"><spring:message code="progress"/></th>
                        <c:if test="${auth eq 'admin'}">
                        <th scope="col"><spring:message code="dept"/></th>
                        </c:if>
                      </tr>
                    </thead>
                    <tbody>
                    <c:if test="${auth eq 'admin'}">
                    <c:if test="${not empty slist}">
                    <%int cnt=1; %>
                    <c:forEach var="s" items="${slist}">
                      <tr ondblclick="goMain(${s.pno})">
                        <th scope="row"><%=cnt++ %></th>
                        <td>${s.title}</td>
                        <td>${s.sname}</td>
                        <td>
                        <c:if test="${s.status eq '진행중'}">
                        	<span class="badge bg-primary">${s.status}</span>
                        </c:if>
                        <c:if test="${s.status eq '완료'}">
                        	<span class="badge bg-success">${s.status}</span>
                        </c:if>
                        <c:if test="${s.status eq '막힘'}">
                        	<span class="badge bg-danger">${s.status}</span>
                        </c:if>
                        </td>
                        <td><fmt:formatDate value="${s.startDate}" pattern="yyyy-MM-dd"/></td>
                        <td>
	                        <div class="progress">
		                		<div class="progress-bar bg-success" role="progressbar" style="width: ${s.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
		              		</div>
	              		</td>
	              		<td>${s.dept}</td>
                      </tr>
                      </c:forEach>
                    </c:if>
                    <c:if test="${empty slist}">
						<tr><td colspan="7" align="center"><spring:message code="noschmsg"/></td></tr>
                    </c:if>
                    </c:if>
                    
                    
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
						<tr><td colspan="6" align="center"><spring:message code="noschmsg"/></td></tr>
                    </c:if>
                    </c:if>
                    
                    <c:if test="${auth eq 'um'}">
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
                    	<tr><td colspan="6" align="center"><spring:message code="noschmsg"/></td></tr>
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
                    	<tr><td></td><td></td><td align="center"><spring:message code="noschmsg"/></td></tr>
                    </c:if>
                    </c:if>
                    </tbody>
                  </table>
				<script type="text/javascript">
				function goMain(pno){
					location.href="${path}/goMain.do?pno="+pno
				}
				
				var proc = "${proc}"
	          	if(proc=="delprj"){
	          		alert("삭제성공!")
	          		location.href="${path}/entireDashboard.do"
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