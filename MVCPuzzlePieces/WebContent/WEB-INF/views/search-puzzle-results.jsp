<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Puzzles found according to your search</h1>
	
	<c:forEach var="ii" items="${puzzles}">
			
		<table>
			<tr>
		    	<td>
				<p>${ii.puzzle.id}: ${ii.puzzle.name}</a></p>
				<img src="${ii.puzzle.imageUrl}" width="275" height="250" alt="${ii.puzzle.name}">
				</td>
				<td>
					<p><h2>About this puzzle:</h2></p>
					<tr>
						<td>Puzzle Category:</td>
	<%-- 					<td>${ii.puzzle.category}</td>
	 --%>			</tr>
					<tr>
						<td>Puzzle size:</td>
						<td>${ii.puzzle.size}</td>
					</tr>
					<tr>
						<td>Condition:</td>
						<td>${ii.condition}</td>
					</tr>
					</td>
			</table>				
				<br>
	</c:forEach>

	<jsp:include page="script.jsp" />
</body>
</html>





