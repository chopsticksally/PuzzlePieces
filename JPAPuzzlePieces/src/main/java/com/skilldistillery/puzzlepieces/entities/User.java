package com.skilldistillery.puzzlepieces.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Size(min = 3, max = 100)
	@Column(name = "username")
	private String userName;

	@Size(min = 4, max = 45)
	private String password;

	@OneToOne(mappedBy = "user", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private UserInformation userInformation;

	@OneToMany(mappedBy = "requestee")
	List<Request> requestsRecieved;

	@OneToMany(mappedBy = "requester")
	List<Request> requestsSent;

	@OneToMany(mappedBy = "ratedUser")
	List<UserRating> ratingsOfUser;

	@OneToMany(mappedBy = "raterUser")
	List<UserRating> ratingsOfOtherUsers;

	@OneToMany(mappedBy = "loaner")
	List<Borrow> loans;

	@OneToMany(mappedBy = "owner")
	List<InventoryItem> owns;

	@OneToMany(mappedBy = "user")
	List<PuzzleRating> puzzleRatings;

	public User() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserInformation getUserInformation() {
		return userInformation;
	}

	public void setUserInformation(UserInformation userInformation) {
		this.userInformation = userInformation;
	}

	public List<Request> getRequestsRecieved() {
		return requestsRecieved;
	}

	public void setRequestsRecieved(List<Request> requestsRecieved) {
		this.requestsRecieved = requestsRecieved;
	}

	public List<Request> getRequestsSent() {
		return requestsSent;
	}

	public void setRequestsSent(List<Request> requestsSent) {
		this.requestsSent = requestsSent;
	}

	public List<UserRating> getRatingsOfUser() {
		return ratingsOfUser;
	}

	public void setRatingsOfUser(List<UserRating> ratingsOfUser) {
		this.ratingsOfUser = ratingsOfUser;
	}

	public List<UserRating> getRatingsOfOtherUsers() {
		return ratingsOfOtherUsers;
	}

	public void setRatingsOfOtherUsers(List<UserRating> ratingsOfOtherUsers) {
		this.ratingsOfOtherUsers = ratingsOfOtherUsers;
	}

	public List<Borrow> getLoans() {
		return loans;
	}

	public void setLoans(List<Borrow> loans) {
		this.loans = loans;
	}

	public List<InventoryItem> getOwns() {
		return owns;
	}

	public void setOwns(List<InventoryItem> owns) {
		this.owns = owns;
	}

	public List<PuzzleRating> getPuzzleRatings() {
		return puzzleRatings;
	}

	public void setPuzzleRatings(List<PuzzleRating> puzzleRatings) {
		this.puzzleRatings = puzzleRatings;
	}

	public void addRequestRecieved(Request requestRecieved) {
		if (requestsRecieved == null) {
			requestsRecieved = new ArrayList<>();
		}
		if (!requestsRecieved.contains(requestRecieved)) {
			requestsRecieved.add(requestRecieved);
			if (requestRecieved.getRequestee() != null) {
				requestRecieved.getRequestee().getRequestsRecieved().remove(requestRecieved);
			}
		}
		requestRecieved.setRequestee(this);
	}

	public void removeRequestRecieved(Request requestRecieved) {
		requestRecieved.setRequestee(null);
		if (requestsRecieved != null) {
			requestsRecieved.remove(requestRecieved);
		}
	}

	public void addRequestSent(Request requestSent) {
		if (requestsSent == null) {
			requestsSent = new ArrayList<>();
		}
		if (!requestsSent.contains(requestSent)) {
			requestsSent.add(requestSent);
			if (requestSent.getRequester() != null) {
				requestSent.getRequester().getRequestsSent().remove(requestSent);
			}
		}
		requestSent.setRequester(this);
	}

	public void removeRequestSent(Request requestSent) {
		requestSent.setRequester(null);
		if (requestsSent != null) {
			requestsSent.remove(requestSent);
		}
	}

	public void addLoan(Borrow loan) {
		if (loans == null) {
			loans = new ArrayList<>();
		}
		if (!loans.contains(loan)) {
			loans.add(loan);
			if (loan.getInventoryItem() != null) {
				loan.getInventoryItem().getBorrows().remove(loan);
			}
		}
		loan.setLoaner(this);
	}

	public void removeLoan(Borrow loan) {
		loan.setInventoryItem(null);
		if (loans != null) {
			loans.remove(loan);
		}
	}

	public void addPuzzleRating(PuzzleRating puzzleRating) {
		if (puzzleRatings == null) {
			puzzleRatings = new ArrayList<>();
		}
		if (!puzzleRatings.contains(puzzleRating)) {
			puzzleRatings.add(puzzleRating);
			if (puzzleRating.getUser() != null) {
				puzzleRating.getUser().getPuzzleRatings().remove(puzzleRating);
			}
		}
		puzzleRating.setUser(this);
	}

	public void removePuzzleRating(PuzzleRating puzzleRating) {
		puzzleRating.setUser(null);
		if (puzzleRatings != null) {
			puzzleRatings.remove(puzzleRating);
		}
	}

	public void addOwn(InventoryItem own) {
		if (owns == null) {
			owns = new ArrayList<>();
		}
		if (!owns.contains(own)) {
			owns.add(own);
			if (own.getOwner() != null) {
				own.getOwner().getOwns().remove(own);
			}
		}
		own.setOwner(this);
	}

	public void removeOwn(InventoryItem own) {
		own.setOwner(null);
		if (owns != null) {
			owns.remove(own);
		}
	}

	public void addRatingOfUser(UserRating ratingOfUser) {
		if (ratingsOfUser == null) {
			ratingsOfUser = new ArrayList<>();
		}
		if (!ratingsOfUser.contains(ratingOfUser)) {
			ratingsOfUser.add(ratingOfUser);
			if (ratingOfUser.getRatedUser() != null) {
				ratingOfUser.getRatedUser().getRatingsOfUser().remove(ratingOfUser);
			}
		}
		ratingOfUser.setRatedUser(this);
	}

	public void removeRatingOfUser(UserRating ratingOfUser) {
		ratingOfUser.setRatedUser(null);
		if (ratingsOfUser != null) {
			ratingsOfUser.remove(ratingOfUser);
		}
	}

	public void addRatingOfOtherUser(UserRating ratingOfOtherUser) {
		if (ratingsOfOtherUsers == null) {
			ratingsOfOtherUsers = new ArrayList<>();
		}
		if (!ratingsOfOtherUsers.contains(ratingOfOtherUser)) {
			ratingsOfOtherUsers.add(ratingOfOtherUser);
			if (ratingOfOtherUser.getRaterUser() != null) {
				ratingOfOtherUser.getRaterUser().getRatingsOfOtherUsers().remove(ratingOfOtherUser);
			}
		}
		ratingOfOtherUser.setRaterUser(this);
	}

	public void removeRatingOfOtherUser(UserRating ratingOfOtherUser) {
		ratingOfOtherUser.setRaterUser(null);
		if (ratingsOfOtherUsers != null) {
			ratingsOfOtherUsers.remove(ratingOfOtherUser);
		}
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + "]";
	}

}
