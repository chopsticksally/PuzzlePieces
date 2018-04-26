package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PuzzleRating {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Column(name= "puzzle_id")
	private int puzzleId;
	private int rating;
	private String comment;

	
	public PuzzleRating(){
		
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPuzzleId() {
		return puzzleId;
	}
	public void setPuzzleId(int puzzleId) {
		this.puzzleId = puzzleId;
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
		return "PuzzleRating [id=" + id + ", puzzleId=" + puzzleId + ", rating=" + rating + ", comment=" + comment
				+ "]";
	}
	
}
