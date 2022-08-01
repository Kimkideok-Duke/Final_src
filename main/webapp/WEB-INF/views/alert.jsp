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
<title>Insert title here</title>
<style>
#card{
	text-align: center;
}
.box{
	margin:30px 0 20px 0;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
   $(document).ready(function(){
      <%-- 
      
      --%>   
   });
</script>
</head>

<body>
<jsp:include page="navi.jsp"/>
<h1>알림</h1>
	<div class="box"></div>
	    <div class="card" id="card">
	      <div class="card-body">
	        <table class="table">
	          <thead>
	            <tr>
	              <th scope="col">프로젝트</th>
	              <th scope="col">일정</th>
	              <th scope="col">알림내용</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	            	<!-- 프로젝트명 -->
	              <td>프로젝트명</td>
	              <!-- 일정명 -->
	              <td>일정명</td>
	              <!-- 마감 며칠전입니다.-->
	              <td>마감 4일전 입니다.</td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	    </div>
</body>
</html>