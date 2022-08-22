<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<%--


 --%>
<head>
<meta charset="UTF-8">
</head>

<body>

  <main>
	  <c:if test="${param.lang eq 'ko'}">
      	<c:set var="setlang" value="ko" scope="session"/>
	  </c:if>
	  <c:if test="${param.lang eq 'en'}">
      	<c:set var="setlang" value="en" scope="session"/>
	  </c:if>
  </main>

</body>
<script type="text/javascript">

	location.href="${path}/entireDashboard.do?lang=${setlang}"

</script>

</html>