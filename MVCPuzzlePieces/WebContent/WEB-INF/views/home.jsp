<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />

	<div class="container-fluid bg-3 text-center">
		<c:if test="${not empty inventoryItems }">
			<h1 class="header">Welcome!</h1>
			<c:set var="count" value="0" scope="page" />
			<div class="row">
				<c:forEach var="ii" items="${inventoryItems }">
					<c:if test="${count % 3 == 0}">
			</div>
			<div class="row">
				<div class="col-sm-4">

					<p>${ii.puzzle.name }</p>
					<img alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
						width="295" height="260">
				</div>
		</c:if>
		<c:if test="${count % 3 != 0}">
			<div class="col-sm-4">

				<p>${ii.puzzle.name }</p>
				<img alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
					width="295" height="260">
			</div>
		</c:if>
		<c:set var="count" value="${count + 1}" scope="page" />
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${empty inventoryItems }">No Puzzles Available for Exchange</c:if>


	<jsp:include page="script.jsp" />
</body>
</html>








