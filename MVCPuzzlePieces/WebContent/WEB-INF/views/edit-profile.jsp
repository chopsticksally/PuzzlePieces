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
	<div class="container">
		<div class="wrapper">
	<h1 class="header">Update your profile</h1>
			<form action="updateUser.do" method="post" class="form-signin">
				<h3 class="form-signin-heading">Update Username & Password</h3>
				<hr class="colorgraph">
				<input type= "hidden" value="${userLoggedIn.id}"name= "id">
					<br> <label for="userName">New Username:</label>
				 <input type="text" class="form-control" name="userName"
					value="${userLoggedIn.userName}" placeholder="New Username" required="" autofocus="" min="1" max="100"/> 
				<input
					type="password" class="form-control" name="password"
					placeholder="New Password"value="${userLoggedIn.password }" required="" />
				<input type="password"
					class="form-control" name="passwordConfirm"
					placeholder="Confirm New Password" value="${userLoggedIn.password }" required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					 type="Submit">Update</button>
				<c:if test="${not empty errorMessage }">
					<h4 class="errorMessage">${errorMessage}</h4>
				</c:if>
			</form>
		</div>
	</div>
	
	
<%-- 	<form action= "updateUser.do" method= "POST">
	<input type= "hidden" value="${userLoggedIn.id}"name= "id">
		<label for="userName"> User name:</label>
	    <input type="text" value="${userLoggedIn.userName} name="userName"> <br>
<br>
		<label for="password">Password:</label>
		<input type="text" value="${userLoggedIn.password}" min="1" max="100" name="password"> <br>
		<input type="submit" value="update">
	</form>	
	<br>
 --%>


	<form action= "updateUserInformation.do" method= "POST">
	<input type= "hidden" value="${userLoggedIn.id}"name= "id">
		<label for="firstName">First name:</label>
		<input type="text" value="${userLoggedIn.userInformation.firstName}" min="1" max="100" name="firstName"> <br>
<br>
		<label for="lastName">Last name:</label>
		<input type="text" value="${userLoggedIn.userInformation.lastName}" min="1" max="100" name="lastName"> <br>
<br>
		<label for="email">Email:</label>
		<input type="text" value="${userLoggedIn.userInformation.email}"  min="1" max="100" name="email"> <br>
<br>


<input type="submit" value="update">
	</form>
	<form action= "updateAddress.do" method= "POST">
	<input type= "hidden" value="${userLoggedIn.id}"name= "id">
		<label for="street">Street address:</label>
		<input type="text" value="${userLoggedIn.userInformation.address.street}" min="1" max="100" name="street"><br>
		<label for="street2">Apt#:</label>
		<input type="text" placeholder="" name="street2"><br>
		<label for="city">City:</label>
		<input type="text" value="${userLoggedIn.userInformation.address.city}" min="1" max="100" name="city"><br>
		<label for="state">State:</label>
		<input type="text" value="${userLoggedIn.userInformation.address.state}" min="1" max="100" name="state"><br>
		<label for="postalCode">Postal code:</label>
		<input type="text" value= "${userLoggedIn.userInformation.address.postalCode}" min="1" max="100" name="postalCode"></br>
		
<br>
		<input type="submit" value="update">
		
	</form>
	</div>
	
	
	<jsp:include page="script.jsp" />
</body>
</html>