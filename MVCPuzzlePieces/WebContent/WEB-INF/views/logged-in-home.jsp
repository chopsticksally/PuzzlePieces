<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container-fluid bg-3 text-center">
	<c:if test="${not empty inventoryItems }">
 <div class="jumbotron text-center jumbobackground">
            <h1 class="header">Welcome Back!</h1>
  <p>Find a puzzle you like? Choose the Puzzle and Make a Request!</p>
  <p>Looking for Something More Specific? Search by User or Puzzle!</p>
	<p>Want to Connect with Other Users? Edit Your Profile and Add Some Puzzles!</p>
</div>			
<h1 align="center">See a Puzzle You Like? Select It!</h1>
<c:set var="count" value="0" scope="page" />
			<div class="row">
				<c:forEach var="ii" items="${inventoryItems }">
					<c:if test="${count % 3 == 0}">
			</div>
			<div class="row">
				<div class="col-sm-4">

					
						<p><a href="puzzleDetails.do?puzzle=${ii.id }"> ${ii.puzzle.name }</a></p>
						<p><a href="puzzleDetails.do?puzzle=${ii.id }"> <img
								alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
								width="295" height="260"></a></p>
			
					
	</div>
		</c:if>
	<c:if test="${count % 3 != 0}">
		<div class="col-sm-4">

						<p><a href="puzzleDetails.do?puzzle=${ii.id }"> ${ii.puzzle.name }</a></p>
						<p><a href="puzzleDetails.do?puzzle=${ii.id }"> <img
								alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
								width="295" height="260"></a></p>
			</div>
			</c:if>
			<c:set var="count" value="${count + 1}" scope="page" />
			</c:forEach>
		</div>
	<a href="#top"><button type="button" class="btn btn-primary btn-block topbutton">Back to Top</button></a>
	</c:if>
	<c:if test="${empty inventoryItems }">No Puzzles Available for Exchange</c:if>
	

	<jsp:include page="script.jsp" />

</body>
</html>