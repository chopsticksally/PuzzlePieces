package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class UserInformation {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
//	@Column(name= "user_id")
//	private int userId;
	@OneToOne
	@JoinColumn(name= "user_id")
	private User user;
	private String address;
	@Column(name= "first_name")
	private String firstName;
	@Column(name= "last_name")
	private String lastName;
	
	public UserInformation(){
		
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", userId=" + ", address=" + address + ", firstName=" + firstName
				+ ", lastName=" + lastName + "]";
	}
	

}
