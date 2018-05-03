<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<div class="wrapper">
		<form action="rateUser.do" method="post" class="form-signin">
			<h3 class="form-signin-heading">Rate ${user.userName }!</h3>
			<hr class="colorgraph">
			<input type="hidden" value="${user.id}" name="id"> <br>

			<label for="userName">Rating:</label> <select name="rating"
				class="form-control">
				<option value="1">1-ugh</option>
				<option value="2">2-meh</option>
				<option value="3">3-not bad</option>
				<option value="4">4-good</option>
				<option value="5">5-awesome!</option>
			</select> <label for="userName">Comment:</label>

			<textarea type="message" class="form-control" name="comment"
				placeholder="Leave a comment..." required=""></textarea>

			<button class="btn btn-lg btn-info btn-block" name="Submit"
				type="Submit">Submit Request!</button>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>