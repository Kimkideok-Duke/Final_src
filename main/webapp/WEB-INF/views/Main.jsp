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

  <title>Fine PMS</title>
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
	#chatArea{
		height:200px;overflow-y:scroll;text-align:left;
	}
	
		
	.thick{
	font-weight : 1000;
	}
	
	.tm{
	color:blue; 
	font-size:10px;
	}
	

</style>

  <!-- =======================================================
  * Template Name: NiceAdmin - v2.3.1
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#uptBtn").click(function(){
			$("#uptSchedule").submit()
		})
		
		var vm = new Vue({
			el:".vueel",
			data:{msg:"리스트 출력", 
				parlist:[]
			},
			methods:{
				getlist:function(){
					this.get()
				},
				get:function(){
					var vm = this
					$.ajax({
						url:"${path}/getPrjparticipant.do?pno=${param.pno}",
						dataType:"json",
						async:false,
						success:function(data){
							vm.parlist = data.parlist
							console.log("데이터")
							console.log(data.parlist)
						},
						error:function(err){
							console.log(err)
						}	
					})
				}
			}
		})
		
		$("#progress").change(function(){
			$("#show").text($(this).val()+"%")
	    });
		$("#progressReg").change(function(){
			$("#showReg").text($(this).val()+"%")
	    });
	});
	var ckClk = false;
	function chVal(sno){
		if(ckClk){
			$('#schptBtn').trigger('click')
			console.log(ckClk)	
		}
		$.ajax({
			url:"${path}/uptScheduleModal.do",
			data:"sno="+sno,
			dataType:"json",
			success:function(data){
				var data = data.schedule
				$("#sno").val(sno)
				$("#sname").val(data.sname)
				$("#status").val(data.status)
				$("#progress").val(data.progress)
				$("#startDate").val(data.startDate)
				$("#endDate").val(data.endDate)
				$("#budget").val(data.budget)
			}
		})
	}
	function regVal(){
		if($("[name=sname]").val()==""){
			alert("일정명을 입력해주세요")
			$("[name=sname]").focus()
			return
		}
		$.ajax({
			url:"${path}/regScheduleModal.do",
			dataType:"json",
			success:function(data){
				var data = data.schedule
			}
		})
	}
	var auth = "${auth}"
	function delProc(){
		if(auth=="pm" || auth=="admin"){
			if(confirm("삭제하시겠습니까?")){
				var sno = $("#sno").val()
				location.href="${path}/delSchedule.do?sno="+sno
			}			
		}else{
			alert("권한이 없습니다!")
		}
	}
	function delSchParti(sno, userno){
		if(confirm("삭제하시겠습니까?"))
		location.href="${path}/delSchParticipant.do?userno="+userno+"&sno="+sno
	}
	
	function schpartBtn(){
		ckClk = !ckClk
		var sno = $("#sno").val()
		console.log(ckClk)
		$.ajax({
			url:"${path}/showSchPartiInfo.do",
			data: "sno="+sno,
			dataType:"json",
			success:function(data){
				var list = data.schParInfo
				$("#inssno").val(sno)
				console.log(list)
				if(list.length==0){
					var addHTML="<tr><td colspan='5' align='center'>참가자가 없습니다.</td></tr>"
				}else{
					var addHTML=""
						$(list).each(function(idx, sp){
							addHTML+="<tr><td>"+(idx+1)+"</td><td>"+sp.name+"</td>"+
								"<td>"+sp.dept+"</td><td>"+sp.position+"</td>"+
								"<td>"+sp.userno+"</td></tr>"
					});
				}
				console.log(addHTML)
				$("#schparti").html(addHTML)
			}
		}); 
	}
	function rstBtn(){
		if(ckClk){
			$('#schptBtn').trigger('click')
			console.log(ckClk)	
		}
	}
	
	var pno = "${pno}"
	var proc = "${proc}"
	var isReg = "${isReg}"
	if(isReg=="Y"){
		alert("등록 성공!")
		location.href="${path}/goMain.do?pno="+pno		
	}
	if(proc=="upt"){
		alert("수정 성공!")
		location.href="${path}/goMain.do?pno="+pno
	}
	if(proc=="del"){
		alert("삭제 성공!")
		location.href="${path}/goMain.do?pno="+pno
	}
