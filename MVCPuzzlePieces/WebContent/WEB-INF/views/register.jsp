<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />

	<div class="container">
		<div class="wrapper">
			<form action="registering.do" method="post" name="Login_Form"
				class="form-signin">
				<h3 class="form-signin-heading">Join the puzzle club!</h3>
				<hr class="colorgraph">
				<br> <input type="text" class="form-control" name="userName" value="${username }"
					placeholder="Username" required="" autofocus="" /> 
					<input
					type="password" class="form-control" name="password"
					placeholder="Password" required="" /> 
					<input type="password"
					class="form-control" name="passwordConfirm"
					placeholder="Confirm Password" required="" />

				<button class="btn btn-lg btn-primary btn-block" name="Submit"
					value="Register" type="Submit">Register!</button>
				<c:if test="${not empty errorMessage }">
					<h4 class="errorMessage">${errorMessage}</h4>
				</c:if>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>










