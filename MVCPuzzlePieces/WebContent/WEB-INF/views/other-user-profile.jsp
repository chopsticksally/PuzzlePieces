<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h3 class="header">User: ${userInfo.user.userName}</h3>
	<div class="container bg-3 text-center">
		<h4 class="header">Current Location</h4>
		<c:if test="${not empty userInfo }">
			<p>${userInfo.address.city }, ${userInfo.address.state}</p>
		</c:if>
	</div>
	<div>
		<h4 class="header">Current Inventory</h4>
		<c:forEach var="items" items="${inventoryItems}">
		 <div class="container-fluid bg-2 text-center"> 
   <p> Puzzle name: ${items.puzzle.name }</p>
   <p>Puzzle Id#: ${items.id}</p>
   <p>Condition:  ${items.condition}</p>
    <img alt="stuuff" src="${items.puzzle.imageUrl }"width="295" height="260">
			<form action="puzzleDetails.do" method="get">
				<input type="hidden" value="${items.id }" name="puzzle"> <input
					type="submit" value="View Puzzle Details!">
			</form>
		</c:forEach>
	</div>


	<div>
		<h4 class="header">Puzzles Borrowed</h4>
		<c:if test="${not empty borrows }">
			<c:forEach var="borrow" items="${borrows }">
			<div class="container-fluid text-left">
				<p>${borrow.inventoryItem.puzzle.name }</p>
				<img src="${borrow.inventoryItem.puzzle.imageUrl }"
					alt="${borrow.inventoryItem.puzzle.name } Puzzle">
				<p>Borrow date:<fmt:formatDate value="${borrow.borrowDate }" pattern="yyyy-MM-dd"/></p>
				<p>Return by:<fmt:formatDate value="${borrow.returnDate }" pattern="yyyy-MM-dd"/></p>
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
		<h5>${userInfo.user.userName}'s Rating: ${rating } out of ${fn:length(userRatings)} ratings</h5>
		</div>
		<div class="container bg-5 text-left">
			<c:forEach var="ratings" items="${userRatings }">
				<p>User that Rated: ${ratings.raterUser.userName}</p>
				<p>Rating: ${ratings.rating}</p>
				<p>Comment: ${ratings.comment}</p>
				<hr><br>
			</c:forEach>
		</c:if>
		<c:if test="${empty userRatings}">No ratings available</c:if>
		</div>
		<form action="userRatingPage.do", method="get">
		<input type="hidden" value=${userInfo.user.id } name="id">
		<input type="submit" value="Rate This User!">
		</form>
	</div>


	<jsp:include page="script.jsp" />

</body>
</html>