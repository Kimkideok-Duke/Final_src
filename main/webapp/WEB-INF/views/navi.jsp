<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="NiceAdmin/assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Fine PMS</span>
      </a>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">1</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Lorem Ipsum</h4>
                <p>Quae dolorem earum veritatis oditseno</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="NiceAdmin/assets/img/profile/default.png" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">${name}</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${name}</h6>
              <span>${userInfo.dept}</span>
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

      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-calendar-plus"></i><span>Plan</span>
        </a>
      </li><!-- End 일정관리 Nav -->
	  <%--<c:if test="${not empty param.pno}"> --%>
      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/goAlert.do">
          <i class="bi bi-bell"></i><span>Notifications</span>
        </a>
      </li><!-- End 알림 Nav -->
	  
      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/goGnatt.do">
          <i class="bi bi-bar-chart"></i><span>Gantt Chart</span></i>
        </a>
      </li><!-- End 간트차트 Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" href="#">
          <i class="bi bi-calendar3"></i><span>fullcalendar</span>
        </a>
      </li><!-- End 풀캘린더 Nav -->
      <%-- </c:if>--%>

      <li class="nav-item">
        <a class="nav-link collapsed" href="${path}/goMyPage.do">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->
	<% if(!((String)session.getAttribute("auth")).equals("user")){ %>
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
          <%if(!((String)session.getAttribute("auth")).equals("um")){ %>
          <li>
            <a href="${path}/goAdminPage.do">
              <i class="bi bi-circle"></i><span>Project Management</span>
            </a>
          </li>
          <%} %>
        </ul>
      </li><%}%><!-- End 관리자페이지 Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->