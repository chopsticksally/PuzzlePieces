package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Address {

	private int id;
	private String street;
	private String street2;
	private String state;
	private String city;
	private String postalCode;
	@OneToOne
	@JoinColumn(name="address_id")
	private UserInformation userInformation;
	
	public Address() {}
	
	
	public int getId() {
		return id;
	}

	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getStreet2() {
		return street2;
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}


	public UserInformation getUserInformation() {
		return userInformation;
	}


	public void setUserInformation(UserInformation userInformation) {
		this.userInformation = userInformation;
	}
	
	
	
}
