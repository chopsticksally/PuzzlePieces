<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h3 class="header">User: ${userLoggedIn.userName}</h3>
	<div class="container bg-3 text-center">

		<div class="containerbg-3 text-center">

			<h4 class="header">Current Location</h4>
			<c:if test="${not empty userInfo }">
				<p>${userInfo.address.city },${userInfo.address.state}</p>
			</c:if>
		</div>
		<div>
			<h4 class="header">Current Inventory</h4>



			<div>
				<a href="addInventoryPage.do"><button
						class="btn btn-info btn-lg btn-block">Add Inventory</button></a>
			</div>

			<c:forEach var="items" items="${inventoryItems}">

				<div class="container-fluid bg-2 text-center ">
					<p>${items.puzzle.name }</p>
					<img type="center" alt="${items.puzzle.name } Puzzle Photo"
						src="${items.puzzle.imageUrl }" width="295" height="260"> <br>

					<p>
						<a href="userInventoryDetails.do?itemId=${items.id }"><button
								class="btn">View Puzzle Details</button></a>
					</p>
				</div>
		</div>
		</c:forEach>



	</div>
	<div>
		<div class="container bg-5 text-left">
			<h4 class="header">Requests Received</h4>
			<c:forEach var="req" items="${userRequests }">
				<c:if test="${req.active == true}">
					<p>Request from: ${req.requester.userName }</p>
					<p>User Comment: ${req.message }</p>
					<p>User is Requesting: ${req.inventoryItem.puzzle.name }</p>
					<form action="replyToRequest.do" method="get">
						<input type="hidden" value="${req.id}" name="id"> <input
							type="submit" value="Reply">
					</form>
					<br>
				</c:if>
			</c:forEach>
		</div>
		<div class="container bg-5 text-left">
			<h4 class="header">Requests Sent</h4>
			<c:forEach var="sentReq" items="${sentRequests }">


				<br>
				<hr>
				<p>User Request Sent To: ${sentReq.requestee.userName }</p>
				<p>Message: ${sentReq.message }</p>
				<p>Requested Puzzle Name: ${sentReq.inventoryItem.puzzle.name }</p>
				<br>
			</c:forEach>
		</div>

		<div>
			<h4 class="header">Puzzles Borrowed</h4>
			<c:if test="${not empty borrows }">
				<c:forEach var="borrows" items="${borrows }">
					<div class="container-fluid">
						<p>Borrowed From: ${borrows.inventoryItem.owner.userName }</p>
						<br>
						<p>${borrows.inventoryItem.puzzle.name }</p>
						<img src="${borrows.inventoryItem.puzzle.imageUrl }"
							alt="${borrows.inventoryItem.puzzle.name } Puzzle">
						<p>
							Borrow date:
							<fmt:formatDate value="${borrows.borrowDate }"
								pattern="yyyy-MM-dd" />
						</p>
						<p>
							Return by:
							<fmt:formatDate value="${borrows.returnDate }"
								pattern="yyyy-MM-dd" />
						</p>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty borrows }">No Borrowed Puzzles</c:if>
		</div>
	</div>
	<div>
		<h4 class="header">User Ratings</h4>
		<c:if test="${not empty userRatings}">
			<div class="container bg-5 text-center">
				<h5>Your Rating: ${rating } out of ${fn:length(userRatings)}
					ratings</h5>
			</div>
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

	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />

</body>
</html>