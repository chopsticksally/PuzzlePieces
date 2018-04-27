package com.skilldistillery.puzzlepeices.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.data.PuzzleDAOImpl;
import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.data.UserDAOImpl;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;

class UserTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	UserDAO dao;
	PuzzleDAO pDao;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		dao = new UserDAOImpl();
		pDao = new PuzzleDAOImpl();
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Testing retreiveAll method for the homepage")
	void test_puzzle_retrieval_home_page() {
		List<InventoryItem> ii = pDao.retrieveAll();
		assertEquals(1, ii.get(0).getId());
	}
	
	@Test
	@DisplayName("Test adding new inventory item to database")
	void test_create() {
		InventoryItem ii = new InventoryItem();
	}

}
