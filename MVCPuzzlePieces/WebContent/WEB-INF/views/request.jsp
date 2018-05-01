<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header"></h1>

<form action="sendRequest.do" method="post">
<input type="text" placeholder="Enter a message here!" name="">

</form>





	<jsp:include page="script.jsp" />

</body>
</html>