</script>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');
      	var dlist = []
		var gdata = []
		$.ajax({
			url:"${path}/getGanttData.do?pno=${param.pno}",
			dataType:"json",
			async:false,
			success:function(dt){
				var dt = dt.ganttData
				$(dt).each(function(idx, d){
					var sDate = d.startDate.replace(" ","T");
					var eDate = d.endDate.replace(" ","T");
					gdata = [String(d.sno), d.sname, new Date(sDate), new Date(eDate), null, d.progress, null]
					dlist.push(gdata)
				})
			}
		})
      	data.addRows(dlist);
      var options = {
        height: (30*dlist.length)+50,
        width:"100%",
        gantt: {
          trackHeight: 30
        }
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
  </script>
</head>

<body>

  <!-- ======= Sidebar ======= -->
<jsp:include page="navi.jsp"/>

  <main id="main" class="main">
    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Customers Card -->
            <div class="col-lg-12">

              <div class="card info-card customers-card">

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
                  <h5 class="card-title">${title}</h5> 
					<div class="progress">
	                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ${prog}%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100">${prog}%</div>
	              	</div>
                </div>
              </div>

            </div><!-- End Customers Card -->

            <!-- 일정 관리 -->

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
            <h5 class="card-title">일정 목록 <span>| 클릭시 수정</span></h5>

            <table class="table table-borderless datatable">
            <thead>
              	<tr>
           	    <th scope="col">번호</th>
				<th scope="col">일정명</th>
				<th scope="col">상태</th>
				<th scope="col">진행도</th>
				<th scope="col">시작일</th>
				<th scope="col">마감일</th>
				<th scope="col">예산</th>
				<th scope="col">코멘트</th>
                </tr>
			</thead>
			<tbody>
				<%int cnt=0; %>
				<c:forEach var="schedule" items="${slist}">
				
				<tr data-bs-toggle="modal" data-bs-target="#basicModal">
				<th scope="row" class=""><%=++cnt %></th>
				
				<td onclick="chVal(${schedule.sno })">${schedule.sname}</td>
				<td onclick="chVal(${schedule.sno })">
					<c:if test="${schedule.status eq '예정'}">
                    	<span class="badge bg-secondary">${schedule.status}</span>
                    </c:if>
                    <c:if test="${schedule.status eq '진행중'}">
                    	<span class="badge bg-primary">${schedule.status}</span>
                    </c:if>
                    <c:if test="${schedule.status eq '완료'}">
                    	<span class="badge bg-success">${schedule.status}</span>
                    </c:if>
                    <c:if test="${schedule.status eq '중지'}">
                    	<span class="badge bg-warning">${schedule.status}</span>
                    </c:if>
                    <c:if test="${schedule.status eq '막힘'}">
                    	<span class="badge bg-danger">${schedule.status}</span>
                    </c:if>
				</td>
				<td onclick="chVal(${schedule.sno })">
				<%-- <c:set var="status" value="" />
				<c:choose>
                <c:when test="${schedule.progress eq 100}">
                	<c:set var="status" value="success" /></c:when>
               	<c:when test="${schedule.progress > 50 and schedule.progress < 100}">
	               	<c:set var="status" value="warning" /></c:when>
				<c:otherwise>
					<c:set var="status" value="danger" /></c:otherwise>
                </c:choose> --%>
					<div class="progress">
	              		<c:if test="${schedule.status eq '예정'}">
	              		<div class="progress-bar bg-secondary" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              			</c:if>
              			<c:if test="${schedule.status eq '진행중'}">
                		<div class="progress-bar bg-primary" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              			</c:if>
              			<c:if test="${schedule.status eq '완료'}">
                		<div class="progress-bar bg-success" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              			</c:if>
              			<c:if test="${schedule.status eq '중지'}">
                		<div class="progress-bar bg-warning" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              			</c:if>
              			<c:if test="${schedule.status eq '막힘'}">
                		<div class="progress-bar bg-danger" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              			</c:if>
	              	</div>
              	</td>
				<td onclick="chVal(${schedule.sno })"><fmt:formatDate value="${schedule.startDate}" pattern="yyyy-MM-dd"/></td>
				<td onclick="chVal(${schedule.sno })"><fmt:formatDate value="${schedule.endDate}" pattern="yyyy-MM-dd"/></td>
				<td onclick="chVal(${schedule.sno })">${schedule.budget}원</td>
				<td><img src="a00_com/images/comment.png" width="30" height="30" onclick="goComment(${schedule.sno})"/></td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			<div class="text-center">
			<c:if test="${auth eq 'admin' or auth eq 'pm'}">
	   			<button type="button" id="Btn01" class="btn btn-primary" onclick="chVal(${schedule.sno })"data-bs-toggle="modal" data-bs-target="#regModal">일정 등록</button>
			</c:if>
			</div>
   		 </div>
   		 
	</div>
</div>
            <!-- 일정관리 -->

<!-- 모달창(PM수정) -->
       <div class="modal fade" id="basicModal" tabindex="-1">
         <div class="modal-dialog">
           <div class="modal-content">
                  <!-- 모달 상단 -->
				      <div class="modal-header">
				        <h5 class="modal-title">일정 수정</h5>
				        <button type="button" id="closeBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="rstBtn()"></button>
				      </div>
				      <!-- 모달 내용 sname, status, progress, startDate, endDate, budget -->
			      <div class="modal-body">
			      <!-- 권한 체크해서 form 경로 변경, input 숨기기 -->
			      	<c:if test="${auth eq 'admin' or auth eq 'pm'}">
			  		<form id="uptSchedule" class="row g-3 needs-validation" action="${path}/uptScheduleByPM.do" novalidate>
			  		</c:if>
			  		<c:if test="${auth eq 'um' or auth eq 'user'}">
			  		<form id="uptSchedule" class="row g-3 needs-validation" action="${path}/uptSchedule.do" novalidate>
			  		</c:if>
			  		<input type="hidden" id="sno" name="sno" value=""/>
			  		<c:if test="${auth eq 'admin' or auth eq 'pm'}">
			             <div class="row mb-3" style="padding-top:15px;">
			             
			               <label for="inputText" class="col-sm-2 col-form-label">일정명</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="text" id="sname" name="sname" class="form-control" placeholder="일정명" required>
			                 <div class="invalid-feedback">
			                    필수 입력 항목입니다.
			                 </div>
		                    </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">상태</label>
			               <div class="col-sm-10">
			                 <select class="form-select" id="status" name="status">
			                      <option value="예정">예정</option>
			                      <option value="진행중">진행중</option>
			                      <option value="완료">완료</option>
			                      <option value="중지">중지</option>
			                      <option value="막힘">막힘</option>
			                 </select>
			               </div>
			             </div>
	             </c:if>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">진행도</label>
			               <div class="col-sm-10">
			                 <input type="range" id="progress" name="progress" class="form-range" min="0" max="100" step="5" value="0"><p id="show" align="center"></p>
			               </div>
			             </div>
			       <c:if test="${auth eq 'admin' or auth eq 'pm'}">
						<div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">시작일</label>
			               <div class="col-sm-10">
			               <div class="input-group has-validation">
			                 <input type="date" id="startDate" name="startDate_s" class="form-control" required>
			                 <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				             </div>
				            </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">마감일</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="date" id="endDate" name="endDate_s" class="form-control" required>
			                 <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				             </div>
			                </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">예산</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="number" id="budget" name="budget" class="form-control" min="0" step="10000" required>
				               <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				               </div>
			               	</div>
			               </div>
			             </div>
			            </c:if>
			             <div class="row mb-3">
			               <div class="col-sm-12">
			                 <div class="accordion accordion-flush" id="accordionSchParti">
				                <div class="accordion-item">
				                  <h2 class="accordion-header" id="flush-headingTwo">
				                    <button class="accordion-button collapsed card-title" type="button" id="schptBtn" onclick="schpartBtn()" data-bs-toggle="collapse" data-bs-target="#SchPartiInfo" aria-expanded="false" aria-controls="SchPartiInfo">
				                      참가자목록
				                    </button>
				                  </h2>
				                    <div id="SchPartiInfo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="accordionSchParti">
				                      <div class="accordion-body">
						               <table class="table table-striped">
						                <thead>
						                  <tr>
						                    <th scope="col">#</th>
						                    <th scope="col">이름</th>
						                    <th scope="col">부서</th>
						                    <th scope="col">직급</th>
						                    <th scope="col">사원번호</th>
						                  </tr>
						                </thead>
						                <tbody id=schparti>
						                </tbody>
						              </table>
						              	<div class="text-center">
						              	  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSchparti">참가자 추가</button>
						              	</div>
						              </div>
				                    </div>
				                    
				                  </div>
				                </div>
			               </div>
			             </div>
			       
			              <div class="row mb-3">
			               <div class="text-end">
			                
			             	<button type="submit" class="btn btn-primary">수정</button>
			             	<button type="button" onclick="delProc()" id="delBtn" class="btn btn-danger">삭제</button>
		             	   </div>
			              </div>
			              </div>
			              </form>
            </div>
			     <!-- 모달 하단 -->      
				      <!-- <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				      </div> -->
           </div>
         </div>

<!-- 일정 참가자 추가 -->
<script type="text/javascript">
	var proc = "${proc}"
  	if(proc=="insParSch"){
  		alert("${param.userno} 추가 성공!")
  		location.href="${path}/goMain.do?pno=${param.pno}"
  	}
	if(proc=="delParSch"){
		alert("참가자 삭제 성공!")
		location.href="${path}/goMain.do?pno=${param.pno}"
	}
</script>        
		      <div class="modal fade" id="addSchparti" tabindex="-1">
			       <div class="modal-dialog modal-dialog-centered">
			         <div class="modal-content">
			           <div class="modal-header">
			             <h5 class="modal-title">프로젝트 참가자 추가</h5>
			             <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#basicModal"></button>
			           </div>
			           <br>
			           <div class="modal-body">
						 <form class="row g-3 needs-validation" action="${path}/insSchParticipant.do" novalidate>
						 	<input type="hidden" name="pno" value="${param.pno}">
						 	<input type="hidden" name="sno" id="inssno" value="">
			                <div class="col-sm-12">
			                  <div class="form-floating mb-3">
			                  	<table class="table table-striped datatable">
					                <thead>
					                  <tr>
					                    <th scope="col">   </th>
					                    <th scope="col">이름</th>
					                    <th scope="col">직급</th>
					                    <th scope="col">부서</th>
					                    <th scope="col">UserNo</th>
					                  </tr>
					                </thead>
					                <tbody>
					                <c:forEach var="sp" items="${schPlist}">
					                  <tr>
					                    <td><input type="radio" value="${sp.userno}" name="userno"></td>
					                    <td>${sp.name}</td>
					                    <td>${sp.position}</td>
					                    <td>${sp.dept}</td>
					                    <td>${sp.userno}</td>
					                  </tr>
					                </c:forEach>
					                </tbody>
					            </table>
			                  </div>
			                </div>
			                <div class="text-center">
			                  <button type="submit" class="btn btn-primary">추가</button>
			                </div>
			              </form>
			           	</div>
			          </div>
			       	</div>
			       
		         </div>
		         
<!-- 모달창(일반등록) -->
       <div class="modal fade" id="regModal" tabindex="-1">
         <div class="modal-dialog">
           <div class="modal-content">
                  <!-- 모달 상단 -->
				      <div class="modal-header">
				        <h5 class="modal-title">일정 등록</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <!-- 모달 내용 sname, status, progress, startDate, endDate, budget -->
			      <div class="modal-body">
			      <!-- 권한 체크해서 form 경로 변경, input 숨기기 -->
			  		<form id="regSchedule" class="row g-3 needs-validation" action="${path}/regSchedule.do" novalidate>
			  			<input type="hidden" name="pno" value="${param.pno}">
			  			<input type="hidden" name="state" value="일정등록"/>
			  			<input type="hidden" name="writer" value="없음"/>

			             <div class="row mb-3" style="padding-top:15px;">
			               <label for="inputText" class="col-sm-2 col-form-label">일정명</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="text" id="snameReg" name="sname" class="form-control" placeholder="일정명" required>
			                 <div class="invalid-feedback">
			                    필수 입력 항목입니다.
			                 </div>
		                    </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">상태</label>
			               <div class="col-sm-10">
			                 <select class="form-select" id="statusReg" name="status">
			                      <option value="예정" selected>예정</option>
			                      <option value="진행중">진행중</option>
			                      <option value="완료">완료</option>
			                      <option value="중지">중지</option>
			                      <option value="막힘">막힘</option>
			                 </select>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">진행도</label>
			               <div class="col-sm-10">
			                 <input type="range" id="progressReg" name="progress" class="form-range" min="0" max="100" step="5" value="0"><p id="showReg" align="center"></p>
			               </div>
			             </div>
						<div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">시작일</label>
			               <div class="col-sm-10">
			               <div class="input-group has-validation">
			                 <input type="date" id="startDateReg" name="startDate_s" class="form-control" required>
			                 <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				             </div>
				            </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">마감일</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="date" id="endDateReg" name="endDate_s" class="form-control" required>
			                 <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				             </div>
			                </div>
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">예산</label>
			               <div class="col-sm-10">
			               	<div class="input-group has-validation">
			                 <input type="number" id="budgetReg" name="budget" class="form-control" min="0" step="10000" value="0" required>
			               	 <div class="invalid-feedback">
				                    필수 입력 항목입니다.
				             </div>
				            </div>
			               </div>
			             </div>
			             
			             <div class="row">
			             	<button type="submit" class="btn btn-primary">등록</button>
			             </div>
			             </form>
			           </div>
			           
			     <!-- 모달 하단 -->      
				      <!-- <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				      </div>	 -->
           </div>
         </div>
       </div>

            <!-- Gantt Chart -->
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">간트차트 <span>ㅣ일정</span></h5>
                  <c:if test="${not empty slist}">
					<div id="chart_div"></div>
				  </c:if>
				  <c:if test="${empty slist}">
				  	<h3 align="center">일정을 추가해주세요.</h3>
				  </c:if>
          		</div>
          	  </div>
          	</div>
          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
          <div class="card">
            <div class="filter">
              <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                <li class="dropdown-header text-start">
                  <h6>타임라인</h6>
                </li>

                <li><a class="dropdown-item" href="${path}/goTimeline.do?pno=${param.pno}&title=${param.title}">타임라인 더보기</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">타임라인 <span>| ${title}<br></span>
              <span style="color:#8c8c8c; font-size:12px;">⏲️ 최근 15개까지 화면에 노출</span></h5>

              <div class="activity">       
                                 
                <c:forEach var="t" items="${tmlist}" begin="0" end="14" varStatus="status">
                
                <c:choose>
                <c:when test="${t.state == '일정등록'}">
                 <div class="activity-item d-flex">
                  <div class="activite-label">${t.calTime }</div>
                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>            
                  <div class="activity-content">#${t.sname } <span class="thick">일정</span>이 등록되었습니다.</div>
                </div><!-- End activity item-->
                </c:when>
              <%-- 
               <c:when test="${t.state == '일정수정'}">
                 <div class="activity-item d-flex">
                  <div class="activite-label">${t.calTime}</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">${t.sname } <span class="thick">일정</span>이 수정되었습니다.</div>
                  </div><!-- End activity item-->               
                </c:when>
                
                 <c:when test="${t.state == '일정삭제'}">
                 <div class="activity-item d-flex">
                  <div class="activite-label">${t.calTime}</div>
                   <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">${t.sname } <span class="thick">일정</span>이 삭제되었습니다.</div>
                  </div><!-- End activity item-->               
                </c:when>
             --%>      
                <c:when test="${t.state == '댓글등록'}">
                 <div class="activity-item d-flex">                 
                  <div class="activite-label">${t.calTime }</div>
                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                  <div class="activity-content">${t.writer}님이 #${t.sname } 일정에 <span class="thick">코멘트</span>를 등록하였습니다.</div>
                </div><!-- End activity item-->               
                </c:when>

                <c:when test="${t.state == '댓글삭제'}">
                 <div class="activity-item d-flex">
                  <div class="activite-label">${t.calTime}</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">#${t.sname } 일정에 <span class="thick">코멘트</span>가 삭제되었습니다.</div>
                  </div><!-- End activity item-->               
                </c:when>
                
                
                 <c:otherwise>                
                <div class="activity-item d-flex">
                  <div class="activite-label">${t.calTime}</div>
                   <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">#${t.sname } 일정에 <span class="thick">코멘트</span>가 수정되었습니다.</div>
                </div><!-- End activity item-->
                
                


            
                </c:otherwise>  
                </c:choose>
                </c:forEach>

       <%-- Timeline Circle Color
       => Red   
       <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
       => Green   
       <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
       => Yellow
       <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
       => Blue
       <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
       => Sky Blue
       <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
       => DarkGreen
       <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
       --%>

              </div>

            </div>

          </div><!-- End Recent Activity -->
          
           <!-- 진행도 chart -->
           <div class="card">
                 <!-- Radial Bar Chart -->
              <div class="StatusCntChart card-body" id="radialBarChart">
              <h5 class="card-title">전체일정 진행상태<span><br></span>
              <span style="color:#8c8c8c; font-size:12px;">📅 일정을 완료하세요!</span></h5>
              <script> 
              var ratio = []
              var schstatus = []
              var cnt = []
				$.ajax({
					url:"${path}/getSchStatus.do?pno=${param.pno}",
					dataType:"json",
					async:false,
					success:function(data){						
						var data = data.stRatio
						$(data).each(function(idx, d){
							ratio.push(Number(d.stRatio))
							schstatus.push(d.status)
							cnt.push(d.stCnt)
						})
					}
				})
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector(".StatusCntChart"), {
                    series: ratio,
                    chart: {
                      height: 250,
                      type: 'radialBar',
                      toolbar: {
                        show: true
                      }
                    },
                    plotOptions: {
                      radialBar: {
                        dataLabels: {
                          name: {
                            fontSize: '22px',
                          },
                          value: {
                            fontSize: '16px',
                          },
                          total: {
                            show: true,
                            label: 'Total',
                            formatter: function(w) {
                              // By default this function returns the average of all series. The below is just an example to show the use of custom formatter function
                              return 
                            }
                          }
                        }
                      }
                    },
                    labels: schstatus,
                  }).render();
                });
              </script>
              <!-- End Radial Bar Chart -->  
					
                </div>

            </div><!-- 진행도 chart End -->
          

              <!-- 참가자 Accordion without outline borders -->
          <div class="card">
            <div class="card-body">
              <div class="vueel">
              <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed card-title" type="button" @click="getlist" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                      참가자 <span>| Today</span>
                    </button>
                  </h2>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	               <div class="accordion-body">
		               <table class="table table-striped">
		                <thead>
		                  <tr>
		                    <th scope="col">#</th>
		                    <th scope="col">Name</th>
		                    <th scope="col">Dept</th>
		                    <th scope="col">Position</th>
		                    <th scope="col">Email</th>
		                  </tr>
		                </thead>
		                <tbody>
		                  <tr v-for="(p, idx) in parlist">
		                    <th scope="row">{{idx+1}}</th>
		                    <td>{{p.name}}</td>
		                    <td>{{p.dept}}</td>
		                    <td>{{p.position}}</td>
		                    <td>{{p.email}}</td>
		                  </tr>
		                </tbody>
		              </table>
		              <c:if test="${auth eq 'admin'}">
		              <div class="col-lg-12" align="center">
			      	  	<button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addparti">참가자 추가</button>
			        </div>
			        </c:if>
			        <c:if test="${auth eq 'pm'}">
		              <div class="col-lg-12" align="center">
			      	  	<button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addparti">참가자 추가</button>
			        </div>
			        </c:if>
			        </div>
                    </div>
                    
                  </div>
                </div>
               </div>
			</div>
