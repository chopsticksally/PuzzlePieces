package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import com.skilldistillery.puzzlepieces.entities.InventoryItem;

public interface PuzzleDAO {

	InventoryItem addPuzzle(InventoryItem p);

	InventoryItem update(int id, InventoryItem updated);

	InventoryItem retrieveById(int id);

	List<InventoryItem> retrieveAll();

	boolean destroy(int id);

}
