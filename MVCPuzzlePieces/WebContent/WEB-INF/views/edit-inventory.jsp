<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<h1 class="header">Edit ${item.puzzle.name }</h1>
		<form action="updateInventory.do">
			<div class="form-group">
				<label>Puzzle Name</label> <input type="text" class="form-control">
			</div>
			<div class="form-group">
				<label>Image Url</label> <input type="text" class="form-control">
			</div>
			<div class="form-group">
				<label for="category">Category:</label> <select name="category"
					class="form-control">

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
				</select>
			</div>
			<div class="form-group">
				<label for="size">Size:</label> <select name="size"
					class="form-control">

					<option value="350">350</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
					<option value="1500">1500</option>
					<option value="3000">3000</option>
				</select>
			</div>
			<div class="form-group">
				<label for="condition">Condition:</label> <select name="condition"
					class="form-control">

					<option value="1">New</option>
					<option value="2">Like new</option>
					<option value="3">Used</option>
					<option value="4">Worn</option>
				</select>
			</div>
			<input type="submit" value="Submit">
		</form>

	</div>
	<jsp:include page="script.jsp" />

</body>
</html>