<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<div class="wrapper">
			<form action="updateInventory.do" method="POST" class="form-signin">

				<h2 class="form-signin-heading" id="capitalize">Edit:
					${item.puzzle.name }</h2>
				<hr class="colorgraph">

				<label>Puzzle Name:</label> 
				<input type="text" value="${item.puzzle.name }" class="form-control"
					name="name"> 
				<label>Image Url:</label> 
				<input type="text" value="${item.puzzle.imageUrl }"
					class="form-control" name="imageUrl">

				<h4>
					Category:<select name="categoryId" class="form-control">
						<c:if test="${empty item.puzzle.categories[0].name }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Pets' }">
							<option value=1 selected>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Ocean' }">
							<option value=1>Pets</option>
							<option value=2 selected>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Under the sea' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3 selected>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Landscape' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4 selected>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Flowers' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5 selected>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Space' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6 selected>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Animals' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7 selected>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Jungle' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8 selected>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Futuristic' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9 selected>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Food' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10 selected>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Architecture' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11 selected>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Superhero' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12 selected>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Cartoon' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13 selected>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Sports' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14 selected>Sports</option>
							<option value=15>Miscellaneous</option>
						</c:if>
						<c:if test="${item.puzzle.categories[0].name == 'Miscellaneous' }">
							<option value=1>Pets</option>
							<option value=2>Ocean</option>
							<option value=3>Under the sea</option>
							<option value=4>Landscape</option>
							<option value=5>Flowers</option>
							<option value=6>Space</option>
							<option value=7>Animals</option>
							<option value=8>Jungle</option>
							<option value=9>Futuristic</option>
							<option value=10>Food</option>
							<option value=11>Architecture</option>
							<option value=12>Superhero</option>
							<option value=13>Cartoon</option>
							<option value=14>Sports</option>
							<option value=15 selected>Miscellaneous</option>
						</c:if>
					</select>
				</h4>

				<h4>
					Size: <select name="size" class="form-control">
						<c:if test="${empty item.puzzle.size}">
							<option value="350" selected>350</option>
							<option value="500">500</option>
							<option value="1000">1000</option>
							<option value="1500">1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${not empty item.puzzle.size}">
							<option value="350" selected>350</option>
							<option value="500">500</option>
							<option value="1000">1000</option>
							<option value="1500">1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${item.puzzle.size == 350 }">
							<option value="350" selected>350</option>
							<option value="500">500</option>
							<option value="1000">1000</option>
							<option value="1500">1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${item.puzzle.size == 500 }">
							<option value="350">350</option>
							<option value="500" selected>500</option>
							<option value="1000">1000</option>
							<option value="1500">1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${item.puzzle.size == 1000 }">
							<option value="350">350</option>
							<option value="500">500</option>
							<option value="1000" selected>1000</option>
							<option value="1500">1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${item.puzzle.size == 1500 }">
							<option value="350">350</option>
							<option value="500">500</option>
							<option value="1000">1000</option>
							<option value="1500" selected>1500</option>
							<option value="3000">3000</option>
						</c:if>
						<c:if test="${item.puzzle.size == 3000 }">
							<option value="350">350</option>
							<option value="500">500</option>
							<option value="1000">1000</option>
							<option value="1500">1500</option>
							<option value="3000" selected>3000</option>
						</c:if>

					</select>
				</h4>

				<h4>
					Condition: <select name="condition" class="form-control">
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
				</h4>
				<input type="hidden" name="id" value="${item.id }" />
				<button type="submit" class="btn btn-outline-info">Submit
					Edit</button>
			</form>
		</div>
		<div>
			<c:if test="${not empty errorMessage}">${errorMessage}</c:if>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />

</body>
</html>