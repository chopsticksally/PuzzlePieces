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
	<div>
	<c:if test="${not empty userInfo }">
	${userInfo.address.city }
	</c:if>
	</div>
	<div>
		<c:forEach var="items" items="${inventoryItems}">
    ${items.puzzle.name }
    ${items.id}
    ${items.condition}
    <img alt="stuuff" src="${items.puzzle.imageUrl }">
    </c:forEach>
	</div>
	<div>
	<c:forEach var="req" items="${userRequests }">
	${req.message }
	${req.requester.userName }
	
	</c:forEach>
	</div>
	<div>
	<c:forEach var="sentReq" items="${sentRequests }">
	${sentReq.message }
	${sentReq.active }
	${sentReq.accepted }
	</c:forEach>
	</div>
	
	<div>
	
	</div>
	
	<jsp:include page="script.jsp" />

</body>
</html>