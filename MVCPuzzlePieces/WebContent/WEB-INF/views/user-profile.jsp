<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
<c:forEach var="user" items= "${userLoggingIn}">
            
    <h3>User: ${user.userName}</h3>
    
    <hr>


</c:forEach>
	<jsp:include page="script.jsp" />

<h3></h3>

</body>
</html>