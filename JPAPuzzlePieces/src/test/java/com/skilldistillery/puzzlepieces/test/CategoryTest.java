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
import com.skilldistillery.puzzlepieces.entities.Puzzle;

class CategoryTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Category category;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		category = new Category();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Category")
	void testb() {
		assertEquals(2, em.find(Category.class, 2).getId());
	}
	@Test
	@DisplayName("Category to Puzzle")
	void test() {
		assertEquals("beach", em.find(Category.class, 2).getPuzzles().get(0).getName());
	}

}
