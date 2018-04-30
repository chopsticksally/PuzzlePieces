<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzle Details</h1>
	<c:forEach var="ii" items="${puzzles}">
			
		<table>
			<tr>
		    	<td>
				<p>${ii.puzzle.id}: ${ii.puzzle.name}</a></p>
				<img src="${ii.puzzle.imageUrl}" width="275" height="250" alt="${ii.puzzle.name}">
				</td>
				<td>
					<p><h2>About this puzzle:</h2></p>
					<table>
					<tr>
						<td>Puzzle Category:</td>
						<td><c:forEach items="${puzzle.categories}"></c:forEach></td>
						<%-- <td>${puzzle.categories}</td> --%>
	 			</tr>
					<tr>
						<td>Puzzle size:</td>
						<td>${ii.puzzle.size}</td>
					</tr>
					<tr>
						<td>Condition:</td>
						<td>${ii.condition}</td>
					</tr>
					</table>
					</td>
			</table>				
				<br>
	</c:forEach>
	
	
	
	
	
	
	
	
	
	<jsp:include page="script.jsp" />

</body>
</html>