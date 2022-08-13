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
	});
	function chVal(sno){
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
	var auth = "${auth}"
	function updateProc(){
		if(auth=="pm" || auth=="admin"){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/uptScheduleByPM.do");
				$("form").submit();
			}
		}else{
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/uptSchedule.do");
				$("form").submit();
			}
		}
	}
	var pno = "${pno}"
	var proc = "${proc}"
	if(proc=="upt"){
		alert("수정성공!\n일정목록으로 이동합니다")
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
					console.log(gdata)
				})
			}
		})
      	data.addRows(dlist);
      var options = {
        height: "100%",
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
					진행도 : 
					<div class="progress">
	                	<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 36%" aria-valuenow="36" aria-valuemin="0" aria-valuemax="100">36%</div>
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
				<c:forEach var="schedule" items="${slist}">
				<tr onclick="chVal(${schedule.sno })"data-bs-toggle="modal" data-bs-target="#basicModal">
				<th scope="row" class="">${schedule.sno }</th>
				<td>${schedule.sname}</td>
				<td>${schedule.status}</td>
				<td>진행도 :
				<c:set var="status" value="" />
				<c:choose>
                <c:when test="${schedule.progress eq 100}">
                	<c:set var="status" value="success" /></c:when>
               	<c:when test="${schedule.progress > 50 and schedule.progress < 100}">
	               	<c:set var="status" value="warning" /></c:when>
				<c:otherwise>
					<c:set var="status" value="danger" /></c:otherwise>
                </c:choose>
				<div class="progress">
            	   	<div class="progress-bar progress-bar-striped bg-${status}" role="progressbar" style="width: ${schedule.progress}%" aria-valuenow="${schedule.progress}" aria-valuemin="0" aria-valuemax="100">${schedule.progress}%</div>
              	</div></td>
				<td><fmt:formatDate value="${schedule.startDate}" pattern="yyyy-MM-dd"/></td>
				<td><fmt:formatDate value="${schedule.endDate}" pattern="yyyy-MM-dd"/></td>
				<td>${schedule.budget}원</td>
				<td><img src="a00_com/images/comment.png" width="30" height="30" onclick="goComment(${schedule.sno})"/></td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
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
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <!-- 모달 내용 sname, status, progress, startDate, endDate, budget -->
			      <div class="modal-body">
			      <!-- 권한 체크해서 form 경로 변경, input 숨기기 -->
			  		<form id="uptSchedule" class="row g-3 needs-validation" novalidate>
			             <div class="row mb-3" style="padding-top:15px;">
			             <input type="hidden" id="sno" name="sno" value=""/>
			               <label for="inputText" class="col-sm-2 col-form-label">일정명</label>
			               <div class="col-sm-10">
			                 <input type="text" id="sname" name="sname" class="form-control" value="">
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">상태</label>
			               <div class="col-sm-10">
			                 <input type="text" id="status" name="status" class="form-control" value="" >
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">진행도</label>
			               <div class="col-sm-10">
			                 <input type="text" id="progress" name="progress" class="form-control" value="" >
			               </div>
			             </div>
						<div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">시작일</label>
			               <div class="col-sm-10">
			                 <input type="date" id="startDate" name="startDate_s" class="form-control" value="">
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">마감일</label>
			               <div class="col-sm-10">
			                 <input type="date" id="endDate" name="endDate_s" class="form-control" value="" >
			               </div>
			             </div>
			             <div class="row mb-3">
			               <label for="inputText" class="col-sm-2 col-form-label">예산</label>
			               <div class="col-sm-10">
			                 <input type="text" id="budget" name="budget" class="form-control" value="" >
			               </div>
			             </div>
			             	<button type="button" onclick="updateProc()" id="uptBtn" class="btn btn-primary">수정</button>
			              </form>
			           </div>
			     <!-- 모달 하단 -->      
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				      </div>
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
                  <h6>Filter</h6>
                </li>

                <li><a class="dropdown-item" href="#">Today</a></li>
                <li><a class="dropdown-item" href="#">This Month</a></li>
                <li><a class="dropdown-item" href="#">This Year</a></li>
              </ul>
            </div>

            <div class="card-body">
              <h5 class="card-title">타임라인 <span>| Today</span></h5>

              <div class="activity">

                <div class="activity-item d-flex">
                  <div class="activite-label">32 min</div>
                  <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                  <div class="activity-content">
                    Quia quae rerum <a href="#" class="fw-bold text-dark">explicabo officiis</a> beatae
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">56 min</div>
                  <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                  <div class="activity-content">
                    Voluptatem blanditiis blanditiis eveniet
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 hrs</div>
                  <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                  <div class="activity-content">
                    Voluptates corrupti molestias voluptatem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">1 day</div>
                  <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                  <div class="activity-content">
                    Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati voluptatem</a> tempore
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">2 days</div>
                  <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                  <div class="activity-content">
                    Est sit eum reiciendis exercitationem
                  </div>
                </div><!-- End activity item-->

                <div class="activity-item d-flex">
                  <div class="activite-label">4 weeks</div>
                  <i class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
                  <div class="activity-content">
                    Dicta dolorem harum nulla eius. Ut quidem quidem sit quas
                  </div>
                </div><!-- End activity item-->

              </div>

            </div>
          </div><!-- End Recent Activity -->

              <!-- 참가자 Accordion without outline borders -->
          <div class="card">
            <div class="card-body pb-0">
              <div class="vueel">
              <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header" id="flush-headingOne">
                    <button class="accordion-button collapsed card-title" type="button" @click="getlist" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                      참가자 <span>| Today</span>
                    </button>
                  </h2>
                  <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
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
                    </div>
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
                    <label for="id">사원번호</label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-floating">
                   <div id="chatArea">
                    <div class="form-control" id="chatMessageArea" style="height: 200px;"></div>
                    <label for="chatMessageArea">채팅 내용</label>
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
    </section>

  </main><!-- End #main -->

<script type="text/javascript">
function goSchedule(){
	location.href="${path}/goSchedule.do"
}


function goComment(sno){
	location.href="${path}/commentList.do?sno="+sno;
	
}
var wsocket;
$(document).ready(function(){
	$("#enterBtn").click(function(){
		if(confirm("채팅방 접속합니다.")){
			conn();
			
		}
	});
	// 아이디 입력 후,  enter 키를 입력시도 접속
	$("#id").keyup(function(){
		if(event.keyCode==13){
			conn();
		}
	});
	
	$("#exitBtn").click(function(){
		if(confirm("접속을 종료하시겠습니까?")){
			wsocket.send("msg:"+$("#id").val()+":접속 종료 했습니다.")
			wsocket.close();
			// 서버 handler public void afterConnectionClosed()
			// 와 연동
		}
	});
	
});
function conn(){
	wsocket = new WebSocket("ws:localhost:7080/${path}/chat-ws.do")
	wsocket.onopen=function(evt){ // 접속하는 핸들러 메서드와 연결
		console.log(evt)
		// 능동적으로 서버에 소켓통신으로 메시지를 보내는 것..
		wsocket.send("msg:"+$("#id").val()+":연결 접속했습니다.")
		// "msg:himan:연결접속했습니다."
		//  msg:전송자:메시지명
		//  msg:그룹명:전송자:메시지  (단일 chatting/그룹 chatting)
		
		
	}
	// 메시지를 받을 때, 처리되는 메서드
	// 서버에서 push방식으로 메시지를 전달 받는데..
	/*
	# 참고
	1. webstorage 활용
		1) 메시지 내용 임시 저장
		2) 로그인한 id 임시 저장.
		
	
	
	*/
	wsocket.onmessage=function(evt){
		
		var msg = evt.data
		console.log(msg)
		if(msg.substring(0,4)=="msg:"){
			// mgs:그룹명:전송자:메시지  (단일 chatting/그룹 chatting)
			// 그룹에 해당할 때만 메시지를 받아서 처리하게 처리..
			
			
			// msg: 를 제외한 모든 문자열을 추출
			var revMsg = msg.substring(4)
			console.log("#메시지 받기#")
			console.log(msg)
			$("#chatMessageArea").append(revMsg+"<br>")	
			// 자동 scolling 처리 로직
			// 1.  전체 charMessageArea의 입력된 최대 높이 구하기
			// 2. 포함하고 있는 div의 scollTop을 통해 최대한 내용으로 scrolling 하기
			$("#chatArea").scrollTop(ma+=20);
			console.log("chatArea길이:"+ma)
		}
	}
	var ma = parseInt($("#chatMessageArea").height());	
	// 접속을 종료 처리할 때
	wsocket.onclose=function(){
		alert($("#id").val()+"접속 종료합니다.")
		$("#chatMessageArea").val("")
		
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