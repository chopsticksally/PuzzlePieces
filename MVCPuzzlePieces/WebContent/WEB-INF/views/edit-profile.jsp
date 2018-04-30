<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Update your profile</h1>
	
	<form action "updateUser.do" method= "POST">
	
		<label for="userName"> User name:</label>
	    <input type="text" value="${user.userName}"min="1" max="100" name="userName"> <br>
<br>
		<label for="password">Password:</label>
		<input type="text" value="${user.password}" min="1" max="100" name="password"> <br>
		<input type="submit" value="update">
	</form>	
	<br>



	<form action "updateUserInformation.do" method= "POST">
		<label for="firstName">First name:</label>
		<input type="text" value="${user.firstName}" min="1" max="100" name="firstName"> <br>
<br>
		<label for="lastName">Last name:</label>
		<input type="text" value="${user.lastName}" min="1" max="100" name="lastName"> <br>
<br>
		<label for="email">Email:</label>
		<input type="text" value="${user.email}"  min="1" max="100" name="email"> <br>
<br>


<input type="submit" value="update">
	</form>
	<form action "updateAddress.do" method= "POST">
		<label for="street">Street address:</label>
		<input type="text" value="${user.address.street}" min="1" max="100" name="street"><br>
		<label for="street2">Apt#:</label>
		<input type="text" placeholder="" name="street2"><br>
		<label for="city">City:</label>
		<input type="text" value="${user.address.city}" min="1" max="100" name="city"><br>
		<label for="state">State:</label>
		<input type="text" value="${user.address.state}" min="1" max="100" name="state"><br>
		<label for="postalCode">Postal code:</label>
		<input type="text" value= "${user.address.postalCode}" min="1" max="100" name="postalCode"></br>
		
<br>
		<input type="submit" value="update">
		
	</form>
	
	
	<jsp:include page="script.jsp" />
</body>
</html>