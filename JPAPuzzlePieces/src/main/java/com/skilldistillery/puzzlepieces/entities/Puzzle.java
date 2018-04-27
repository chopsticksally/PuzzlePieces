package com.skilldistillery.puzzlepieces.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;

@Indexed
@Entity
public class Puzzle {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Field
	private int size;
	private String imageUrl;
	private String name;
	
	@OneToMany(mappedBy = "puzzle")
	private List<InventoryItem>inventoryItems;
	
	@OneToMany(mappedBy = "puzzle")
	private List<PuzzleRating>puzzleRatings;
	
	@ManyToMany
	@JoinTable(name="category_puzzle", 
	joinColumns=@JoinColumn(name="puzzle_id"),
	inverseJoinColumns=@JoinColumn(name="category_id"))
	private List<Category>categories;
	
	
	public Puzzle(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public List<InventoryItem> getInventoryItems() {
		return inventoryItems;
	}


	public void setInventoryItems(List<InventoryItem> inventoryItems) {
		this.inventoryItems = inventoryItems;
	}

	public List<PuzzleRating> getPuzzleRatings() {
		return puzzleRatings;
	}
	
	
	public void setPuzzleRatings(List<PuzzleRating> puzzleRatings) {
		this.puzzleRatings = puzzleRatings;
	}

	public List<Category> getCategories() {
		return categories;
	}


	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void addCategory(Category category) {
		if(categories == null) {
			categories = new ArrayList<>();
		}
		if(!categories.contains(category)) {
			categories.add(category);
			category.addPuzzle(this);
		}
	}
	
	public void removeCategory(Category category) {
		if(categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removePuzzle(this);
		}
	}
	
	public void addPuzzleRating(PuzzleRating puzzleRating) {
		if (puzzleRatings == null) {
			puzzleRatings = new ArrayList<>();
		}
		if(!puzzleRatings.contains(puzzleRating)) {
			puzzleRatings.add(puzzleRating);
			if
		}
	}
	
	@Override
	public String toString() {
		return "Puzzle [id=" + id + ", size=" + size + ", imageUrl=" + imageUrl + ", name=" + name + "]";
	}
	

}
