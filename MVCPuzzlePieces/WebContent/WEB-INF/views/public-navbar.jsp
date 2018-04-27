<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="head">
	<h1 class="logo">Puzzle Pieces</h1>
	<ul class="nav justify-content-center">
		<li class="active nav-item"><a class="nav-link" href="home.do">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
		<li class="nav-item"><a class="nav-link" href="register.do">Register</a></li>
		<form action="searchPuzzle.do" method="GET">
			<input type="text" name="category, size, condition" /> 
			<input type="submit" value="Find Puzzle" />
		</form>
	</ul>
</div>