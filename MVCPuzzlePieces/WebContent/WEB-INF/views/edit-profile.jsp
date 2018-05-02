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
<!-- 		<h1 class="header">Update your profile</h1> -->
		<div class="wrapper">
			<form action="updateUser.do" method="post" class="form-signin">
				<h3 class="form-signin-heading">Update Username & Password</h3>
				<hr class="colorgraph">
				<input type="hidden" value="${userLoggedIn.id}" name="id"> <br>
				
				<label for="userName">New Username:</label> 
				<input type="text" class="form-control" name="userName"
					value="${userLoggedIn.userName}" placeholder="New Username"
					required="" autofocus="" min="1" max="100" /> 
					
				<label for="userName">New Password:</label> 
				<input type="password" class="form-control" name="password"
				placeholder="New Password" value="${userLoggedIn.password }"
				required="" /> 
				
				<label for="userName">Confirm New Password:</label> 
				<input type="password" class="form-control"
				name="passwordConfirm" placeholder="Confirm New Password"
				value="${userLoggedIn.password }" required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					type="Submit">Update</button>
				<c:if test="${not empty errorMessage }">
					<h4 class="errorMessage">${errorMessage}</h4>
				</c:if>
			</form>
		</div>

		<div class="wrapper">
			<form action="updateUserInformation.do" method="post" class="form-signin">
				<h3 class="form-signin-heading">Update User Information</h3>
				<hr class="colorgraph">
				<input type="hidden" value="${userLoggedIn.id}" name="id"> <br>
				
				<label for="userName">First Name:</label> <input type="text"
				class="form-control" name="firstName" value="${userLoggedIn.userInformation.firstName }" 
				placeholder="First Name" required="" autofocus="" min="1" max="100" /> 
					
				<label for="lastName">Last Name:</label> 
				<input type="text" class="form-control" name="lastName"
				placeholder="Last Name" value="${userLoggedIn.userInformation.lastName }"
				required="" /> 
					
				<label for="userName">Email Address:</label>
				<input type="text" class="form-control"
				name="email" placeholder="Email Address"
				value="${userLoggedIn.userInformation.email }" required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					type="Submit">Update</button>
				<c:if test="${not empty errorMessage }">
					<h4 class="errorMessage">${errorMessage}</h4>
				</c:if>
			</form>
		</div>
		
		<div class="wrapper">
			<form action="updateAddress.do" method="post" class="form-signin">
				<h3 class="form-signin-heading">Update Address</h3>
				<hr class="colorgraph">
				<input type="hidden" value="${userLoggedIn.id}" name="id"> <br>
				
				<label for="street">Street:</label> <input type="text"
					class="form-control" name="street"
					value="${userLoggedIn.userInformation.address.street}" placeholder="Street"
					required="" autofocus="" min="1" max="100" /> 
					
					<label for="street2">Apt/Suite #:</label> 
					<input type="text" class="form-control" name="street2"
					placeholder="Apartment/Suite Number" value="${userLoggedIn.userInformation.address.street2 }"
					 /> 
					
					<label for="city">City:</label>
					<input type="text" class="form-control"
					name="city" placeholder="City"
					value="${userLoggedIn.userInformation.address.city }" required="" />
					
					<label for="state">State:</label>
					<input type="text" class="form-control"
					name="state" placeholder="State"
					value="${userLoggedIn.userInformation.address.state }" required="" />
					
					<label for="postalCode">Postal Code:</label>
					<input type="text" class="form-control"
					name="postalCode" placeholder="Postal Code"
					value="${userLoggedIn.userInformation.address.postalCode }" required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					type="Submit">Update</button>
				<c:if test="${not empty errorMessage }">
					<h4 class="errorMessage">${errorMessage}</h4>
				</c:if>
			</form>
		</div>
		
	</div>


	<jsp:include page="script.jsp" />
</body>
</html>