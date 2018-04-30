<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
            
    <h3>User: ${userLoggedIn.userName}</h3>
 	<c:forEach var="user" items= "${userLoggedIn.requestsRecieved}">
    ${user.requester.userName}
    ${user.requestee.userName}
    ${user.inventoryItem.id}
    </c:forEach> 
    <hr>

	<jsp:include page="script.jsp" />

<h3></h3>

</body>
</html>