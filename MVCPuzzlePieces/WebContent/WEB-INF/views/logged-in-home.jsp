<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Welcome!</h1>
	<div class="container">
		<c:if test="${not empty inventoryItems }">
			<c:forEach var="ii" items="${inventoryItems }">
				<p>
					<a href="puzzle-details.do?puzzle=${ii.id }"> ${ii.puzzle.name }</a>
				</p>
				<p>
					<img alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }">
				</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty inventoryItems }">No Puzzles Available for Exchange</c:if>
	</div>
	<jsp:include page="script.jsp" />

</body>
</html>