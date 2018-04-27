<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Puzzle Pieces</title>
</head>
<body>
	<jsp:include page="public-navbar.jsp" />
	<h1>Puzzle Pieces</h1>
	<div class="container">
		<c:if test="${not empty inventoryItems }">
			<c:forEach var="ii" items="${inventoryItems }"></c:forEach>
			<p>${ii.puzzle.name }</p>
			
			<c:if test="userLoggedIn">
				<a href="puzzleDetails.do"> <img
					alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"></a>
			</c:if>

		</c:if>
		<c:if test="${empty inventoryItems }">No Puzzles Available for Exchange</c:if>
	</div>


	<jsp:include page="script.jsp" />
</body>
</html>