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
		$("#newAccBtn").click(function(){
			if($("[name=name]").val()==""){
				alert("신규사원 이름을 입력해주세요")
				$("[name=name]").focus()
				return
			}
			if($("[name=email]").val()==""){
				alert("신규사원 이메일을 입력해주세요")
				$("[name=email]").focus()
				return
			} 
			var name = $("[name=name]").val()
			var email = $("[name=email]").val()
			$.ajax({
				url:"${path}/addAccount.do",
				data:"name="+name+"&email="+email,
				dataType:"json",
				success:function(data){
					if(data.proc=="userI"){
						alert("신규사원이 등록되었습니다.\n사원번호 : "+data.newUser.userno+"\n임시비밀번호 :"+data.newUser.pw)
						$("[name=name]").val("")
						$("[name=email]").val("")
						acclistajax()
					}
				}
			})
		})
		acclistajax()
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val("1");
			acclistajax()
		})
		$("[name=userno]").keyup(function(){
			acclistajax()
		})
		$("[name=name2]").keyup(function(){
			acclistajax()
		})
	});
	var auth = "<%= (String)session.getAttribute("auth") %>"
	if(auth != "um" && auth != "admin"){
		alert("접근이 불가한 페이지입니다.")
		location.href="${path}/entireDashboard.do"
	}
	function acclistajax(){
		var curPage = $("[name=curPage]").val()
		var pageSize = $("[name=pageSize]").val()
		var userno = $("[name=userno]").val()
		var name = $("[name=name2]").val()
		$.ajax({
			url:"${path}/accountList.do",
			data:"curPage="+curPage+"&pageSize="+pageSize+"&userno="+userno+"&name="+name,
			dataType:"json",
			success:function(data){
				var alist = data.accList
				var addHTML = "";
				$(alist).each(function(idx, acc){
					addHTML+="<tr><td>"+(idx+1)+"</td><td>"+acc.userno+"</td><td>"+
					acc.name+"</td><td>"+acc.dept+"</td><td>"+acc.position+
						"</td><td><button type='button' class='btn btn-outline-primary'  data-bs-toggle='modal' data-bs-target='#verticalycentered'>수정</button></td></tr>"
				})
				$("#accList").html(addHTML)
				var accountSch = data.accountSch
				var addHTML2 = ""; 
				var isActive = "";
				var startB = accountSch.startBlock
				var endB = accountSch.endBlock
				addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+startB+')">Previous</a></li>'
				for(var cnt=startB; cnt<=endB; cnt++){
					if(accountSch.curPage==cnt){
						isActive='active'
					}else{
						isActive=''
					}
					addHTML2 += '<li class="page-item"><a class="page-link '+isActive+'" href="javascript:goPage('+cnt+')">'+cnt+'</a></li>' 
				}
				addHTML2 += '<li class="page-item"><a class="page-link" href="javascript:goPage('+endB+')">Next</a></li>'
				console.log(addHTML2)
				$("#acclistBlock").html(addHTML2)

			}
		})
	}

</script>
</head>
<body>
<jsp:include page="navi.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
	  <h1>User Management</h1>

      <nav> 
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${path}/entire.do">Main</a></li>
          <li class="breadcrumb-item">Manager</li>
          <li class="breadcrumb-item active">User Management</li>
        </ol>
      </nav>
    </div>
   <div class="row">
    <div class="col-lg-6">
         <div class="card">
            <div class="card-body">
              <h5 class="card-title">신규 사원 등록</h5>

              <!-- Floating Labels Form -->
              <form class="row g-3 needs-validation" novalidate>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input name="name" type="text" class="form-control" id="floatingName" placeholder="Your Name" required>
                    <label for="floatingName">이름</label>
	                  <div class="invalid-feedback">
	                    필수 입력정보 입니다.
	                  </div>
                  </div>

                </div>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input name="email" type="email" class="form-control" id="floatingEmail" placeholder="Your Email" required>
                    <label for="floatingEmail">이메일</label>
	                  <div class="invalid-feedback">
	                    필수 입력정보 입니다.
	                  </div>
                  </div>
                </div>
                
                <div class="text-center">
                  <button type="button" id="newAccBtn" class="btn btn-primary">신규사원 등록</button>
                </div>
              </form><!-- End floating Labels Form -->

            </div>
          </div>
	</div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">인원 현황 차트</h5>

              <!-- Donut Chart -->
              <div id="donutChart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#donutChart"), {
                    series: [44, 55, 13, 43, 22],
                    chart: {
                      height: 250,
                      type: 'donut',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['총무부', '회계부', '개발부', '인사부', '홍보부'],
                  }).render();
                });
              </script>
              <!-- End Donut Chart -->

            </div>
          </div>
        </div>
       </div>

    <div class="col-lg-12">

		<div class="card">
            <div class="card-body">
              <h5 class="card-title">전체 인원 현황</h5>
			  <form class="row g-3" method="post" name="schUserForm">
			  	<input type="hidden" name="curPage" value="0">
                <div class="col-md-4">
                  <label for="inputUserno" class="form-label">사원번호</label>
                  <input type="text" name="userno" class="form-control" id="inputUserno">
                </div>
                <div class="col-md-4">
                  <label for="inputName" class="form-label">이름</label>
                  <input type="text" name="name2" class="form-control" id="inputName">
                </div>
                <div class="col-md-2">
	                <div class="form-floating mb-3">
	                  <select name="pageSize" class="form-select" id="floatingSelect" aria-label="Floating label select example">
	                    <option>5</option>
	                    <option>10</option>
	                    <option>25</option>
	                    <option>50</option>
	                  </select>
	                  <label for="floatingSelect">총 : @@건</label>
	                </div>
				</div>
              </form>
         <script type="text/javascript">
         	// 선택된 페이지 크기 설정
         	if("${accountSch.pageSize}"==""){
         		$("[name=pageSize]").val("10");
         	}else{
         		$("[name=pageSize]").val("${accountSch.pageSize}");
         	}
         </script>
              <!-- Table with hoverable rows -->
              <table class="table table-hover">
			      <col width="5%">
			      <col width="20%">
			      <col width="20%">
			      <col width="20%">
			      <col width="20%">
			      <col width="200px">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">사원번호</th>
                    <th scope="col">이름</th>
                    <th scope="col">부서</th>
                    <th scope="col">직급</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody id="accList">
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->
            </div>
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center" id="acclistBlock">

                </ul>
              </nav>
              <script type="text/javascript">
              	function goPage(cnt){
              		$("[name=curPage]").val(cnt);
         
              	}
              </script>
      	</div>
    </div>
	<div class="modal fade" id="verticalycentered" tabindex="-1">
       <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">사원정보 수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <br>
           <div class="modal-body">
			  <form name="uptForm" class="row g-3 needs-validation" novalidate>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">이름</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" required>
	                  <div class="invalid-feedback">
	                    필수 입력정보 입니다.
	                  </div>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">부서</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">직급</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control">
                  </div>
                </div>

                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">권한</label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example">
                      <option>권한 선택</option> 
                      <option value="1">일반 사용자</option>
                      <option value="2">인사 관리자</option>
                      <option value="3">프로젝트 관리자</option>
                      <option value="4">총 관리자</option>
                    </select>
                  </div>
                </div>
             <button type="submit" class="btn btn-primary">수정</button>
              </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-danger" >삭제</button>         
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
           </div>
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
	<script type="text/javascript">
		function goPage(cnt){
			$("[name=curPage]").val(cnt);
			acclistajax()
		}
	</script>
</body>
</html>