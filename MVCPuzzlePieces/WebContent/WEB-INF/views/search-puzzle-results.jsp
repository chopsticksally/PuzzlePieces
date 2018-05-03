<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
<!-- 	test comment
 -->	<jsp:include page="logged-in-navbar.jsp" />
	
	<div class="container-fluid">
		<h1 class="header">Puzzles found according to your search</h1>
		<hr class="colorgraph">

				<div class="container-fluid bg-3 text-center">
					<c:if test="${empty puzzles }">
						<p>*No Puzzles Found, Please Try Again*</p>
					</c:if>

					<c:forEach var="ii" items="${puzzles}">


						<p>
							<img src="${ii.puzzle.imageUrl}" width="275" height="250"
								alt="${ii.puzzle.name}">
						</p>

						<h2>About this puzzle:</h2>


						<p>Puzzle Name: ${ii.puzzle.name}</p>
							<c:forEach var="cat" items="${ii.puzzle.categories}">
																${cat.name }
																</c:forEach>
						<p>
							Puzzle Category:
					
						</p>

						<p>Puzzle size: ${ii.puzzle.size}</p>
						<p>Condition: ${ii.condition}</p>

						<p>
						<div class="Request">
							<form action="puzzleDetails.do" method="get">
								<input type="hidden" value="${ii.id }" name="puzzle"> <input
									type="submit" class="btn btn-outline-info"
									value="View Puzzle Details">
							</form>

							<!-- <input class="toggle-btn" type="checkbox" value="Request"> -->
							</p>


							<br>
					</c:forEach>
				</div>
				<br>


			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>


