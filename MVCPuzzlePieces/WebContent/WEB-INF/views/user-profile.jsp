<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<style>
table, th, td {
    margin: 1em auto;
}
</style>
<body>
    <jsp:include page="logged-in-navbar.jsp" />
    <!-- THIS CAN TOTALLY BE REMOVED WITHOUT BREAKING ANYTHING I DON'T THINK, PURELY TESTING -->
    <c:if test="${not empty userRequester && not empty requestedItem}">
      <div class="containerbg-3 text-center">
    <h5>REMINDER: Due to recent high-profile hackings,</h5>
    <h5>PuzzlePieces has decided to not save user addresses to the screen.</h5>
    <h5>Please screenshot or save this information some other way.</h5>
    <h5>We apologize for the inconvenience.</h5><br>
          <h4 class="header">SEND ${requestedItem.puzzle.name} TO:</h4>
          <h5>User: ${userRequester.userName }</h5>
          <h5>User Email: ${userRequester.userInformation.email }</h5>
          <h5>User Address:</h5>
          <ul>
          <li><h5>Address(1): ${userRequester.userInformation.address.street }</h5></li>
          <li><h5>Address(2): ${userRequester.userInformation.address.street2 }</h5></li>
          <li><h5>City: ${userRequester.userInformation.address.city }</h5></li>
          <li><h5>State: ${userRequester.userInformation.address.state }</h5></li>
          <li><h5>ZIP: ${userRequester.userInformation.address.postalCode }</h5></li>
          </ul>
      </div>
     </c:if>
     <!-- SEE ABOVE -->
    <h3 class="header">User: ${userLoggedIn.userName}</h3>
    <div class="container bg-3 text-center">
        <div class="containerbg-3 text-center">
            <h4 class="header">Current Location</h4>
            <c:if test="${not empty userInfo }">
                <p>${userInfo.address.city },${userInfo.address.state}</p>
            </c:if>
        </div>
        <div>
            <h4 class="header">Current Inventory</h4>
            <div>
                <a href="addInventoryPage.do"><button
                        class="btn btn-info btn-lg btn-block">Add Inventory</button></a>
            </div>
            <c:set var="invcount" value="0" scope="page" />
            <table>
                <tr>
                    <c:forEach var="items" items="${inventoryItems}">
                        <c:if test="${invcount % 3 == 0}">
                </tr>
                <tr>
                    <td>
                        <div class="container-fluid bg-2 text-center ">
                            <p>${items.puzzle.name }</p>
                            <img type="center" alt="${items.puzzle.name } Puzzle Photo"
                                src="${items.puzzle.imageUrl }" width="295" height="260">
                            <br>
                            <p>
                                <a href="userInventoryDetails.do?itemId=${items.id }"><button
                                       class="btn btn-outline-info">View Puzzle Details</button></a>
                            </p>
                        </div>
                    </td>
                    </c:if>
                    <c:if test="${invcount % 3 != 0}">
                        <td>
                            <div class="container-fluid bg-2 text-center ">
                                <p>${items.puzzle.name }</p>
                                <img type="center" alt="${items.puzzle.name } Puzzle Photo"
                                    src="${items.puzzle.imageUrl }" width="295" height="260">
                                <br>
                                <p>
                                    <a href="userInventoryDetails.do?itemId=${items.id }"><button
                                            class="btn btn-outline-info">View Puzzle Details</button></a>
                                </p>
                            </div>
                        </td>
                    </c:if>
                    <c:set var="invcount" value="${count + 1}" scope="page" />
                    </div>
                    </c:forEach>
                </tr>
            </table>
        </div>
        <div>
            <div class="container bg-5 text-left">
                <h4 class="header">Requests Received</h4>
                <c:forEach var="req" items="${userRequests }">
                    <c:if test="${req.active == true}">
                        <br>               
                       <hr>
                        <p>Request from: ${req.requester.userName }</p>
                        <p>User Comment: ${req.message }</p>
                        <p>User is Requesting: ${req.inventoryItem.puzzle.name }</p>
                        <form action="replyToRequest.do" method="get">
                            <input type="hidden" value="${req.id}" name="id"> <input
                                type="submit" class="btn btn-outline-info" value="Reply">
                        </form>
                        <br>
                    </c:if>
                </c:forEach>
            </div>
            <div class="container bg-5 text-left">
                <h4 class="header">Requests Sent</h4>
                <c:forEach var="sentReq" items="${sentRequests }">
                    <br>
                    <hr>
                    <p>User Request Sent To: ${sentReq.requestee.userName }</p>
                    <p>Message: ${sentReq.message }</p>
                    <p>Requested Puzzle Name: ${sentReq.inventoryItem.puzzle.name }</p>
                    <br>
                </c:forEach>
            </div>
            <div>
                <h4 class="header">Puzzles Borrowed</h4>
                <c:if test="${not empty borrows }">
                    <c:set var="borrowcount" value="0" scope="page" />
                    <table>
                        <tr>
                            <c:forEach var="borrows" items="${borrows }">
                                <c:if test="${borrowcount % 5 == 0}">
                        </tr>
                        <tr>
                            <td>
                                <div class="container-fluid text-left">
                                    
                                    <p>${borrows.inventoryItem.puzzle.name }</p>
                                    <img src="${borrows.inventoryItem.puzzle.imageUrl }"
                                        width="221" height="195"
                                        alt="${borrows.inventoryItem.puzzle.name } Puzzle">
                                    <p>
                                        Borrow date:
                                        <fmt:formatDate value="${borrows.borrowDate }"
                                            pattern="yyyy-MM-dd" />
                                    </p>
                                    <p>
                                        Return by:
                                        <fmt:formatDate value="${borrows.returnDate }"
                                            pattern="yyyy-MM-dd" />
                                    </p>
                                </div>
                            </td>
                            </c:if>
                            <c:if test="${borrowcount % 5 != 0}">
                                <td>
                                    <div class="container-fluid text-left">
                                        <p>${borrows.inventoryItem.puzzle.name }</p>
                                        <img src="${borrows.inventoryItem.puzzle.imageUrl }"
                                            width="221" height="195"
                                            alt="${borrows.inventoryItem.puzzle.name } Puzzle">
                                        <p>
                                            Borrow date:
                                            <fmt:formatDate value="${borrows.borrowDate }"
                                                pattern="yyyy-MM-dd" />
                                        </p>
                                        <p>
                                            Return by:
                                            <fmt:formatDate value="${borrows.returnDate }"
                                                pattern="yyyy-MM-dd" />
                                        </p>
                                    </div>
                                </td>
                            </c:if>
                            <c:set var="borrowcount" value="${count + 1}" scope="page" />
                            </c:forEach>
                        </tr>
                    </table>
                </c:if>
            </div>
        </div>
        <c:if test="${empty borrows }">No Borrowed Puzzles</c:if>
    </div>
    </div>
    <div class="container bg-5 text-center">
        <h4 class="header">User Ratings</h4>
        <c:if test="${not empty userRatings}">
            <div class="container bg-5 text-center">
                <h5>Your Rating: ${rating } out of ${fn:length(userRatings)}
                    ratings</h5>
            </div>
            <div class="container bg-5 text-left">
                <c:forEach var="ratings" items="${userRatings }">
                    <p>User that rated you: ${ratings.raterUser.userName}</p>
                    <p>Rating they gave you: ${ratings.rating}</p>
                    <p>Comment: ${ratings.comment}</p>
                    <hr>
                    <br>
                </c:forEach>
        </c:if>
        <c:if test="${empty userRatings}">No ratings available</c:if>
    </div>
    <div class="container bg-5 text-left">
        <h4 class="header">User Submitted Ratings</h4>
        <c:if test="${not empty userSubmittedRatings}">
            <c:forEach var="submittedRatings" items="${userSubmittedRatings }">
                <p>User Rated: ${submittedRatings.ratedUser.userName}</p>
                <p>Gave this user: ${submittedRatings.rating}</p>
                <p>Comment: ${submittedRatings.comment}</p>
               <hr>
               <br>
            </c:forEach>
        </c:if>
        <c:if test="${empty userSubmittedRatings}">No submitted ratings</c:if>
    </div>
    <jsp:include page="script.jsp" />
</body>
</html>

