package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PuzzleRating {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
//	@Column(name= "puzzle_id")
//	private int puzzleId;
	@ManyToOne
	@JoinColumn(name="puzzle_id")
	private Puzzle puzzle;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
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


	public Puzzle getPuzzle() {
		return puzzle;
	}


	public void setPuzzle(Puzzle puzzle) {
		this.puzzle = puzzle;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "PuzzleRating [id=" + id + ", rating=" + rating + ", comment=" + comment
				+ "]";
	}
	
}
