<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<div class="wrapper">
		<form action="acceptingOrRejectingRequest.do" method="post" class="form-signin">
			<h3 class="form-signin-heading">Reply to your request</h3>
			<hr class="colorgraph">
			<input type="hidden" value="${inventoryId}" name="id"> <br>
			<h4 class="uppercase">${request.requester.userName}:</h4>
			<h5 class="message">${request.message}</h5>
			<h4>
				Reply: <select name="choice">
					<option value="1">Reject Request</option>
					<option value="2">Accept Request</option>
					<option value="3">Gift Puzzle</option>
				</select>
			</h4>

			<br> <label for="userName">Reply Message:</label>
			<textarea type="message" class="form-control" name="message"
				placeholder="Reply here..." required=""></textarea>

			<button class="btn btn-lg btn-info btn-block" name="Submit"
				type="Submit">Submit Reply!</button>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>