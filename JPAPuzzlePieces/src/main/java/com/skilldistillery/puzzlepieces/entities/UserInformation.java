package com.skilldistillery.puzzlepieces.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_information")
public class UserInformation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	// @Column(name= "user_id")
	// private int userId;
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
//	@Column(name = "address_id")
//	private int addressId;
	private String email;

	@OneToOne(cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name = "address_id")
	private Address address;

	public UserInformation() {

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
		return "User [id=" + id + ", userId=" + ", address=" + address + ", firstName=" + firstName + ", lastName="
				+ lastName + "]";
	}

}
