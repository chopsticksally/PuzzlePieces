package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;

class RequestTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Request request;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		request = new Request();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("Request to Requester")
	void test() {
		assertEquals("alex", em.find(Request.class, 1).getRequester().getUserName());
	}
	@Test
	@DisplayName("Request to Requester")
	void test1() {
		assertEquals("alex", em.find(Request.class, 1).getRequestee().getUserName());
	}
	@Test
	@DisplayName("Request to Inventory Item")
	void test2() {
		assertEquals("alex", em.find(Request.class, 1).getInventoryItem().getCondtion());
	}

}
