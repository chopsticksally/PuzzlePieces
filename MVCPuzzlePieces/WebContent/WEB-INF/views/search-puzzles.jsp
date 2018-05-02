<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	
	<h1 class="header">Enter Search criteria</h1>

	<form action="searchPuzzle.do" method = "GET">
	
		<label for="category">Category:</label>
			<select name="category">
				
				<option value="Pets">Pets</option>
				<option value="Ocean">Ocean</option>
				<option value="Under the sea">Under the sea</option>
				<option value="Landscape">Landscape</option>
				<option value="Flowers">Flowers</option>
				<option value="Space">Space</option>
				<option value="Animals">Animals</option>
				<option value="Jungle">Jungle</option>
				<option value="Futuristic">Futuristic</option>
				<option value="Food">Food</option>
				<option value="Architecture">Architecture</option>
				<option value="Superhero">Superhero</option>
				<option value="Cartoon">Cartoon</option>
				<option value="Sports">Sports</option>
				<option value="Miscellaneous">Miscellaneous</option>
			</select> <br>
<br>
		<label for="size">Size:</label>
			<select name="size">
			
			<option value="350">350</option>
			<option value="500">500</option>
			<option value="1000">1000</option>
			<option value="1500">1500</option>
			<option value="3000">3000</option>
			</select> <br>
<br>
		<label for="condition">Condition:</label>
			<select name="condition">
			
			<option value="1">New</option>
			<option value="2">Like new</option>
			<option value="3">Used</option>
			<option value="4">Worn</option>
			</select> <br>
<br>
		<input type="submit" value="Search">

	</form>
	
			<form action="searchPuzzleByRating.do" method="GET">

			<label for="puzzleRating">Search by Puzzle Rating:</label> 
			<select name="puzzleRating">
			<option value="1">More than 1</option>
			<option value="2">More than 2</option>
			<option value="3">More than 3</option>
			<option value="4">More than 4</option>
			<option value="5">More than 5</option>
			</select>
			<input type="submit" value="Search">

		</form>

	<jsp:include page="script.jsp" />
</body>
</html>








