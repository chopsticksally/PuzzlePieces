<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />
	
	<div class="wrapper">
			<form action="registerAddress.do" method="post" class="form-signin">
				<h3 class="form-signin-heading">Enter Your Address</h3>
				<hr class="colorgraph">
				<input type="hidden" name="id" value="${userLoggedIn.id }"> <br>

				<label for="street">Street:</label> <input type="text"
					class="form-control" name="street"
					placeholder="Street" required="" autofocus="" min="1" max="100" />

				<label for="street2">Apt/Suite #:</label> <input type="text"
					class="form-control" name="street2"
					placeholder="Apartment/Suite Number" />

				<label for="city">City:</label> <input type="text"
					class="form-control" name="city" placeholder="City"
					required="" />

				<label for="state">State:</label> <input type="text"
					class="form-control" name="state" placeholder="State"
					required="" />

				<label for="postalCode">Postal Code:</label> <input type="text"
					class="form-control" name="postalCode" placeholder="Postal Code"
					required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					type="Submit">Register!</button>
			</form>
		</div>
	
		<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>