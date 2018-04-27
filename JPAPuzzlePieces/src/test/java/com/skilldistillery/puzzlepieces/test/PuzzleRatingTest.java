package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.Category;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.PuzzleRating;

class PuzzleRatingTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private PuzzleRating puzzleRating;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		puzzleRating = new PuzzleRating();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Puzzle Rating")
	void test3() {
		assertEquals(4, em.find(PuzzleRating.class, 4).getId());
	}
	@Test
	@DisplayName("Puzzle Rating to Puzzle")
	void test() {
		String query = "select pr from PuzzleRating pr join fetch pr.puzzle where pr.id = 3";
		assertEquals(4, em.createQuery(query, PuzzleRating.class).getResultList().get(0).getPuzzle().getName());
	}

}
