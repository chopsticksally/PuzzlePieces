package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="request")
public class Request {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	
//	@Column(name= "inventory_id")
//	private int inventoryId;
	@ManyToOne
	@JoinColumn(name="inventory_id")
	private InventoryItem inventoryItem;
	
//	@Column(name= "requester_id")
//	private int requesterId;
	@ManyToOne
	@JoinColumn(name = "requestee_id")
	private User requestee;
	
//	@Column(name= "requestie_id")
//	private int requestieId;
	@ManyToOne
	@JoinColumn(name = "requester_id")
	private User requester;
	
	
	private String message;
	private boolean active;
	private boolean accepted;
	
	
	public Request() {
		
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public User getRequestee() {
		return requestee;
	}


	public void setRequestee(User requestee) {
		this.requestee = requestee;
	}


	public User getRequester() {
		return requester;
	}


	public void setRequester(User requester) {
		this.requester = requester;
	}


	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public boolean isAccepted() {
		return accepted;
	}
	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
	public InventoryItem getInventoryItem() {
		return inventoryItem;
	}


	public void setInventoryItem(InventoryItem inventoryItem) {
		this.inventoryItem = inventoryItem;
	}


	@Override
	public String toString() {
		return "Request [id=" + id + ", inventoryId=" + " requestieId="
				
				+", message=" + message + ", active=" + active + ", accepted=" + accepted + "]";
	}

	
	
}
