<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<h1 class="header">Users according to your search results</h1>
	<div class="container">
		<c:if test="${not empty users }">
			<c:forEach var="user" items="${users }">
				<a href="otherUserProfile.do?userId=${user.id }"><h3>${user.userName }</h3></a>
			</c:forEach>
		</c:if>
		<c:if test="${empty users }">No Users with this Username</c:if>
	</div>
</body>
</html>