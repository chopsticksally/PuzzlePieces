<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container">
		<h1 class="header">Puzzle Pieces Creators</h1>
		<div class="row">
			<div class="col-md-3">
				<img alt="Picture of Alex" src="css/images/AlexPicture.png"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Alex Wagner</h3>
				<p>Full-Stack Java Developer</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<img alt="" src="">
			</div>
			<div class="col-md-3">
				<h3>Julian Goudy</h3>
				<p>Full-Stack Java Developer</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<img alt="" src="">
			</div>
			<div class="col-md-3">
				<h3>Miranda Martin</h3>
				<p>Full-Stack Java Developer</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<img alt="Picture of Xian" src="css/images/XianPicture.jpg"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Xian Zheng</h3>
				<p>Full-Stack Java Developer</p>
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>