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
	<form action="loggingIn.do" method="GET">
		<label for="userName"> Username:</label>
		<input type="text" placeholder="username" min="1" max="100" name= "userName"><br>
		<br>
		<label for="password">Password:</label>
		<input type="password" placeholder="password" min="1" max="100" name= "password"><br>
		<br>
		
		<input type="submit" value="Login">
		
	</form>
	
	<jsp:include page="script.jsp" />
</body>
</html>





