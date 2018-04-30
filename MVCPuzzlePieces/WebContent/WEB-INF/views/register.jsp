<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="public-navbar.jsp" />

	<h1 class="header">Register</h1>

	<form action="registering.do" method="POST">
		<input type="hidden" name="id" value="0"> <label
			for="userName"> New Username:</label> <input type="text"
			placeholder=" " min="1" max="100" name="userName"> <br>
		<br> <label for="password">New Password:</label> <input
			type="text" placeholder=" " min="1" max="100" name="password">
		<br> <br> <input type="submit" value="submit">

	</form>
	<c:if test="${not empty errorMessage }">
		<h4 class="registerError">${errorMessage}</h4>
	</c:if>

	<jsp:include page="script.jsp" />
</body>
</html>










