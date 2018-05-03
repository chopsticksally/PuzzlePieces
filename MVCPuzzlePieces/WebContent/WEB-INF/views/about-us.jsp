<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<jsp:include page="logged-in-navbar.jsp" />
	<div class="container text-center">
		<h1 class="header">Why Puzzle Pieces?</h1>
		<p id="whyPuzzles">Four unsuspecting students came together to
			create a mid-term project at Skill Distillery. Through careful
			brainstorming, came about the idea of bringing people together, piece
			by piece. These four students figured out a solution for people who
			were puzzled about what they were going to do with their finished
			puzzles. Through triumphs, errors, and slight puzzlement came about
			Puzzle Pieces.</p>
		<hr class="colorgraph">
		<h1 class="header">Meet the Team</h1>

		<div class="row" id="aboutUs">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<img alt="Picture of Alex" src="css/images/AlexPicture.png"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Alex Wagner</h3>
				<h4>Full-Stack Java Developer</h4>
				<p>Alex holds no ill-will towards puzzles as a concept, but he chooses to spend his free time doing other activities.</p>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<img alt="Picture of Julian" src="css/images/JulianPicture.png"
					class="headshot">
			</div>
			<div class="col-md-3 col-lg-3">
				<h3>Julian Goudy</h3>
				<h4>Full-Stack Java Developer</h4>
				<p>Julian has done puzzles, legos, and k'nex. He's even built a
					sand castle.</p>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<img alt="Picture of Miranda" src="css/images/MirandaPicture.jpg"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Miranda Martin</h3>
				<h4>Full-Stack Java Developer</h4>
				<p>Miranda is an actual puzzle owner, and is proud of her
					collection.</p>

			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" id="aboutUs">
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<img alt="Picture of Xian" src="css/images/XianPicture.jpg"
					class="headshot">
			</div>
			<div class="col-md-3">
				<h3>Xian Zheng</h3>
				<h4>Full-Stack Java Developer</h4>
				<p>Xian hasn't done a puzzle in over ten years, but is open to the idea of connecting puzzles again.</p>
			</div>
			<div class="col-md-3"></div>
		</div>

	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>