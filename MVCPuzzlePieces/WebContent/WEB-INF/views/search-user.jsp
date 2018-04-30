<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h1 class="header">Search for your *Requestie Bestie*</h1>
	<div class="container">
		<form action="searchUser.do" method="GET">

			<label for="userName">Search by Username:</label> <input type="text"
				value="${user.userName}" min="1" max="100" name="userName">
			<input type="submit" value="Search">

		</form>
	</div>
	
	<jsp:include page="script.jsp" />
</body>
</html>