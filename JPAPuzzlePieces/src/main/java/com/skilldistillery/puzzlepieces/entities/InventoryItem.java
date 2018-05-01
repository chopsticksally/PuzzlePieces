package com.skilldistillery.puzzlepieces.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="inventory_item")
public class InventoryItem {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Enumerated(EnumType.STRING)
	
	@Column(name="puzzle_condition")
	private Condition condition;
	
//	@Column(name= "puzzle_id")
//	private int puzzleId;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="puzzle_id")
	private Puzzle puzzle;
	
//	@Column(name= "loaner_id")
//	private int loanerId;

//	@Column(name= "owner_id")
//	private int ownerId;
	@ManyToOne
	@JoinColumn(name="owner_id")
	private User owner;
	
	@OneToMany(mappedBy = "inventoryItem")
	private List<Request> requests;
	
	@OneToMany(mappedBy = "inventoryItem")
	private List<Borrow> borrows;
	
	
	public InventoryItem(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Condition getCondition() {
		return condition;
	}
	public void setCondition(Condition condition) {
		this.condition = condition;
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




	public User getOwner() {
		return owner;
	}


	public void setOwner(User owner) {
		this.owner = owner;
	}

	public void addRequest(Request request) {
		if (requests == null) {
			requests = new ArrayList<>();
		}
		if(!requests.contains(request)) {
			requests.add(request);
			if(request.getInventoryItem() != null) {
				request.getInventoryItem().getRequests().remove(request);
			}
		}
		request.setInventoryItem(this);
	}
	
	public void removeRequest(Request request) {
		request.setInventoryItem(null);
		if (requests != null) {
			requests.remove(request);
		}
	}
	
	public void addBorrow(Borrow borrow) {
		if (borrows == null) {
			borrows = new ArrayList<>();
		}
		if(!borrows.contains(borrow)) {
			borrows.add(borrow);
			if(borrow.getInventoryItem() != null) {
				borrow.getInventoryItem().getBorrows().remove(borrow);
			}
		}
		borrow.setInventoryItem(this);
	}
	
	public void removeBorrow(Borrow borrow) {
		borrow.setInventoryItem(null);
		if (borrows != null) {
			borrows.remove(borrow);
		}
	}

	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", condtion=" + condition;
	}
	

}
