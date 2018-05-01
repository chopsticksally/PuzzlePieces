<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzle Details</h1>
	<table>
		<tr>
			<td><img src="${puzzle.imageUrl}" width="275" height="250"
				alt="${puzzle.name}"></td>
			<td>
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
						<%-- <td>${puzzle.categories}</td> --%>
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
				<div class="Request">
					<form action="makeRequest.do" method="get">
						<input type="hidden" value="${ii.id }"
							name="id"> <input type="submit"
							value="Request This Puzzle!">
					</form>
				</div>
				<div class="Rate Puzzle">
					<form action="puzzleRatingPage.do" method="get">
						<input type="hidden" value="${ii.id }"
							name="id"> <input type="submit" value="Rate">
					</form>
				</div>
				<div class="See Owner Profile">
					<form action="userProfile.do" method="get">
						<input type="hidden" value="${user.id }" name="id"> <input
							type="submit" value="See Owner">
					</form>
				</div> <br> <jsp:include page="script.jsp" />
</body>
</html>