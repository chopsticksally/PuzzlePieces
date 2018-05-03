<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />
	<div class="container">
	<div class="wrapper">
			<form action="registerUserInformation.do" method="post"
				class="form-signin">
				<h3 class="form-signin-heading">Enter User Information</h3>
				<hr class="colorgraph">
				<input type="hidden" value="${userLoggedIn.id}" name="id"> <br>

				<label for="userName">First Name:</label> <input type="text"
					class="form-control" name="firstName"
					placeholder="First Name" required="" autofocus="" min="1" max="100" />

				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" name="lastName" placeholder="Last Name"
					value="${userLoggedIn.userInformation.lastName }" required="" /> <label
					for="userName">Email Address:</label> <input type="text"
					class="form-control" name="email" placeholder="Email Address"
					 required="" />

				<button class="btn btn-lg btn-info btn-block" name="Submit"
					type="Submit">Next</button>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>