package com.skilldistillery.puzzlepieces.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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
		managedPuzzle.setPuzzleId(updated.getPuzzleId());
		managedPuzzle.setLoanerId(updated.getLoanerId());
		managedPuzzle.setOwnerId(updated.getOwnerId());
        
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
	
	@Override
	public List<InventoryItem> searchPuzzle(String name, int size, Condition condition) {
		String queryString = "SELECT i FROM Inventory i WHERE";
		if(name != null) {
			queryString = queryString +" i.category.name LIKE :name"; }
		if(name != null && (size != 0 || condition != null)) {
			queryString = queryString + " AND ";
		}
		if (size != 0) {
			queryString = queryString + " i.puzzle.size = :size"; }
		if(size != 0 && condition != null) {
			queryString = queryString + " AND ";
		}
		if(condition != null) {
			queryString = queryString + " i.condition = :condition";
		}
		
		List<InventoryItem> puzzle = new ArrayList();
				if(name != null)em.createQuery(queryString, InventoryItem.class)
				
				.setParameter("name", "%" + name + "%").getResultList();
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
