package com.skilldistillery.puzzlepieces.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class InventoryItem {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Enumerated(EnumType.STRING)
	private Condition condtion;
	
//	@Column(name= "puzzle_id")
//	private int puzzleId;
	@ManyToOne
	@JoinColumn(name="puzzle_id")
	private Puzzle puzzle;
	
//	@Column(name= "loaner_id")
//	private int loanerId;
	@ManyToOne
	@JoinColumn(name="loaner_id")
	private User loaner;

//	@Column(name= "owner_id")
//	private int ownerId;
	@ManyToOne
	@JoinColumn(name="owner_id")
	private User owner;
	
	@OneToMany(mappedBy = "inventoryItem")
	List<Request> requests;
	
	@OneToMany(mappedBy = "inventoryItem")
	List<Borrow> borrows;
	
	
	public InventoryItem(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Condition getCondtion() {
		return condtion;
	}
	public void setCondtion(Condition condtion) {
		this.condtion = condtion;
	}

	public Puzzle getPuzzle() {
		return puzzle;
	}


	public void setPuzzle(Puzzle puzzle) {
		this.puzzle = puzzle;
	}


	public List<Request> getRequests() {
		return requests;
	}


	public void setRequests(List<Request> requests) {
		this.requests = requests;
	}


	public List<Borrow> getBorrows() {
		return borrows;
	}


	public void setBorrows(List<Borrow> borrows) {
		this.borrows = borrows;
	}


	public User getLoaner() {
		return loaner;
	}


	public void setLoaner(User loaner) {
		this.loaner = loaner;
	}


	public User getOwner() {
		return owner;
	}


	public void setOwner(User owner) {
		this.owner = owner;
	}


	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", condtion=" + condtion;
	}
	

}
