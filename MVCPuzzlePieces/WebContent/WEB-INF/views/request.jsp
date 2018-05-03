<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h1 class="header"></h1>

	<div class="wrapper">
		<form action="sendRequest.do" method="post" class="form-signin">
			<h3 class="form-signin-heading">Send a Request for this Puzzle!</h3>
			<hr class="colorgraph">
			<input type="hidden" value="${inventoryId}" name="id"> <br>

			<label for="userName">Message:</label>
			<textarea type="message" class="form-control" name="comment"
			placeholder="Write your message here..." required=""></textarea>

			<button class="btn btn-lg btn-info btn-block" name="Submit"
				type="Submit">Submit Request!</button>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />



</body>
</html>