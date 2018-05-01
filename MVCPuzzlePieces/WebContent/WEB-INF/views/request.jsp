<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header"></h1>

<form action="sendRequest.do" method="post">
<input type= "hidden" value= "${inventoryId}" name="id">
<textarea name="message" rows="10" cols="30" placeholder="Write your message here..."></textarea>
  <br>
 
<input type="submit" value="Send">
</form>





	<jsp:include page="script.jsp" />

</body>
</html>