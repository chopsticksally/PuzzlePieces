<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<h1 class="header">Inventory name: ${item.puzzle.name}</h1>
		<img alt="${item.puzzle.name } Puzzle Photo"
			src="${item.puzzle.imageUrl }">
		<p>Condition: ${item.condition}</p>
		<p>Puzzle Size: ${item.puzzle.size}</p>
		<p>Category: ${item.puzzle.categories[0].name}</p>
		<form action="updateInventoryPage.do?itemId=${item.id }" method="get">
			<input type="hidden" value="${item.id }" name="id"> <input
				type="submit" value="Edit this puzzle!">
		</form>
		<form action="delete.do">
			<!-- <label>Input the ID of the restaurant you would like to
					delete</label> -->
			<input type="hidden" name="id" value="${item.id }" />
			<button type="submit" class="btn btn-outline-danger"
				onclick=" return confirm('Are you sure you want to delete thisrestaurant?')">Delete</button>
		</form>
	</div>
	<jsp:include page="script.jsp" />

</body>
</html>