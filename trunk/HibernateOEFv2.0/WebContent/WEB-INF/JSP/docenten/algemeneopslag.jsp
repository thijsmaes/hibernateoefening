<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" />
<!doctype html>
<html lang="nl">
<head>
<title>Algemene opslag docenten</title>
<link rel="stylesheet" href="${contextPath}/styles/default.css" />
</head>
<body>
	<h1>Algemene opslag docenten</h1>
	<form action="<c:url value='/docenten/algemeneopslag.htm'/>" method="post">
		<label>Percentage <input name="percentage" size="3"
			maxlength="3" value="${param.percentage}" /></label> <label>Tot en
			met wedde: <input name="totEnMetWedde" value="${param.totEnMetWedde}" />
		</label> <input type="submit" value="Opslag" />
	</form>
	<c:import url="/WEB-INF/JSP/fouten.jsp" />
</body>
</html>