<script type="text/javascript">
	var proc = "${proc}"
  	if(proc=="insParPrj"){
  		alert("${param.userno} 추가 성공!")
  		location.href="${path}/goMain.do?pno=${param.pno}"
  	}
</script>        
		      <div class="modal fade" id="addparti" tabindex="-1">
			       <div class="modal-dialog modal-dialog-centered">
			         <div class="modal-content">
			           <div class="modal-header">
			             <h5 class="modal-title">프로젝트 참가자 추가</h5>
			             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			           </div>
			           <br>
			           <div class="modal-body">
						 <form class="row g-3 needs-validation" action="${path}/insParPrj.do?pno=${param.pno}" novalidate>
						 	<input type="hidden" name="pno" value="${param.pno}">
			                <div class="col-sm-12">
			                  <div class="form-floating mb-3">
			                  	<table class="table table-striped datatable">
					                <thead>
					                  <tr>
					                    <th scope="col">   </th>
					                    <th scope="col">이름</th>
					                    <th scope="col">직급</th>
					                    <th scope="col">부서</th>
					                    <th scope="col">UserNo</th>
					                  </tr>
					                </thead>
					                <tbody>
					                <c:forEach var="a" items="${alist}">
					                  <tr>
					                    <td><input type="radio" value="${a.userno}" name="userno"></td>
					                    <td>${a.name}</td>
					                    <td>${a.position}</td>
					                    <td>${a.dept}</td>
					                    <td>${a.userno}</td>
					                  </tr>
					                </c:forEach>
					                </tbody>
					            </table>
			                  </div>
			                </div>
			                <div class="text-center">
			                  <button type="submit" class="btn btn-primary">추가</button>
			                </div>
			              </form>
			           	</div>
			          </div>
			       	</div>
			       
		         </div>
              
             </div><!--참가자 End Accordion without outline borders -->
        
          <!-- 채팅 -->
          <div class="card">
            <div class="card-body">
             <h5 class="card-title">채팅 <span>| Today</span></h5>
                           <!-- Floating Labels Form -->
              <form class="row g-3">
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="id" value="${name} (${dept})" readonly>
                    <label for="id">사원이름(부서명)</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating">
                  <div>채팅 내용</div>
                   <div class="form-control" id="chatArea">
                    <div id="chatMessageArea"></div>
                   </div> 
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="msg">
                    <label for="msg">메세지 입력</label>
                  </div>
                </div>
                <div class="text-center">
                  <button type="button" id="enterBtn" class="btn btn-primary">채팅 입장</button>
                  <button type="button" id="exitBtn" class="btn btn-danger">채팅 나가기</button>
                  <button type="button" id="sndBtn" class="btn btn-success">메세지 전송</button>
                </div>
              </form><!-- End floating Labels Form -->
             
          </div>
        </div><!-- End 채팅 -->

      </div>
      <c:if test="${auth eq 'pm'}">
      <div class="col-lg-12" align="center">
      <button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#projectoption"><i class="bx bx-wrench"></i> 프로젝트 수정/삭제</button>
      </div>
      </c:if>
      <c:if test="${auth eq 'admin'}">
      <div class="col-lg-12" align="center">
      <button type="button" class="btn btn-outline-dark btn-sm" data-bs-toggle="modal" data-bs-target="#projectoption"><i class="bx bx-wrench"></i> 프로젝트 수정/삭제</button>
      </div>
      </c:if>
      
      <div class="modal fade" id="projectoption" tabindex="-1">
	       <div class="modal-dialog modal-dialog-centered">
	         <div class="modal-content">
	           <div class="modal-header">
	             <h5 class="modal-title">프로젝트 수정/삭제</h5>
	             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	           </div>
	           <br>
	           <div class="modal-body">
				 <form class="row g-3 needs-validation" action="${path}/updateProject.do" novalidate>
				 	<input type="hidden" name="pno" value="${param.pno}">
				 	<%-- <div class="row mb-3">
	                  <label class="col-sm-2 col-form-label">PM번호</label>
	                  <div class="col-sm-10">
	                    <input type="text" class="form-control" value="${pmno}" readonly>
	                  </div>
	               	</div> --%>
	                <div class="col-md-8">
	                  <div class="form-floating">
	                    <input type="text" class="form-control" id="floatingName" name="title" placeholder="프로젝트명" value="${title}" required>
	                    <label for="floatingName">프로젝트명</label>
		                  <div class="invalid-feedback">
		                    필수 입력정보 입니다.
		                  </div>
	                  </div>
	                </div>
	                <div class="col-sm-4">
	                  <div class="form-floating mb-3">
	                    <select name="dept" class="form-select" id="floatingDept" aria-label="Dept">
	                      <option value="개발부">개발부</option>
	                      <option value="기획부">기획부</option>
	                      <option value="사업부">사업부</option>
	                      <option value="디자인부">디자인부</option>
	                      <option value="품질관리부">품질관리부</option>
	                      <option value="마케팅부">마케팅부</option>
	                      <option value="인사부">인사부</option>
	                      <option value="경영관리부">경영관리부</option>
	                    </select>
	                    <label for="floatingDept">부서</label>
	                  </div>
	                </div>
	                <div class="text-center">
	                  <button type="submit" class="btn btn-warning">프로젝트 수정</button>
	                  <button type="button" class="btn btn-danger" onclick="deletePrj()">프로젝트 삭제</button>
	                </div>
	              </form>
	              <script type="text/javascript">
	              	function deletePrj(){
	          			if(confirm("삭제하시겠습니까?\n삭제시 복구할 수 없습니다!!!")){
	          				location.href="${path}/deleteProject.do?pno=${param.pno}"
	          			}
		          	}
		          	var proc = "${proc}"
		          	if(proc=="uptprj"){
		          		alert("수정성공!")
		          		location.href="${path}/goMain.do?pno=${param.pno}"
		          	}
	              </script>
	           	</div>
	          </div>
	       	</div>
	       
      </div>
      </div>
    </section>

  </main><!-- End #main -->

