<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />

<body>
	<jsp:include page="logged-in-navbar.jsp" />

	<h1 class ="header">Enter your address</h1>
	
	<form action= "registerAddress.do" method= "POST">
<br>
		<label for="street">Street address:</label>
		<input type="text" placeholder=" " min="1" max="100" name="street"><br>
		<label for="street2">Apt#:</label>
		<input type="text" placeholder="" min="1" max="10" name="street2"><br>
		<label for="city">City:</label>
		<input type="text" placeholder=" " min="1" max="100" name="city"><br>
		<label for="state">State:</label>
		<input type="text" placeholder=" " min="1" max="100" name="state"><br>
		<label for="postalCode">Postal code:</label>
		<input type="text" placeholder=" " min="1" max="100" name="postalCode"></br>
		
<br>
		<input type="submit" value="submit">
		
	</form>
		<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>