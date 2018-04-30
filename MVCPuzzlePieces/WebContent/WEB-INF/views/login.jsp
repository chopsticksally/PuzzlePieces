<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="public-navbar.jsp" />

	<h1 class="header">User Login</h1>
	<div class="container">
		<form action="loggingIn.do" method="GET">
			<div class="form-group">
				<label for="userName">Username:</label> <input type="text"
					placeholder="username" class="form-control" min="1" max="100"
					name="userName">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					placeholder="password" class="form-control" min="1" max="100"
					name="password">
			</div>
			<button type="submit" class="btn btn-primary">Login</button>

		</form>
	</div>

	<jsp:include page="script.jsp" />
</body>
</html>





