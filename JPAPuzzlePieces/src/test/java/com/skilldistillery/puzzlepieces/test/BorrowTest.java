package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.Borrow;
import com.skilldistillery.puzzlepieces.entities.UserRating;

class BorrowTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Borrow borrow;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		borrow = new Borrow();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Borrow to User")
	void test() {
		assertEquals("alex", em.find(Borrow.class, 2).getLoaner().getUserName());
	}
	@Test
	@DisplayName("Borrow to Inventory Item")
	void test1() {
		assertEquals(4, em.find(Borrow.class, 2).getInventoryItem().getId());
	}

}
