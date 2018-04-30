package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import com.skilldistillery.puzzlepieces.entities.Borrow;
import com.skilldistillery.puzzlepieces.entities.Category;
import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;
import com.skilldistillery.puzzlepieces.entities.UserRating;

public interface PuzzleDAO {

//	public List<InventoryItem> searchInventoryByCategoryName(String name);

	List<InventoryItem> retrieveAll();

	boolean destroy(int id);

	InventoryItem updateInventory(int id, InventoryItem updated);

	InventoryItem addInventory(InventoryItem p);

	List<InventoryItem> searchPuzzle(String name, int size, Condition condition);


	Request requestUserForPuzzle(InventoryItem id, User loggedInUser);

	InventoryItem updateRequest(Integer inventoryId);
	
	Category getCategoryByName(String catName);

	boolean notAcceptRequest(Request requestUpdate);

	boolean acceptRequestToBorrow(Request requestUpdate);

	boolean acceptRequestToOwn(Request requestUpdate);

	Request sendOrCreateRequest(int inventoryId, User user, String message);

	List<InventoryItem> getInventoryItemsByUserId(int userId);
	List<Borrow> getBorrowsByLoanerId(int userId);
	List<UserRating> getSubmittedRatingsByUserId(int userId);
	List<UserRating> getRatingOfUserByUserId(int userId);
	List<Request> getSentRequestsByUserId(int userId);
	List<Request> getReceivedByUserId(int userId);
	UserInformation getUserInformationByUserId(int userId);
	
}