<script type="text/javascript">
function goSchedule(){
	location.href="${path}/goSchedule.do"
}


function goComment(sno){
	location.href="${path}/commentList.do?sno="+sno+"&pno="+"${param.pno}";
	
}
var wsocket;
$(document).ready(function(){
	$("#enterBtn").click(function(){
		if(confirm("채팅방 접속합니다.")){
			conn();
		}
	});
	$("#exitBtn").click(function(){
		if(confirm("접속을 종료하시겠습니까?")){
			wsocket.send("msg:"+$("#id").val()+":접속 종료 했습니다.")
			wsocket.close();
		}
	});
});
function conn(){
	wsocket = new WebSocket("ws:220.73.54.156:8080/${path}/chat-ws.do")
	wsocket.onopen=function(evt){ 
		wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.")
	}
	// 메시지를 받을 때, 처리되는 메서드
	wsocket.onmessage=function(evt){
		var msg = evt.data
		console.log(msg)
		if(msg.substring(0,4)=="msg:"){
			var revMsg = msg.substring(4)
			$("#chatMessageArea").append(revMsg+"<br>")	
			$("#chatArea").scrollTop(ma+=20);
			console.log("chatArea길이:"+ma)
		}
	}
	var ma = parseInt($("#chatMessageArea").height());	
	// 접속을 종료 처리할 때
	wsocket.onclose=function(){
		alert($("#id").val()+"접속 종료합니다.")
		$("#chatMessageArea").empty();
	}		
}
$("#msg").keyup(function(){
	if(event.keyCode==13){
		wsocket.send("msg:"+$("#id").val()+":"+$(this).val())
		$(this).val("").focus()
	}
});
// 전송 버튼을 클릭시에 메시지 전송
$("#sndBtn").click(function(){
	wsocket.send("msg:"+$("#id").val()+":"+$("#msg").val())
	$("#msg").val("").focus()				
});

</script>

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>PMS</span></strong>. All Rights Reserved
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