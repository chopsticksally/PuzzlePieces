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
import com.skilldistillery.puzzlepieces.entities.UserInformation;

class UserTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		user = new User();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	@DisplayName("User to UI")
	void test() {
		assertEquals("alex", em.find(User.class, 1).getUserInformation().getFirstName());
	}

	@Test
	@DisplayName("Requestee to Request")
	void test1() {
		assertEquals(2, em.find(User.class, 2).getRequestsRecieved().get(0).getRequestee().getId());
	}

	@Test
	@DisplayName("Requester to Request")
	void test2() {
		assertEquals(6, em.find(User.class, 1).getRequestsSent().get(0).getId());
	}

	@Test
	@DisplayName("Rater to User Rating")
	void test3() {
		assertEquals(5, em.find(User.class, 3).getRatingsOfUser().get(0).getRating());
	}

	@Test
	@DisplayName("Rated to User Rating")
	void test7() {
		assertEquals(3, em.find(User.class, 1).getRatingsOfOtherUsers().get(0).getRating());
	}

	@Test
	@DisplayName("User to Borrow")
	void test4() {
		assertEquals(2, em.find(User.class, 2).getLoans().get(0).getLoaner().getId());
	}

	@Test
	@DisplayName("User to Inventory Item")
	void test5() {
		assertEquals("alex", em.find(User.class, 1).getOwns().get(0).getOwner().getUserName());
	}

	@Test
	@DisplayName("User to Puzzle Rating")
	void test6() {
		assertEquals(4, em.find(User.class, 1).getPuzzleRatings().get(0).getRating());
	}
}
