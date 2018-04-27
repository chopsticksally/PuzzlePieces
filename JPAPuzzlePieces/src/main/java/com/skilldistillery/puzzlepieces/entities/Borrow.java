package com.skilldistillery.puzzlepieces.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Borrow {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
//	@Column(name= "inventory_id")
//	private int inventoryId;
	@Column(name= "borrow_date")
	private Date borrowDate;
	@Column(name= "return_date")
	private Date returnDate;
	
	@ManyToOne()
	@JoinColumn(name = "inventory_id")
	private InventoryItem inventoryItem;
	
	@ManyToOne()
	@JoinColumn(name = "loaner_id")
	private User loaner;
	
	public Borrow(){
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
//	public int getInventoryId() {
//		return inventoryId;
//	}
//	public void setInventoryId(int inventoryId) {
//		this.inventoryId = inventoryId;
//	}
	public Date getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public InventoryItem getInventoryItem() {
		return inventoryItem;
	}


	public void setInventoryItem(InventoryItem inventoryItem) {
		this.inventoryItem = inventoryItem;
	}


	public User getLoaner() {
		return loaner;
	}


	public void setLoaner(User loaner) {
		this.loaner = loaner;
	}


	@Override
	public String toString() {
		return "Borrow [id=" + id + " borrowDate=" + borrowDate + ", returnDate="
				+ returnDate + "]";
	}

}
