<div class="head">
	<img class="logo-header" src="css/images/PuzzlePiecesHeader.png"
		alt="Puzzle Pieces Header">
	<ul class="nav justify-content-center">
		<li class="active nav-item"><a class="nav-link"
			href="logged-in-home.do">Home</a></li>
		<li class="nav-item"><a class="nav-link"
			href="userProfile.do?userId=${userLoggedIn.id }">Profile</a></li>
		<li class="nav-item"><a class="nav-link" href="editProfile.do">Edit
				Profile</a></li>
		<li class="nav-item"><a class="nav-link"
			href="searchPuzzlePage.do">Search Puzzles</a></li>
		<li class="nav-item"><a class="nav-link" href="searchUserPage.do">Search
				Users</a></li>
		<form action="logout.do">
			<input type="hidden" name="id" value="${restaurant.id }" />
			<button type="submit" class="btn btn-secondary btn-sm"
				onclick=" return confirm('Are you sure you want to logout?')">Logout</button>
		</form>

	</ul>
</div>