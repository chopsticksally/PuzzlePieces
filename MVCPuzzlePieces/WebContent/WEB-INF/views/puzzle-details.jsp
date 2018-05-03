<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzle Details</h1>
	<div class= "container bg-3 text-center">
	<img src="${puzzle.imageUrl}" width="295" height="260"
				alt="${puzzle.name}"></p>
			
				<p>
				<h2>About this puzzle:</h2>
				</p>
				
					
						<p>Puzzle Name: ${puzzle.name}</p>
						
					
						
						<p>Puzzle Category:<c:forEach var="cat" items="${puzzle.categories}">
											${cat.name }
											</c:forEach></p>
						
					
						<p>Puzzle size: ${puzzle.size}</p>
						
					
						<p>Condition: ${ii.condition}</p>
						
				
						<p>Puzzle Owner: ${user.userName}</p>
						
					
						<p>Puzzle Rating: ${rating}</p>
					
				
				<c:if test="${user.id != userLoggedIn.id }">
				<div class="Request">
					<form action="makeRequest.do" method="get">
						<input type="hidden" value="${ii.id }"
							name="id"> <input type="submit"
							value="Request This Puzzle!">
					</form>
					<br>
				</div>
				</c:if>
				<div class="Rate Puzzle">
					<form action="puzzleRatingPage.do" method="get">
						<input type="hidden" value="${ii.id }"
							name="id"> <input type="submit" value="Rate">
					</form>
					<br>
				</div>
				<c:if test="${user.id != userLoggedIn.id }">
				<div class="See Owner Profile">
					<form action="otherUserProfile.do" method="get">
						<input type="hidden" value="${user.id }" name="userId"> <input
							type="submit" value="See Owner">
					<br>
					</form>
				</div> 
				</c:if>
				</div>
				<br> <jsp:include page="script.jsp" />
</body>
</html>