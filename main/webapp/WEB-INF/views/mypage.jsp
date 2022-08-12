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
		$("#pwCor").hide()
		$("#pwDif").hide()		
		var pwPattern = /^(?=.*[a-z])(?=.*\d)[a-z0-9_-]{8,16}$/
		$("#pwChBtn").click(function(){
			if($("#currentPassword").val()!="${userInfo.pw}"){
				alert("현재 비밀번호가 일치하지 않습니다.")
				return
			}
			if($("#newPassword").val().length < 8 || $("#newPassword").val().length > 16 || !$("#newPassword").val().match(pwPattern)){
				alert("비밀번호는 8~16자 영문+숫자 조합입니다.");
				$("#newPassword").focus();
				return
			}
			if($("[name=pwCheck]").val() != "cor"){
				alert("새 비밀번호와 비밀번호 확인을 일치시켜주세요")
				return
			}
			$("#pwCForm").attr("action","${path}/changePw.do")
			$("#pwCForm").submit()
		})
		
		$("#renewPassword").keyup(function(){
		     var pw1 = $("#newPassword").val()
		     var pw2 = $("#renewPassword").val()
		     if(pw1 != '' && pw2 !='') {
		 		if(pw1 == pw2) {
		 			$("#pwCor").show()
		 			$("#pwDif").hide()
		 			$("#pwCor").css({"color":"green"})
		 			$("[name=pwCheck]").val("cor")
		 		} else {
		 			$("#pwDif").show()
		 			$("#pwCor").hide()
		 			$("#pwDif").css({"color":"red"})
		 			$("[name=pwCheck]").val("dif")
		 		}
		 	}
		})
		$("#newPassword").keyup(function(){
		     var pw1 = $("#newPassword").val()
		     var pw2 = $("#renewPassword").val()
		     if(pw1 != '' && pw2 !='') {
		 		if(pw1 == pw2) {
		 			$("#pwCor").show()
		 			$("#pwDif").hide()
		 			$("#pwCor").css({"color":"green"})
		 			$("[name=pwCheck]").val("cor")
		 		} else {
		 			$("#pwDif").show()
		 			$("#pwCor").hide()
		 			$("#pwDif").css({"color":"red"})
		 			$("[name=pwCheck]").val("dif")
		 		}
		 	}
		})
		$("#infoChBtn").click(function(){
			$("#infoCForm").attr("action","${path}/changeInfoMypage.do")
			$("#infoCForm").submit()
		})
		$("#fileUptBtn").click(function(){
			$("#inputFile").click()
		})
		$("#inputFile").change(function(){
			$("#infoCForm").attr("action","${path}/uptPfImg.do")
			$("#infoCForm").submit()
		})
		$("#fileDelBtn").click(function(){
			location.href="${path}/delPfImg.do"
		})
	});
	

