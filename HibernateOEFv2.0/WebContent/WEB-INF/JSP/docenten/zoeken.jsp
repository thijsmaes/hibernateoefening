<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="nl">
<head>
<title>Docent zoeken</title>
<link rel="stylesheet" href="${contextPath}/styles/default.css"/>
</head>
<body>
<h1>Docent zoeken</h1>
<form action="<c:url value='docenten/zoeken.htm'/>" method="get">
<label>Nummer:
<input name="docentNr" size="6" value="${param.docentNr}"/></label>
<input type="submit" value="zoeken"/>
</form>

<c:if test="${not empty docent}">
<div>${docent.naam}, wedde: <fmt:formatNumber value="${docent.wedde}"/> </div>
</c:if>
<c:import url="/WEB-INF/JSP/fouten.jsp"/>
</body>
</html>