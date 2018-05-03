<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container text-center">
		<h1 class="header">Puzzle Pieces Creators</h1>
		<div class="row" id="aboutUs">
			<div class="col-md-3">
				<img alt="Picture of Alex" src="css/images/AlexPicture.png"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Alex Wagner</h3>
				<p>Full-Stack Java Developer</p>
				<p>Alex Wagner is a published poet. And he does know it.</p>
			</div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3">
				<img alt="" src="">
			</div>
			<div class="col-md-3">
				<h3>Julian Goudy</h3>
				<p>Full-Stack Java Developer</p>
			</div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3">
				<img alt="Picture of Miranda" src="css/images/MirandaPicture.jpg"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Miranda Martin</h3>
				<p>Full-Stack Java Developer</p>

			</div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3">
				<img alt="Picture of Xian" src="css/images/XianPicture.jpg"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Xian Zheng</h3>
				<p>Full-Stack Java Developer</p>
				<p>Xian Zheng is a food blogger in her free time.</p>
			</div>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>