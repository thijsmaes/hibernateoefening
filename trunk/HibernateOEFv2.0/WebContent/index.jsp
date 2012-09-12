<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" />
<!doctype html>
<html lang="nl">
<head>
<title>JPA website</title>
<link rel="stylesheet" href="${contextPath}/styles/default.css" />
</head>
<body>
	<header>
		<h1>JPA website</h1>
	</header>
	<nav>
	<ul>
	<li><a href="<c:url value='/docenten/zoeken.htm'/>">Docent zoeken</a></li>
	</ul>
	</nav>
</body>
</html>