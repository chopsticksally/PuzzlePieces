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
import com.skilldistillery.puzzlepieces.entities.InventoryItem;

class InventoryItemTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private InventoryItem ii;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		ii = new InventoryItem();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Inventory Item")
	void testb() {
		assertEquals(2, em.find(InventoryItem.class, 2).getId());
	}
	@Test
	@DisplayName("Inventory Item to Request")
	void test() {
		String query = "select i from InventoryItem i join fetch i.requests where i.id = 3";
		assertEquals(2, em.createQuery(query, InventoryItem.class).getResultList().get(0).getRequests().get(0).getId());
	}
	
	@Test
	@DisplayName("Inventory Item to User")
	void test1() {
		String query = "select i from InventoryItem i join fetch i.owner where i.id = 2";
		assertEquals("alex", em.createQuery(query, InventoryItem.class).getResultList().get(0).getOwner().getUserName());
	}
	
	@Test
	@DisplayName("Inventory Item to Borrow")
	void test2() {
		String query = "select i from InventoryItem i join fetch i.owner where i.id = 2";
		assertEquals("alex", em.createQuery(query, InventoryItem.class).getResultList().get(0).getOwner().getUserName());
	}
	
	@Test
	@DisplayName("Inventory Item to Puzzle")
	void test3() {
		String query = "select i from InventoryItem i join fetch i.puzzle where i.id = 2";
		assertEquals("cool bear", em.createQuery(query, InventoryItem.class).getResultList().get(0).getPuzzle().getName());
	}

}
