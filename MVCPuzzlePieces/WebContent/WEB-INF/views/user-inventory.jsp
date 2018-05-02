<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<h1 class="header">Inventory name: ${item.puzzle.name}</h1>
		<img alt="${item.puzzle.name } Puzzle Photo"
			src="${item.puzzle.imageUrl }">
		<p>Condition: ${item.condition}</p>
		<p>Puzzle Size: ${item.puzzle.size}</p>
		<p>Category: ${item.puzzle.categories[0].name}</p>
		<p>Rating: ${rating} out of ${fn:length(puzzleRatings) } ratings</p>
		<p>Ratings for this Puzzle</p>
		<c:if test="${fn:length(puzzleRatings) gt 0}">
		<c:forEach var="rating" items="${puzzleRatings}">
		<p>User who rated: ${rating.user.userName }</p>
		<p>Gave a rating of: ${rating.rating }</p>
		<p>Here's the comment: ${rating.comment}</p>
		</c:forEach>
		</c:if>
		<form action="updateInventoryPage.do" method="get">
			<input type="hidden" value="${item.id }" name="itemId">
			<button type="submit" class="btn btn-outline-info"
				value="Edit this puzzle!">Edit this puzzle!</button>
		</form>
		<form action="deleteInventory.do" method="post">
			<input type="hidden" name="itemId" value="${item.id }" />
			<button type="submit" class="btn btn-outline-danger"
				onclick=" return confirm('Are you sure you want to delete this puzzle?')">Delete</button>
		</form>
	</div>
	<jsp:include page="script.jsp" />

</body>
</html>