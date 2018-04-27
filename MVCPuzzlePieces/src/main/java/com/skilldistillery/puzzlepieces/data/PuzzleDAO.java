package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;

public interface PuzzleDAO {

//	public List<InventoryItem> searchInventoryByCategoryName(String name);

	List<InventoryItem> retrieveAll();

	boolean destroy(int id);

	InventoryItem updateInventory(int id, InventoryItem updated);

	InventoryItem addInventory(InventoryItem p);

	List<InventoryItem> searchPuzzle(String name, int size, Condition condition);

	
}
