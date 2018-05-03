<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<div class="wrapper">
			<form action="addInventory.do" method="POST" class="form-signin">

				<h2 class="form-signin-heading">Add Inventory</h2>
				<hr class="colorgraph">
				
				<label>Puzzle Name:</label> <input
					type="text" class="form-control" name="name">

				<label>Image Url:</label> <input type="text" class="form-control"
					name="imageUrl"> 

				<h4>
					Category: <select name="categoryId">
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
					</select>
				</h4>
				<br>

				<h4>
					Size: <select name="size">
						<option value="350">350</option>
						<option value="500">500</option>
						<option value="1000">1000</option>
						<option value="1500">1500</option>
						<option value="3000">3000</option>
					</select>
				</h4>
				<br>
				<h4>
					Condition: <select name="condition">
						<option value="1">New</option>
						<option value="2">Like new</option>
						<option value="3">Used</option>
						<option value="4">Worn</option>
					</select>
				</h4>

				<br>

				<button class="btn btn-lg btn-primary btn-block" name="Submit"
					value="Submit" type="Submit">Add Inventory!</button>

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