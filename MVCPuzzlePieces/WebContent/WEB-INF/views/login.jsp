<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Login</title>
</head>
<body>
	<jsp:include page="public-navbar.jsp" />

	
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





