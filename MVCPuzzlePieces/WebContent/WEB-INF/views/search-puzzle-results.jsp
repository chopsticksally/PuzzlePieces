<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container-fluid">
		<div class="row justify-content-start">
			<div class="col-sm-3"></div>
			<div class="col-sm-8">

				<div class="container-fluid bg-3 text-center">
<!-- <h1 class="header">Puzzles found according to your search</h1> -->

					<c:forEach var="ii" items="${puzzles}">

						<table>
							<tr>
								<td>
								
									
									<img src="${ii.puzzle.imageUrl}" width="275" height="250"
									alt="${ii.puzzle.name}">
								</td>
								<td>
									<p>
									<h2>About this puzzle:</h2>
									</p>
									<table>
										<tr>
											<td>Puzzle Name:</td>
											<td>${ii.puzzle.name}</td>
										</tr>
										<tr>
										
										
										
										
											<td>Puzzle Category:</td>
											<td><c:forEach var ="cat" items="${ii.puzzle.categories}">
											${cat.name }
											</c:forEach></td>
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
										<td>

											<div class="Request">
											<form action="puzzleDetails.do" method="get">
    											<input type="hidden" value="${ii.id }" name="puzzle">
    											<input type="submit" value="View Puzzle Details">
    											</form>
												
												<!-- <input class="toggle-btn" type="checkbox" value="Request"> -->
										</td>
									</table>
								</td>
						</table>
						<br>
					</c:forEach>
				</div>
				<br>


			</div>
		</div>
	</div>

	<jsp:include page="script.jsp" />
</body>
</html>


