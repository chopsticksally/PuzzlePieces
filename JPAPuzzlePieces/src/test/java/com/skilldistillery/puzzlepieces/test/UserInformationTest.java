package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

class UserInformationTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private UserInformation ui;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		ui = new UserInformation();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("UI to User")
	void test() {
		assertEquals("alex", em.find(UserInformation.class, 1).getFirstName());
		assertEquals("alex", em.find(User.class, 1).getUserInformation().getFirstName());
	}

}
