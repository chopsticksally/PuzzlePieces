package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserRating {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name= "rated_user_id")
	private int ratedUserId;
	@Column(name= "rater_user_id")
	private int raterUserId;
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
	public int getRatedUserId() {
		return ratedUserId;
	}
	public void setRatedUserId(int ratedUserId) {
		this.ratedUserId = ratedUserId;
	}
	public int getRaterUserId() {
		return raterUserId;
	}
	public void setRaterUserId(int raterUserId) {
		this.raterUserId = raterUserId;
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
		return "UserRating [id=" + id + ", ratedUserId=" + ratedUserId + ", raterUserId=" + raterUserId + ", rating="
				+ rating + ", comment=" + comment + "]";
	}
	
	

}
