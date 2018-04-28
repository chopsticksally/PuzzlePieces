<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="public-navbar.jsp" />

	
	<form action "updateUser.do" method= "POST">
	
		<label for="userName"> User name:</label>
	    <input type="text" value="${user.userName}"min="1" max="100" name="userName"> <br>
<br>
		<label for="password">Password:</label>
		<input type="text" value="${user.password}" min="1" max="100" name="password"> <br>
<br>		
		<label for="firstName">First name:</label>
		<input type="text" value="${user.firstName}" min="1" max="100" name="firstName"> <br>
<br>
		<label for="lastName">Last name:</label>
		<input type="text" value="${user.lastName}" min="1" max="100" name="lastName"> <br>
<br>
		<label for="email">Email:</label>
		<input type="text" value="${user.email}"  min="1" max="100" name="email"> <br>
<br>
		<label for="street">Street address:</label>
		<input type="text" value="${user.address.street}" min="1" max="100" name="street"><br>
		<label for="street2">Apt#:</label>
		<input type="text" placeholder= min"1" max="10" name="street2"><br>
		<label for="city">City:</label>
		<input type="text" value="${user.address.city}" min="1" max="100" name="city"><br>
		<label for="state">State:</label>
		<input type="text" value="${user.address.state}" min="1" max="100" name="state"><br>
		<label for="postalCode">Postal code:</label>
		<input type="text" value= "${user.address.postalCode}" min="1" max="100" name="postalCode"></br>
		
<br>
		<input type="submit" value="login">
		
	</form>
	
	
	<jsp:include page="script.jsp" />
</body>
</html>