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
				<option value="1">Pets</option>
				<option value="2">Ocean</option>
			<option value="3">Under the sea</option>
			<option value="4">Landscape</option>
			<option value="5">Flowers</option>
			<option value="6">Space</option>
			<option value="7">Animals</option>
			<option value="8">Jungle</option>
			<option value="9">Futuristic</option>
			<option value="10">Food</option>
			<option value="11">Architecture</option>
			<option value="12">Superhero</option>
			<option value="13">Cartoon</option>
			<option value="14">Sports</option>
			<option value="15">Miscellaneous</option>
			</select> <br>
<br>
		<label for="size">Size:</label>
			<select name="size">
			<option value="1">350</option>
			<option value="2">500</option>
			<option value="3">1000</option>
			<option value="4">1500</option>
			<option value="5">3000</option>
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

	<jsp:include page="script.jsp" />
</body>
</html>








