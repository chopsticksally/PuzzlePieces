package com.skilldistillery.puzzlepieces.test;

import static org.junit.jupiter.api.Assertions.fail;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.puzzlepieces.entities.Address;

class AddressTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Address address;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("MVCPuzzlePieces");
		em = emf.createEntityManager();
		address = new Address();
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}


	@Test
	void test() {
		fail("Not yet implemented");
	}

}
