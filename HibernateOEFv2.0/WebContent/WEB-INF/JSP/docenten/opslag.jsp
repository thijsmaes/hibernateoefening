<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" />
<!doctype html>
<html lang="nl">
<head>
<title>Opslag</title>
<link rel="stylesheet" href="${contextPath}/styles/default.css" />
</head>
<body>
	<h1>Opslag</h1>
	<c:url value="/docenten/opslag.htm" var="opslagURL">
		<c:param name="docentNr" value="${param.docentNr}" />
	</c:url>
	<form action="${opslagURL}" method="post">
		<label>Percentage: <input name="percentage" size="6" value="${param.percentage}" /></label> 
		<input type="submit" value="Opslag" />
	</form>
	<c:import url="/WEB-INF/JSP/fouten.jsp" />
</body>
</html>