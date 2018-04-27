package com.skilldistillery.puzzlepeices.test;

import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.data.UserDAOImpl;

class UserTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	UserDAO dao;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("VideoStore");
		em = emf.createEntityManager();
		dao = new UserDAOImpl();
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
		dao = null;
	}

	@Test
	void test() {
		fail("Not yet implemented");
	}

}