</script>
<style type="text/css">
.mypageSchList:hover{
	cursor:pointer;
}
</style>
</head>
<body>
<jsp:include page="navi.jsp"/>

	<%-- main태그 안에 body 코드 작성 --%>
  <main id="main" class="main">
    <div class="pagetitle">
	  <h1>My Page<%--페이지 제목 입력 --%></h1>

      <nav> <%-- 페이지 경로 --%>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${path}/entire.do">Main</a></li>
          <li class="breadcrumb-item active">My Page</li>
        </ol>
      </nav>
    </div>

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
			<c:choose>
				<c:when test="${not empty profile.fname}">
					<img src="${path}/NiceAdmin/assets/img/profile/${profile.fname}" alt="Profile" class="rounded-circle">
				</c:when>
				<c:otherwise>
					<img src="${path}/NiceAdmin/assets/img/profile/default.png" alt="Profile" class="rounded-circle">
				</c:otherwise>
			</c:choose>
              <h2>${userInfo.name}</h2>
              <h3>${userInfo.dept}</h3>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">개인정보</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">개인정보 수정</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">상세정보</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이름</div>
                    <div class="col-lg-9 col-md-8">${userInfo.name}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">부서</div>
                    <div class="col-lg-9 col-md-8">${userInfo.dept}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">직급</div>
                    <div class="col-lg-9 col-md-8">${userInfo.position}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">주소</div>
                    <div class="col-lg-9 col-md-8">${userInfo.address}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생년월일</div>
                    <div class="col-lg-9 col-md-8"><fmt:formatDate value="${userInfo.birthdate}" pattern="yyyy-MM-dd"/></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">휴대폰 번호</div>
                    <div class="col-lg-9 col-md-8">${userInfo.hpnum}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${userInfo.email}</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form id="infoCForm" enctype="multipart/form-data" method="post">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">프로필 이미지</label>
                      <div class="col-md-8 col-lg-9">
						<c:choose>
							<c:when test="${not empty profile.fname}">
								<img src="${path}/NiceAdmin/assets/img/profile/${profile.fname}" alt="Profile" class="rounded-circle">
							</c:when>
							<c:otherwise>
								<img src="${path}/NiceAdmin/assets/img/profile/default.png" alt="Profile" class="rounded-circle">
							</c:otherwise>
						</c:choose>
                        <div class="pt-2">
                        	<input type="file" name="report" id="inputFile" style="display:none" />
                          <button type="button" class="btn btn-primary btn-sm" id="fileUptBtn" title="Upload new profile image"><i class="bi bi-upload"></i></button>
                          <button type="button" class="btn btn-danger btn-sm" id="fileDelBtn" title="Remove my profile image"><i class="bi bi-trash"></i></button>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="text" class="form-control" id="Email" value="${userInfo.email}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">주소</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address" type="text" class="form-control" id="Address" value="${userInfo.address}">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Birthdate" class="col-md-4 col-lg-3 col-form-label">생년월일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="birthdateS" type="date" class="form-control" id="Birthdate" value="<fmt:formatDate value="${userInfo.birthdate}" pattern="yyyy-MM-dd"/>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Hpnum" class="col-md-4 col-lg-3 col-form-label">휴대폰 번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="hpnum" type="text" class="form-control" id="Hpnum" value="${userInfo.hpnum}">
                      </div>
                    </div>
					<input type="hidden" name="userno" value="${userInfo.userno}"/>

                    <div class="text-center">
                      <button type="button" class="btn btn-primary" id="infoChBtn">변경</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form id="pwCForm">

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="cpw" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="pw" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호 확인</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="repw" type="password" class="form-control" id="renewPassword">
                        <div id="pwDif">비밀번호가 일치하지 않습니다.</div>
                        <div id="pwCor">비밀번호가 일치합니다.</div>
                      </div>
                    </div>
						<input type="hidden" name="pwCheck" value=""/>
						<input type="hidden" name="userno" value="${userInfo.userno}"/>
                    <div class="text-center">
                      <button type="button" class="btn btn-primary" id="pwChBtn">비밀번호 변경</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
		<div class="card">
            <div class="card-body">
              <h5 class="card-title">진행중인 일정</h5>

              <!-- Table with hoverable rows -->
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">프로젝트명</th>
                    <th scope="col">일정명</th>
                    <th scope="col">담당자</th>
                  </tr>
                </thead>
                <tbody>
                 
                <c:forEach var="scd" items="${userSList}" varStatus="sts">
                  <tr class="mypageSchList" onclick="goMain(${scd.pno})">
                    <th scope="row">${sts.count}</th>
                    <td>${scd.title}</td>
                    <td>${scd.sname}</td>
                    <td>${scd.name} ${scd.position}</td>
                  </tr>
                 </c:forEach>
                  
                </tbody>
              </table>
              <!-- End Table with hoverable rows -->

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
if("${proc}"!=""){
	if("${proc}"=="pwC"){
		alert("비밀번호가 변경되었습니다.")
		location.href="${path}/goMyPage.do"
	}
	if("${proc}"=="infoC"){
		alert("개인정보가 수정되었습니다.")
		location.href="${path}/goMyPage.do"
	}
	if("${proc}"=="uptImg"){
		alert("프로필 이미지가 업로드되었습니다.")
		location.href="${path}/goMyPage.do"
	}
	if("${proc}"=="delImg"){
		alert("프로필 이미지가 삭제되었습니다.")
		location.href="${path}/goMyPage.do"
	}
}
function goMain(pno){
	location.href="${path}/goMain.do?pno="+pno
}
<%--
$(".mypageSchList").click(function(){
	location.href="${path}/goMain.do"
})
--%>
</script>
</body>
</html>