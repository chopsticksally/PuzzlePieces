<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzles found according to your search</h1>
	<jsp:include page="script.jsp" />



<c:forEach items="${puzzle}" var="puzzle" >
		
<table>
	<tr>
    	<td>
		<p>${puzzle.id}: ${puzzle.name}</a></p>
		<img src="${puzzle.imageUrl}" width="275" height="250" alt="${puzzle.name}">
		
		
		</td>
		<td>
		<p><h2>About this puzzle:</h2></p>
		<table>
			<tr>
				<td>Puzzle Category:</td>
				<td>${puzzle.category}</td>
			</tr>
			<tr>
				<td>Puzzle size:</td>
				<td>${puzzle.size}</td>
			</tr>
			<tr>
				<td>Condition:</td>
				<td>${puzzle.condition}</td>
			</tr>
			<tr>
				
			</tr>
			</table>
		</td>	<br>
</c:forEach>




</body>
</html>





