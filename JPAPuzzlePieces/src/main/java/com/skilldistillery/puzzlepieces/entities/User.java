package com.skilldistillery.puzzlepieces.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name= "username")
	private String userName;
	private String password;
	
	@OneToOne(mappedBy="user")
	private UserInformation userInformation;
	
	@OneToMany(mappedBy = "requestee")
	List<Request> requestsRecieved;
	
	@OneToMany(mappedBy = "requester")
	List<Request> requestsSent;
	
	@OneToMany(mappedBy = "ratedUser")
	List<UserRating>ratingsOfUser;
	
	@OneToMany(mappedBy = "raterUser")
	List<UserRating>ratingsOfOtherUsers;
	
	@OneToMany(mappedBy = "loaner")
	List<InventoryItem> loans;
	
	@OneToMany(mappedBy = "owner")
	List<InventoryItem> owns;
	
	
	public User(){
		
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


	public List<InventoryItem> getLoans() {
		return loans;
	}


	public void setLoans(List<InventoryItem> loans) {
		this.loans = loans;
	}


	public List<InventoryItem> getOwns() {
		return owns;
	}


	public void setOwns(List<InventoryItem> owns) {
		this.owns = owns;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + "]";
	}
	

}
