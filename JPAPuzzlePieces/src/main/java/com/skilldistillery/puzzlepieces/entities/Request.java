package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Request {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	@Column(name= "inventory_id")
	private int inventoryId;
	@Column(name= "requester_id")
	private int requesterId;
	@Column(name= "requestie_id")
	private int requestieId;
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
	public int getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}
	public int getRequesterId() {
		return requesterId;
	}
	public void setRequesterId(int requesterId) {
		this.requesterId = requesterId;
	}
	public int getRequestieId() {
		return requestieId;
	}
	public void setRequestieId(int requestieId) {
		this.requestieId = requestieId;
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
	@Override
	public String toString() {
		return "Request [id=" + id + ", inventoryId=" + inventoryId + ", requesterId=" + requesterId + ", requestieId="
				+ requestieId + ", message=" + message + ", active=" + active + ", accepted=" + accepted + "]";
	}

	
	
}
