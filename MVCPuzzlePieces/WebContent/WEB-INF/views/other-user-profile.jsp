<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h3 class="header">User: ${userInfo.user.userName}</h3>
	<div class="container">
		<h4 class="header">Current Location</h4>
		<c:if test="${not empty userInfo }">
			<p>${userInfo.address.city }</p>
		</c:if>
	</div>
	<div>
		<h4 class="header">Current Inventory</h4>
		<c:forEach var="items" items="${inventoryItems}">
    ${items.puzzle.name }
    ${items.id}
    ${items.condition}
    <img alt="stuuff" src="${items.puzzle.imageUrl }">
			<form action="puzzleDetails.do" method="get">
				<input type="hidden" value="${items.id }" name="puzzle"> <input
					type="submit" value="View Puzzle Details!">
			</form>
		</c:forEach>
	</div>


	<div>
		<h4 class="header">Puzzles Borrowed</h4>
		<c:if test="${not empty borrows }">
			<c:forEach var="borrows" items="${borrows }">
				<p>${borrows.inventoryItem.puzzle.name }</p>
				<img src="${borrows.inventoryItem.puzzle.imageUrl }"
					alt="${borrows.inventoryItem.puzzle.name } Puzzle">
				<p>${borrows.borrowDate }</p>
				<p>${borrows.returnDate }</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty borrows }">No Borrowed Puzzles</c:if>
	</div>

	<div>
		<h4 class="header">User Ratings</h4>
		<c:if test="${not empty userRatings}">
		<h5>${userInfo.user.userName}'s Rating: ${rating } out of ${fn:length(userRatings)} ratings</h5>
			<c:forEach var="ratings" items="${userRatings }">
				<p>User that Rated: ${ratings.raterUser.userName}</p>
				<p>Rating: ${ratings.rating}</p>
				<p>Comment: ${ratings.comment}</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty userRatings}">No ratings available</c:if>
		<form action="userRatingPage.do", method="get">
		<input type="hidden" value=${userInfo.user.id } name="id">
		<input type="submit" value="Rate This User!">
		</form>
	</div>


	<jsp:include page="script.jsp" />

</body>
</html>