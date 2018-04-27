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
import com.skilldistillery.puzzlepieces.entities.UserRating;

class UserRatingTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Request request;
	private UserRating userRating;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		userRating = new UserRating();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("User Rating to Rater")
	void test() {
		assertEquals("alex", em.find(UserRating.class, 2).getRaterUser().getUserName());
	}
	
	@Test
	@DisplayName("User Rating to Rated")
	void test1() {
		assertEquals("alex", em.find(UserRating.class, 2).getRatedUser().getUserName());
	}
	
}
		


