package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.lucene.search.Query;
import org.apache.lucene.util.QueryBuilder;
import org.hibernate.search.jpa.FullTextEntityManager;
import org.hibernate.search.jpa.Search;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.puzzlepieces.entities.Category;
import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;

@Transactional
@Component
public class PuzzleDAOImpl implements PuzzleDAO{
	
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
		managedPuzzle.setLoaner(updated.getLoaner());
		managedPuzzle.setOwner(updated.getOwner());
        
        em.persist(managedPuzzle);
        em.flush();
        return managedPuzzle;
    }
	
	@Override
	public List<InventoryItem> searchInventoryByCategoryName(String name) {
	String queryString = "SELECT i FROM InventoryItem i  WHERE i.category.name LIKE :name ";
    List<InventoryItem> search = em.createQuery(queryString, InventoryItem.class)
            .setParameter("name", "%" + name + "%").getResultList();
    return search;
	}
	
	@Override
	public List<InventoryItem> retrieveAll() {
		String query = "SELECT it From InventoryItem it";
		List<InventoryItem> puzzle = em.createQuery(query, InventoryItem.class).getResultList();
		return puzzle;	
	}
	
	
	// THE METHOD BELOW IS NOT DONE
	@Override
	public List<InventoryItem> searchPuzzle(String name, int size, Condition condition) {
		FullTextEntityManager fullTextEntityManager = Search.getFullTextEntityManager(em);
		
		try {
			fullTextEntityManager.createIndexer().startAndWait();
		} catch (InterruptedException e) {
			
			e.printStackTrace();
		}
		
//		FullTextEntityManager fullTextEm = Search.getFullTextEntityManager(em);
//		QueryBuilder tweetQb = fullTextEm.getSearchFactory().buildQueryBuilder().forEntity(Tweet.class).get();
//		Query fullTextQuery = tweetQb.keyword().onField(Tweet_.message.getName()).matching(“validate Hibernate”).createQuery();
//		List results = fullTextEm.createFullTextQuery(fullTextQuery).getResultList();
		FullTextEntityManager fullTextEm = Search.getFullTextEntityManager(em);
		QueryBuilder puzzleQb = (QueryBuilder) fullTextEm.getSearchFactory().buildQueryBuilder().forEntity(Category.class).get();
		Query fullTextQuery = ((org.hibernate.search.query.dsl.QueryBuilder) puzzleQb).keyword().onField(Category.class.getName()).matching("pets").createQuery();
		List<InventoryItem> results = fullTextEm.createFullTextQuery(fullTextQuery, Category.class).getResultList();
			
		return results;
	}
	
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
	
}
