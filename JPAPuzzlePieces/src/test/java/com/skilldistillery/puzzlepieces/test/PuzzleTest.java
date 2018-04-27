package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Puzzle;

class PuzzleTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Puzzle puzzle;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		puzzle = new Puzzle();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Puzzle to Inventory Item")
	void test() {
		assertEquals("alex", em.find(Puzzle.class, 2).getInventoryItems().get(0).getCondtion());
	}
	@Test
	@DisplayName("Puzzle to Category")
	void test1() {
		assertEquals("Jungle", em.find(Puzzle.class, 2).getCategories().get(0).getName());
	}
	@Test
	@DisplayName("Puzzle to Puzzle Rating")
	void test2() {
		assertEquals("alex", em.find(Puzzle.class, 2).getPuzzleRatings().get(0).getComment());
	}
}
