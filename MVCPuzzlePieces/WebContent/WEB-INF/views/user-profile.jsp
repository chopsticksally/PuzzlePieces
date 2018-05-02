<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h3 class="header">User: ${userLoggedIn.userName}</h3>
	<div class="container">
		<h4 class="header">Current Location</h4>
		<c:if test="${not empty userInfo }">
			<p>${userInfo.address.city }</p>
		</c:if>
	</div>
	<div>
		<h4 class="header">Current Inventory</h4>
		<c:forEach var="items" items="${inventoryItems}">
			<p>${items.puzzle.name }</p>
			<a href="userInventoryDetails.do?itemId=${items.id }"><img
				alt="${items.puzzle.name } Puzzle Photo"
				src="${items.puzzle.imageUrl }"></a>
			<a href="userInventoryDetails.do?itemId=${items.id }"><button
					class="btn">View Puzzle Details</button></a>


		</c:forEach>
		<div>
			<a href="addInventoryPage.do"><button class="btn">Add
					Inventory</button></a>
		</div>
	</div>
	<div>
		<h4 class="header">Requests Received</h4>
		<c:forEach var="req" items="${userRequests }">
		<c:if test="${req.active == true}">
			<p>Request for user: ${req.requestee.userName}</p>
			<p>${req.message }</p>
			<p>Request from: ${req.requester.userName }</p>
			<form action="replyToRequest.do" method="get">
    											<input type="hidden" value="${req.id}" name="id">
    											<input type="submit" value="Reply">
    											</form>
			<br>
			</c:if>
		</c:forEach>
	</div>
	<div>
		<h4 class="header">Requests Sent</h4>
		<c:forEach var="sentReq" items="${sentRequests }">
			<p>${sentReq.message }</p>
			<p>${sentReq.active }</p>
			<p>${sentReq.accepted }</p>
			<br>
		</c:forEach>
	</div>

	<div>
		<h4 class="header">Puzzles Borrowed</h4>
		<c:if test="${not empty borrows }">
			<c:forEach var="borrows" items="${borrows }">
				<p>${borrows.inventoryItem.puzzle.name }</p>
				<img src="${borrows.inventoryItem.puzzle.imageUrl }"
					alt="${borrows.inventoryItem.puzzle.name } Puzzle">
				<p>Borrow date: ${borrows.borrowDate }</p>
				<p>Return by: ${borrows.returnDate }</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty borrows }">No Borrowed Puzzles</c:if>
	</div>

	<div>
		<h4 class="header">User Ratings</h4>
		<c:if test="${not empty userRatings}">
		<h5>Your Rating: </h5>
			<c:forEach var="ratings" items="${userRatings }">
				<p>User that rated you: ${ratings.raterUser.userName}</p>
				<p>Rating they gave you: ${ratings.rating}</p>
				<p>Comment: ${ratings.comment}</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty userRatings}">No ratings available</c:if>
	</div>

	<div>
		<h4 class="header">User Submitted Ratings</h4>
		<c:if test="${not empty userSubmittedRatings}">
			<c:forEach var="submittedRatings" items="${userSubmittedRatings }">
				<p>User Rated: ${submittedRatings.ratedUser.userName}</p>
				<p>Gave this user: ${submittedRatings.rating}</p>
				<p>Comment: ${submittedRatings.comment}</p>
			</c:forEach>
		</c:if>
		<c:if test="${empty userSubmittedRatings}">No submitted ratings</c:if>
	</div>

	<jsp:include page="script.jsp" />

</body>
</html>