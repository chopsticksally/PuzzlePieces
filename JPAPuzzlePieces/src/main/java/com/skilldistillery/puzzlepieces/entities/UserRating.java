package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserRating {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
//	@Column(name= "rated_user_id")
//	private int ratedUserId;
	@ManyToOne
	@JoinColumn(name="rated_user_id")
	private User ratedUser;
	
//	@Column(name= "rater_user_id")
//	private int raterUserId;
	@ManyToOne
	@JoinColumn(name="rater_user_id")
	private User raterUser;
	
	private int rating;
	private String comment;
	
	public UserRating(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	
	public User getRatedUser() {
		return ratedUser;
	}


	public void setRatedUser(User ratedUser) {
		this.ratedUser = ratedUser;
	}


	public User getRaterUser() {
		return raterUser;
	}


	public void setRaterUser(User raterUser) {
		this.raterUser = raterUser;
	}


	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "UserRating [id=" + id + ", rating="
				+ rating + ", comment=" + comment + "]";
	}
	
	

}
