<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzle Details</h1>
	<table>
		<tr>
			<td><img src="${puzzle.imageUrl}" width="295" height="260"
				alt="${puzzle.name}"></td>
			</tr>
			</table>
				<p>
				<h2>About this puzzle:</h2>
				</p>
				<table>
					<tr>
						<td>Puzzle Name:</td>
						<td>${puzzle.name}</td>
					</tr>
					<tr>
						<td>Puzzle Category:</td>
						<td><c:forEach var="cat" items="${puzzle.categories}">
											${cat.name }
											</c:forEach></td>
						
					</tr>
					<tr>
						<td>Puzzle size:</td>
						<td>${puzzle.size}</td>
					</tr>
					<tr>
						<td>Condition:</td>
						<td>${ii.condition}</td>
					</tr>
					<tr>
						<td>Puzzle Owner:</td>
						<td>${user.userName}</td>
					</tr>
					<tr>
						<td>Puzzle Rating:</td>
						<td>${rating}</td>
					</tr>

				</table>
			
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
				<br> <jsp:include page="script.jsp" />
</body>
</html>