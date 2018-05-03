<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />
	<div class="container">
		<div class="row">
			<div id="loader">
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="lading"></div>
			</div>
		</div>
	</div>
	<div class="container-fluid bg-3 text-center" id="#top">
		<c:if test="${not empty inventoryItems }">
			<div class="jumbotron text-center jumbobackground">
				<h1 class="header">Welcome To Puzzle Pieces!</h1>
				<p>Have a closet full of completed puzzles?</p>
				<p>Want to connect with and share puzzles with other puzzle
					lovers?</p>
				<br> <br>
				<h2>
					<em>You're in the right place!</em>
				</h2>
				<br> <br>
				<p>Find other puzzles available to loan or exchange from users
					like you!</p>
			</div>
			<h1 align="center">Puzzles Our Users Are Offering</h1>
			<br>
			<c:set var="count" value="0" scope="page" />
			<div class="row">
				<c:forEach var="ii" items="${inventoryItems }">
					<c:if test="${count % 3 == 0}">
			</div>
			<div class="row">
				<div class="col-sm-4">

					<h3>
						<p class="uppercase">${ii.puzzle.name }</p>
					</h3>
					<img alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
						width="295" height="260">
				</div>
		</c:if>
		<c:if test="${count % 3 != 0}">
			<div class="col-sm-4">

				<h3>
					<p class="uppercase">${ii.puzzle.name }</p>
				</h3>
				<img alt="${ii.puzzle.name } ii Photo" src="${ii.puzzle.imageUrl }"
					width="295" height="260">
			</div>
		</c:if>
		<c:set var="count" value="${count + 1}" scope="page" />
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${empty inventoryItems }">No Puzzles Available for Exchange</c:if>
	<h1 align="center">Come Join The Fun! Register Today!</h1>
	<br>
	<a href="#top"><button type="button"
			class="btn btn-primary btn-block topbutton">Back to Top</button></a>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>