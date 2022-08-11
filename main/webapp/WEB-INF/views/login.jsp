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
<meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>로그인</title>
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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
	function setCookie(name, value, expireDay) {
		var today = new Date();
		today.setDate(today.getDate() + expireDay);
		document.cookie = name + '=' + escape(value) + '; path=/; expires='
			+ today.toGMTString() + ';';
	}
	function getCookie(name) {
		var cook = document.cookie + ';';
		var idx = cook.indexOf(name, 0);
		var val = '';
		if (idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf('=', 0) + 1;
			end = cook.indexOf(';', begin);
			val = unescape(cook.substring(begin, end));
		}
		return val;
	}
	function isEmpty(arg){
		if(arg == "" || arg == null || arg == undefined || 
			(arg != null && typeof arg == "object" && !Object.keys(arg).length)){
			return true;
		}
		return false;
	}
	$(document).ready(function(){
		<%-- 
      
		--%>   
		$("[name=loginBtn]").click(function(){
			loginfunc()
		})
		$("#yourPassword").keyup(function(){
			if(event.keyCode==13){
				loginfunc()
			}
		})
		$("#yourUsername").keyup(function(){
			if(event.keyCode==13){
				loginfunc()
			}
		})

	});
	function loginfunc(){
		if($("#yourUsername").val()==""){
			alert("사원번호를 입력해주세요")
			return
		}
		if($("#yourPassword").val()==""){
			alert("비밀번호를 입력해주세요")
			return
		}
		var saveId = document.querySelector("[name=check_saveid]");
		if(saveId.checked){
			setCookie('saveId', $("#yourUsername").val(), 3);
		} else {
			setCookie('saveId', 0, -1);
		}
		$("form").submit();
	}
	if("${passVal}"=="N"){
		alert("존재하지 않는 사원번호입니다.")
		location.href="${path}/loginPage.do"
	}
	if("${passVal}"=="P"){
		location.href="${path}/entireDashboard.do"
	}
	if("${passVal}"=="B"){
		alert("비밀번호가 일치하지 않습니다.")
		location.href="${path}/loginPage.do"
	}
	
</script>
</head>
<body>
  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="${path}/loginPage.do" class="logo d-flex align-items-center w-auto">
                  <img src="NiceAdmin/assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">Fine PMS</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login</h5>
                    <p class="text-center small">사원번호 & 비밀번호를 입력하세요</p>
                  </div>

                  <form action="${path}/loginCheck.do" method="post" class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label" value="${param.userno}">사원번호</label>
                      <div class="input-group has-validation ">
                        <input type="text" name="userno" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">사원번호를 입력하세요</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <input type="password" name="pw" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력하세요</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="check_saveid" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">아이디 저장</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="button" name="loginBtn">Login</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0 text-center">비밀번호를 잊으셨나요? <a href="${path}/pwPage.do">비밀번호 찾기</a></p>
                    </div>
                  </form>

                </div>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->
<script type="text/javascript">
var cookie_id = getCookie('saveId');
if(!isEmpty(cookie_id)){
	var id = document.querySelector("[name=userno]");
	var saveId = document.querySelector("[name=check_saveid]");
	id.value = cookie_id;
	saveId.checked = true;
}
</script>
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