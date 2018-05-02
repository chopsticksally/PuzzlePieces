<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<!-- <h1 class="header">Search for your *Requestie Bestie*</h1> -->
	<div class = "container">
	<div class="wrapper">
		<form action="searchUser.do" method="GET">      
		    <h2 class="form-signin-heading">Search for your *Requestie Bestie*</h2>
			  <hr class="colorgraph"><br>
			  <div class="container bg-3 text-center">
			  <h3><label for="userRating">Search by User Name</label></h3>
			  <label for="userName"><input type="text" value="${user.userName}" min="1" max="100" class="form-control" name="userName" placeholder="Search by Username:" required="" autofocus="" /></label>
			  </div>
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Submit" type="Submit">Submit</button>  			
		</form>			
		<form action="searchUserByRating.do" method="GET">
		 <div class="container bg-3 text-center">
		<h3><label for="userRating">Search by User Rating</label></h3>
			<h1><select name="userRating">
			<option value="1">More than 1</option>
			<option value="2">More than 2</option>
			<option value="3">More than 3</option>
			<option value="4">More than 4</option>
			<option value="5">Perfect 5</option>
			</select></h1></div>
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Submit" type="Submit">Submit</button>  			
		</form>
	</div>
</div>
	<%-- <div class="container">
		<form action="searchUser.do" method="GET">

			<label for="userName">Search by Username:</label> <input type="text"
				value="${user.userName}" min="1" max="100" name="userName">
			<input type="submit" value="Search">

		</form>
		<form action="searchUserByRating.do" method="GET">

			<label for="userRating">Search by User Rating:</label> 
			<select name="userRating">
			<option value="1">More than 1</option>
			<option value="2">More than 2</option>
			<option value="3">More than 3</option>
			<option value="4">More than 4</option>
			<option value="5">Perfect 5</option>
			</select>
			<input type="submit" value="Search">

		</form>
	</div> --%>

	<jsp:include page="script.jsp" />
</body>
</html>