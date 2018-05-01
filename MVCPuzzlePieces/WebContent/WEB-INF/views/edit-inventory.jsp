<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<h1 class="header">Edit ${item.puzzle.name }</h1>
		<form action="updateInventory.do" method = "POST">
			<div class="form-group">
				<label>Puzzle Name</label> <input type="text" class="form-control"
					value="${item.puzzle.name }" name="name">
			</div>
			<div class="form-group">
				<label>Image Url</label> <input type="text" class="form-control"
					value="${item.puzzle.imageUrl }" name="imageUrl">
			</div>
			<div class="form-group">
				<label for="category">Category:</label> <select name="category" class="form-control">
				<c:if test="${item.puzzle.categories[0].name == 'Pets' }">
					<option value="Pets" selected>Pets</option>
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
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Ocean' }">
					<option value="Pets">Pets</option>
					<option value="Ocean" selected>Ocean</option>
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
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Under the sea' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea" selected>Under the sea</option>
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
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Landscape' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape" selected>Landscape</option>
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
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Flowers' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers" selected>Flowers</option>
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
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Space' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers">Flowers</option>
					<option value="Space" selected>Space</option>
					<option value="Animals">Animals</option>
					<option value="Jungle">Jungle</option>
					<option value="Futuristic">Futuristic</option>
					<option value="Food">Food</option>
					<option value="Architecture">Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Animals' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers">Flowers</option>
					<option value="Space">Space</option>
					<option value="Animals" selected>Animals</option>
					<option value="Jungle">Jungle</option>
					<option value="Futuristic">Futuristic</option>
					<option value="Food">Food</option>
					<option value="Architecture">Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Jungle' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers">Flowers</option>
					<option value="Space">Space</option>
					<option value="Animals">Animals</option>
					<option value="Jungle" selected>Jungle</option>
					<option value="Futuristic">Futuristic</option>
					<option value="Food">Food</option>
					<option value="Architecture">Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Futuristic' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers">Flowers</option>
					<option value="Space">Space</option>
					<option value="Animals">Animals</option>
					<option value="Jungle">Jungle</option>
					<option value="Futuristic" selected>Futuristic</option>
					<option value="Food">Food</option>
					<option value="Architecture">Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Food' }">
					<option value="Pets">Pets</option>
					<option value="Ocean">Ocean</option>
					<option value="Under the sea">Under the sea</option>
					<option value="Landscape">Landscape</option>
					<option value="Flowers">Flowers</option>
					<option value="Space">Space</option>
					<option value="Animals">Animals</option>
					<option value="Jungle">Jungle</option>
					<option value="Futuristic">Futuristic</option>
					<option value="Food" selected>Food</option>
					<option value="Architecture">Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Architecture' }">
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
					<option value="Architecture" selected>Architecture</option>
					<option value="Superhero">Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Superhero' }">
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
					<option value="Superhero" selected>Superhero</option>
					<option value="Cartoon">Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Cartoon' }">
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
					<option value="Cartoon" selected>Cartoon</option>
					<option value="Sports">Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Sports' }">
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
					<option value="Sports" selected>Sports</option>
					<option value="Miscellaneous">Miscellaneous</option>
					</c:if>
				<c:if test="${item.puzzle.categories[0].name == 'Miscellaneous' }">
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
					<option value="Miscellaneous" selected>Miscellaneous</option>
					</c:if>
				</select>
			</div>
			<div class="form-group">
				<label for="size">Size:</label> <select name="size" class="form-control">
				<c:if test="${item.puzzle.size == 350 }">
					<option value="350" selected>350</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
					<option value="1500">1500</option>
					<option value="3000">3000</option>
					</c:if>
				<c:if test="${item.puzzle.size == 500 }">
					<option value="350" >350</option>
					<option value="500" selected>500</option>
					<option value="1000">1000</option>
					<option value="1500">1500</option>
					<option value="3000">3000</option>
					</c:if>
				<c:if test="${item.puzzle.size == 1000 }">
					<option value="350" >350</option>
					<option value="500">500</option>
					<option value="1000" selected>1000</option>
					<option value="1500">1500</option>
					<option value="3000">3000</option>
					</c:if>
				<c:if test="${item.puzzle.size == 1500 }">
					<option value="350" >350</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
					<option value="1500" selected>1500</option>
					<option value="3000">3000</option>
					</c:if>
				<c:if test="${item.puzzle.size == 3000 }">
					<option value="350" >350</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
					<option value="1500">1500</option>
					<option value="3000" selected>3000</option>
					</c:if>
				
				</select>
			</div>
			<div class="form-group">
				<label for="condition">Condition:</label> <select name="condition"
					class="form-control">
					<c:if test="${item.condition == 'NEW'}">
						<option value="1" selected>New</option>
						<option value="2">Like new</option>
						<option value="3">Used</option>
						<option value="4">Worn</option>
					</c:if>
					<c:if test="${item.condition == 'LIKE_NEW' }">
						<option value="1">New</option>
						<option value="2" selected>Like new</option>
						<option value="3">Used</option>
						<option value="4">Worn</option>
					</c:if>
					<c:if test="${item.condition == 'USED' }">
						<option value="1">New</option>
						<option value="2">Like new</option>
						<option value="3" selected>Used</option>
						<option value="4">Worn</option>
					</c:if>
					<c:if test="${item.condition == 'WORN' }">
						<option value="1">New</option>
						<option value="2">Like new</option>
						<option value="3">Used</option>
						<option value="4" selected>Worn</option>
					</c:if>
				</select>
			</div>
			<input type= "hidden" value ="${item.id}">
			<button type="submit" class="btn btn-outline-info"> Edit</button>
		</form>
		<div>
			<c:if test="${not empty errorMessage}">${errorMessage}</c:if>
		</div>

	</div>
	<jsp:include page="script.jsp" />

</body>
</html>