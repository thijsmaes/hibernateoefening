<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath"
	value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="nl">
<head>
<title>Docent zoeken</title>
<link rel="stylesheet" href="${contextPath}/styles/default.css" />
</head>
<body>
	<h1>Docent zoeken</h1>
	<form action="<c:url value='/docenten/zoeken.htm'/>" method="get">
		<label>Nummer: <input name="docentNr" size="6"
			value="${param.docentNr}" /></label> <input type="submit" value="zoeken" />
	</form>

	<c:if test="${not empty docent}">
		<div>
			${docent.naam}, wedde:
			<fmt:formatNumber value="${docent.wedde}" />
			<img src="${contextPath}/images/${docent.geslacht}.png"
				alt="${docent.geslacht}" title="${docent.geslacht}" />
		</div>
		<c:url value="/docenten/verwijderen.htm" var="verwijderenURL">
			<c:param name="docentNr" value="${docent.docentNr}" />
		</c:url>
		<h2>Acties</h2>
		<form action="${verwijderenURL}" method="post">
			<input type="submit" value="verwijderen" />
		</form>
		<form action="<c:url value='/docenten/opslag.htm'/>" method="get">
			<input type="hidden" name="docentNr" value="${docent.docentNr}" /> 
			<input type="submit" value="Opslag" />
		</form>
	</c:if>
	<c:import url="/WEB-INF/JSP/fouten.jsp" />
</body>
</html>