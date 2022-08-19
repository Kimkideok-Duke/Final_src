<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<% String userno=request.getParameter("userno"); %>
<script>
	$(document).ready(function(){
		var vm01 = new Vue({
			el:".vueeltag",
			data:{msg:"리스트 출력", 
				art:[]
			},
			methods:{
				getartlist:function(){
					this.getart()
				},
				getart:function(){
					var vm01 = this
					$.ajax({
						url:"${path}/getAlertnavi.do",
						dataType:"json",
						async:false,
						success:function(data){
							vm01.art = data.art
							console.log("데이터")
							console.log(data.art)
						},
						error:function(err){
							console.log(err)
							alert("실패")
						}	
					})
				}
			}
		})
	});
</script>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${path}/entireDashboard.do?lang=ko" class="logo d-flex align-items-center">
        <img src="NiceAdmin/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Fine PMS</span>
      </a>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
		
		<!-- Multi Language -->
		<li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="ri-global-line"></i>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow multiLang">
            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/entireDashboard.do?lang=ko">
                <img alt="ko" src="img/free-icon-south-korea-2151378.png" width="30">
                <span><h6><spring:message code="ko"/></h6></span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
            
            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/entireDashboard.do?lang=en">
                <img alt="ko" src="img/free-icon-united-states-206626.png" width="30">
                <span><h6><spring:message code="en"/></h6></span>
              </a>
            </li>
          </ul><!-- End Notification Dropdown Items -->

        </li><!-- Multi Language End -->

        <li class="nav-item dropdown">
		<div class="vueeltag">
          <a class="nav-link nav-icon" href="#" @click="getartlist" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number"></span>
          </a><!-- End Notification Icon -->
          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications" style="width:300px">
            <li class="dropdown-header">
              알림
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <div v-for="(al, idx) in art">
                <h4>프로젝트 / {{al.title}}</h4>
                <p>{{al.sname}} 마감 {{al.dday}}일 남았습니다.<p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="${path}/getAlert.do?userno=<%=(String)session.getAttribute("userno")%>">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->
		</div>
        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
			<c:choose>
				<c:when test="${not empty pfImg}">
					<img src="${path}/NiceAdmin/assets/img/profile/${pfImg}" alt="Profile" class="rounded-circle">
				</c:when>
				<c:otherwise>
					<img src="${path}/NiceAdmin/assets/img/profile/default.png" alt="Profile" class="rounded-circle">
				</c:otherwise>
			</c:choose>
            <span class="d-none d-md-block dropdown-toggle ps-2">${name}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${name}</h6>
              <span>${dept}</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/goMyPage.do">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${path}/logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/entireDashboard.do">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <!-- <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-calendar-plus"></i><span>Plan</span>
        </a>
      </li> --><!-- End 일정관리 Nav -->
	  
      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/getAlert.do?userno=<%=(String)session.getAttribute("userno")%>">
          <i class="bi bi-bell"></i><span>Notifications</span>
        </a>
      </li><!-- End 알림 Nav -->
	  <c:if test="${not empty param.pno}">
      <%--<li class="nav-item">
        <a class="nav-link collapsed" href="${path}/getGantt.do?pno=${param.pno}">
          <i class="bi bi-bar-chart"></i><span>Gantt Chart</span></i>
        </a>
      </li> --%><!-- End 간트차트 Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/calendar.do">
          <i class="bi bi-calendar3"></i><span>fullcalendar</span>
        </a>
      </li><!-- End 풀캘린더 Nav -->
      </c:if>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/goMyPage.do">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->
	<% if(!((String)session.getAttribute("auth")).equals("user")&&!((String)session.getAttribute("auth")).equals("pm")){ %>
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#admin-nav" data-bs-toggle="collapse"  href="#">
          <i class="bi bi-person-check"></i>
          <span>Manager</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="admin-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <%if(((String)session.getAttribute("auth")).equals("um") || ((String)session.getAttribute("auth")).equals("admin")){ %>
          <li>
            <a href="${path}/goUmPage.do">
              <i class="bi bi-circle"></i><span>User Management</span>
            </a>
          </li>
          <%} %>
          <%-- <%if(!((String)session.getAttribute("auth")).equals("um")){ %>
          <li>
            <a href="${path}/goAdminPage.do">
              <i class="bi bi-circle"></i><span>Project Management</span>
            </a>
          </li>
          <%} %> --%>
        </ul>
      </li><%}%><!-- End 관리자페이지 Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->