<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Puzzle Pieces</title>
</head>
<body>
	<jsp:include page="public-navbar.jsp" />
	<div class="container">
		<c:if test="${not empty puzzle }">
			<c:forEach var="p" items="${puzzle }"></c:forEach>
			<p>${p.name }</p>
			<a href="puzzleDetails.do"> <img
				alt="${puzzle.name } Puzzle Photo" src="${p.imageUrl }"></a>
		</c:if>
		<c:if test="${empty puzzle }">No Puzzles Available for Exchange</c:if>
	</div>


	<jsp:include page="script.jsp" />
</body>
</html>