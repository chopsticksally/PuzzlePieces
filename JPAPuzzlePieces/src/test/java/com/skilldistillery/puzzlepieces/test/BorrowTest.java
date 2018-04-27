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
	@DisplayName("Borrow")
	void test() {
		borrow = em.find(Borrow.class, 2);
		assertEquals(null, borrow.getBorrowDate());
	}

	@Test
	@DisplayName("Borrow to User")
	void test5() {
		String query = "select b from Borrow b join fetch b.loaner where b.id = :id";
		assertEquals("xian", em.createQuery(query, Borrow.class).setParameter("id", 2).getResultList().get(0)
				.getLoaner().getUserName());
	}

	@Test
	@DisplayName("Borrow to Inventory Item")
	void test1() {
		String query = "select b from Borrow b join fetch b.inventoryItem where id = 4";
		assertEquals(6, em.find(Borrow.class, 4).getInventoryItem().getId());
	}

}
