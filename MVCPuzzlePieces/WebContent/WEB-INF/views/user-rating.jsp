<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	
	
	<h2>Rate ${user.userName }!</h2>
	
	<form action="rateUser.do" method="post">
	<input type= "hidden" name ="id" value= "${user.id}">
		<select name="rating">

			<option value="1">1-ugh</option>
			<option value="2">2-meh</option>
			<option value="3">3-not bad</option>
			<option value="4">4-good</option>
			<option value="5">5-awesome!</option>
		</select>
		<br>
		<textarea name="comment" rows="10" cols="30"
			placeholder="Leave a comment..."></textarea>
		<br> 
		<input type="submit" value="Rate">
	</form>
		<jsp:include page="script.jsp" />
</body>
</html>