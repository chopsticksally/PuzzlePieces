package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Puzzle {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private int size;
	private String imageUrl;
	private String name;
	
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


	@Override
	public String toString() {
		return "Puzzle [id=" + id + ", size=" + size + ", imageUrl=" + imageUrl + ", name=" + name + "]";
	}
	

}
