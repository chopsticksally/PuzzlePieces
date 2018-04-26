package com.skilldistillery.puzzlepieces.entities;

import java.util.concurrent.locks.Condition;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class InventoryItem {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Enumerated(EnumType.STRING)
	private Condition condtion;
	@Column(name= "puzzle_id")
	private int puzzleId;
	@Column(name= "loaner_id")
	private int loanerId;
	@Column(name= "owner_id")
	private int ownerId;
	
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
	public int getPuzzleId() {
		return puzzleId;
	}
	public void setPuzzleId(int puzzleId) {
		this.puzzleId = puzzleId;
	}
	public int getLoanerId() {
		return loanerId;
	}
	public void setLoanerId(int loanerId) {
		this.loanerId = loanerId;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	@Override
	public String toString() {
		return "InventoryItem [id=" + id + ", condtion=" + condtion + ", puzzleId=" + puzzleId + ", loanerId="
				+ loanerId + ", ownerId=" + ownerId + "]";
	}
	

}
