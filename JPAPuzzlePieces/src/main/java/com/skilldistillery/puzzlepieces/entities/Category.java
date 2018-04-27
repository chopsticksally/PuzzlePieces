package com.skilldistillery.puzzlepieces.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

@Indexed
@Entity
public class Category {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Field
	private String name;

	@ManyToMany(mappedBy="categories")
	private List<Puzzle>puzzles;
	
	public Category(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public List<Puzzle> getPuzzles() {
		return puzzles;
	}


	public void setPuzzles(List<Puzzle> puzzles) {
		this.puzzles = puzzles;
	}

	public void addPuzzle(Puzzle puzzle) {
		if(puzzles == null) {
			puzzles = new ArrayList<>();
		}
		if(!puzzles.contains(puzzle)) {
			puzzles.add(puzzle);
			puzzle.addCategory(this);
		}
	}
	
	public void removePuzzle(Puzzle puzzle) {
		if(puzzles != null && puzzles.contains(puzzle)) {
			puzzles.remove(puzzle);
			puzzle.removeCategory(this);
		}
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + "]";
	}
	
	
}
