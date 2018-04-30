package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

//import org.apache.lucene.search.Query;
//import org.apache.lucene.util.QueryBuilder;
//import org.hibernate.search.jpa.FullTextEntityManager;
//import org.hibernate.search.jpa.Search;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.puzzlepieces.entities.Category;
//import com.skilldistillery.puzzlepieces.entities.Category;
import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;

@Transactional
@Component
public class PuzzleDAOImpl implements PuzzleDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public InventoryItem addInventory(InventoryItem p) {
		em.persist(p);
		em.flush();
		return p;
	}

	@Override
	public InventoryItem updateInventory(int id, InventoryItem updated) {
		InventoryItem managedPuzzle = em.find(InventoryItem.class, id);
		managedPuzzle.setCondtion(updated.getCondtion());
		managedPuzzle.setPuzzle(updated.getPuzzle());
		managedPuzzle.setOwner(updated.getOwner());

		em.persist(managedPuzzle);
		em.flush();
		return managedPuzzle;
	}

//	@Override
//	public List<InventoryItem> searchInventoryByCategoryName(String name) {
//		String queryString = "SELECT i FROM InventoryItem i  WHERE i.category.name LIKE :name ";
//		List<InventoryItem> search = em.createQuery(queryString, InventoryItem.class)
//				.setParameter("name", "%" + name + "%").getResultList();
//		return search;
//	}

	@Override
	public List<InventoryItem> retrieveAll() {
		String query = "SELECT it From InventoryItem it";
		List<InventoryItem> puzzle = em.createQuery(query, InventoryItem.class).getResultList();
		return puzzle;
	}

	
	@Override
	public List<InventoryItem> searchPuzzle(String name, int size, Condition condition) {
		String queryString;
		List<InventoryItem> search = null;
		
		

		if (name != "" && size != 0 && condition != null) {
			queryString = "SELECT i FROM InventoryItem i  WHERE :cat MEMBER OF i.puzzle.categories AND i.puzzle.size = :size AND i.condition = :condition";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("cat",getCategoryByName(name) )
					.setParameter("size", size).setParameter("condition", condition).getResultList();

		} else if (size != 0 && condition != null) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.puzzle.categories.name LIKE :name";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("name", "%" + name + "%")
					.getResultList();
		} else if (name != null && condition != null) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.puzzle.size = :size";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("size", size).getResultList();
		} else if (name != null && size != 0) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.condition = :condition";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("condition", condition)
					.getResultList();

		} else if (condition != null) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.puzzle.categories.name LIKE :name AND i.puzzle.size = :size";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("name", "%" + name + "%")
					.setParameter("size", size).getResultList();
		} else if (size != 0) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.puzzle.categories.name LIKE :name AND i.condition = :condition";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("name", "%" + name + "%")
					.setParameter("condition", condition).getResultList();
		} else if (name != null) {
			queryString = "SELECT i FROM InventoryItem i  WHERE i.puzzle.size = :size AND i.condition = :condition";
			search = em.createQuery(queryString, InventoryItem.class).setParameter("size", size)
					.setParameter("condition", condition).getResultList();
		} else {
			queryString = "SELECT i FROM InventoryItem i";
			search = em.createQuery(queryString, InventoryItem.class).getResultList();
		}

		return search;
	}
	
	@Override
	public Request requestUserForPuzzle(InventoryItem id,  User loggedInUser) {
		Request request = new Request();
		request.setRequester(loggedInUser);
		request.setInventoryItem(em.find(InventoryItem.class, id));
		em.persist(request);
		em.flush();
		return request;
	}
	public Category getCategoryByName(String catName) {
		String queryString= "select c from Category c where c.name = :name";
		 List<Category> results = em.createQuery(queryString, Category.class).setParameter("name", catName)
		.getResultList();
		return results.get(0);
	}
		
	
	
	// FullTextEntityManager fullTextEntityManager =
	// Search.getFullTextEntityManager(em);
	//
	// try {
	// fullTextEntityManager.createIndexer().startAndWait();
	// } catch (InterruptedException e) {
	//
	// e.printStackTrace();
	// }
	//
	//// FullTextEntityManager fullTextEm = Search.getFullTextEntityManager(em);
	//// QueryBuilder tweetQb =
	// fullTextEm.getSearchFactory().buildQueryBuilder().forEntity(Tweet.class).get();
	//// Query fullTextQuery =
	// tweetQb.keyword().onField(Tweet_.message.getName()).matching(“validate
	// Hibernate”).createQuery();
	//// List results =
	// fullTextEm.createFullTextQuery(fullTextQuery).getResultList();
	// FullTextEntityManager fullTextEm = Search.getFullTextEntityManager(em);
	// QueryBuilder puzzleQb = (QueryBuilder)
	// fullTextEm.getSearchFactory().buildQueryBuilder().forEntity(Category.class).get();
	// Query fullTextQuery = ((org.hibernate.search.query.dsl.QueryBuilder)
	// puzzleQb).keyword().onField(Category.class.getName()).matching("pets").createQuery();
	// List<InventoryItem> results = fullTextEm.createFullTextQuery(fullTextQuery,
	// Category.class).getResultList();
	//
	// return results;
	// }

	@Override
	public boolean destroy(int id) {
		try {
			boolean d = false;
			InventoryItem it = em.find(InventoryItem.class, id);
			em.remove(it);
			em.flush();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public InventoryItem updateRequest(Integer inventoryId) {
		Request request = em.find(Request.class, inventoryId);
		
		return null;
	}

}
