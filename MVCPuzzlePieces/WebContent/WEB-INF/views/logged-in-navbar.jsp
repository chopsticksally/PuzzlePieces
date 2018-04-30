<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="head">
	<h1 class="logo">Puzzle Pieces</h1>
	<ul class="nav justify-content-center">
		<li class="active nav-item"><a class="nav-link" href="logged-in-home.do">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="loggingIn.do">Profile</a></li>
		<li class="nav-item"><a class="nav-link" href="editProfile.do">Edit
				Profile</a></li>
		<li class="nav-item"><a class="nav-link" href="borrowed.do">Borrowed</a></li>
		<form action="searchPuzzle.do" method="GET">
			<input type="text" name="category, size, condition" /> <input
				type="submit" value="Find Puzzle" />
		</form>
		<form action="searchUser.do" method="GET">
			<input type="text" name="userName" /> <input type="submit"
				value="Find User" />
		</form>
		<form action="logout.do">
			<input type="hidden" name="id" value="${restaurant.id }" />
			<button type="submit" class="btn btn-secondary btn-sm"
				onclick=" return confirm('Are you sure you want to logout?')">Logout</button>
		</form>

	</ul>
</div>