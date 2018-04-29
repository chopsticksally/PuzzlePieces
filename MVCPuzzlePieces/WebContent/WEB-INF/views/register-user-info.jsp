<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h1 class="header">Enter your information</h1>

	<div class="container">
		<form action="registerUserInformation.do" method="POST">
			<div class="form-group">
				<label for="firstName">First name:</label> <input type="text"
					placeholder=" " min="1" max="100" name="firstName">
			</div>
			<div class="form-group">
				<label for="lastName">Last name:</label> <input type="text"
					placeholder=" " min="1" max="100" name="lastName">
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="text" placeholder=" "
					min="1" max="100" name="email">
			</div>
			<div class="form-group">
				<input type="submit" value="submit">
			</div>
		</form>
	</div>

	<jsp:include page="script.jsp" />
</body>
</html>