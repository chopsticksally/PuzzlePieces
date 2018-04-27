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
	@DisplayName("Inventory Item to Request")
	void test() {
		assertEquals("alex", em.find(InventoryItem.class, 2).getRequests().get(0).getMessage());
	}
	
	@Test
	@DisplayName("Inventory Item to User")
	void test1() {
		assertEquals("alex", em.find(InventoryItem.class, 2).getOwner().getUserName());
	}
	
	@Test
	@DisplayName("Inventory Item to Borrow")
	void test2() {
		assertEquals("alex", em.find(InventoryItem.class, 2).getBorrows().get(0).getReturnDate());
	}
	
	@Test
	@DisplayName("Inventory Item to Puzzle")
	void test3() {
		assertEquals("alex", em.find(InventoryItem.class, 2).getPuzzle().getName());
	}

}
