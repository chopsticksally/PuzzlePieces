package com.skilldistillery.puzzlepieces.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.entities.Category;
import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Puzzle;
import com.skilldistillery.puzzlepieces.entities.PuzzleRating;
import com.skilldistillery.puzzlepieces.entities.User;

@Controller
public class PuzzleController {
	@Autowired
	private PuzzleDAO dao;
	@Autowired
	private UserDAO uDao;

		@RequestMapping(path = "addInventoryPage.do", method = RequestMethod.GET)
		public String addInventoryPage() {
			return "add-inventory";
		}
		
		@RequestMapping(path = "addInventory.do", method = RequestMethod.POST)
		public ModelAndView addInventory(Puzzle puzzle, @RequestParam(name = "condition") Integer condition,
				@RequestParam(name="categoryId")Integer categoryId, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			Condition con = null;
			if (condition == 1) {
				con = Condition.NEW;
			}
			if (condition == 2) {
				con = Condition.LIKE_NEW;
			}
			if (condition == 3) {
				con = Condition.USED;
			}
			if (condition == 4) {
				con = Condition.WORN;
			}
			
			InventoryItem added = dao.addInventory(puzzle, con, (User) session.getAttribute("userLoggedIn"), categoryId);
			if (added != null) {
				mv.addObject("added", added);
				mv.setViewName("success");
			}
			if (added == null) {
				mv.setViewName("add-inventory");
				mv.addObject("errorMessage", "You failed to add to your inventory. Please try again");
			}
			
			return mv;
		}

	@RequestMapping(path = "deleteInventory.do", method = RequestMethod.POST)
	public ModelAndView destroy(@RequestParam(name = "itemId") Integer inventoryId) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = dao.destroy(inventoryId);
		if (deleted) {
			mv.setViewName("success");
		}
		if (!deleted) {
			mv.setViewName("fail");
		}
		return mv;
	}

	@RequestMapping(path = "userInventoryDetails.do", method = RequestMethod.GET)
	public ModelAndView userInventoryDetailsPage(@RequestParam(name = "itemId") Integer itemId) {
		ModelAndView mv = new ModelAndView();
		InventoryItem ii = dao.getInventoryItemById(itemId);
		mv.addObject("item", ii);
		mv.setViewName("user-inventory");
		return mv;
	}

	@RequestMapping(path = "updateInventoryPage.do", method = RequestMethod.GET)
	public ModelAndView updateInventoryPage(@RequestParam(name = "itemId") Integer itemId) {
		ModelAndView mv = new ModelAndView();
		InventoryItem ii = dao.getInventoryItemById(itemId);
		mv.addObject("item", ii);
		mv.setViewName("edit-inventory");
		return mv;
	}

	@RequestMapping(path = "updateInventory.do", method = RequestMethod.POST)
	public ModelAndView updateInventory(@RequestParam(name = "id") Integer inventoryId,
			@RequestParam(name = "name") String name, @RequestParam(name = "imageUrl") String imageUrl,
			@RequestParam(name = "condition") Integer condition, @RequestParam(name = "size") Integer size,
			@RequestParam(name = "categoryId") Integer categoryId) {
		ModelAndView mv = new ModelAndView();
		Puzzle newPuzz = new Puzzle();
		newPuzz.setName(name);
		newPuzz.setImageUrl(imageUrl);
		newPuzz.setSize(size);
		newPuzz.setCategories(new ArrayList<Category>());
		Condition con = null;
		if (condition == 1) {
			con = Condition.NEW;
		}
		if (condition == 2) {
			con = Condition.LIKE_NEW;
		}
		if (condition == 3) {
			con = Condition.USED;
		}
		if (condition == 4) {
			con = Condition.WORN;
		}
		InventoryItem old = dao.getInventoryItemById(inventoryId);
		InventoryItem ii = dao.updateInventory(inventoryId, newPuzz, con, categoryId);
		if (ii != old) {
			mv.addObject("updated", ii);
			mv.setViewName("success");
		}
		if (ii == old) {
			mv.setViewName("edit-inventory");
			mv.addObject("errorMessage", "You failed to edit to your inventory. Please try again");
		}

		return mv;
	}


	@RequestMapping(path = "retrieveAll.do", method = RequestMethod.GET)
	public ModelAndView retrieveAll() {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> inventoryItems = dao.retrieveAll();
		mv.addObject("inventoryItems", inventoryItems);
		mv.setViewName("home");
		return mv;

	}

	@RequestMapping(path = "searchPuzzlePage.do", method = RequestMethod.GET)
	public String searchPuzzlePage() {
		return "search-puzzles";
	}

	@RequestMapping(path = "searchPuzzle.do", method = RequestMethod.GET)
	public ModelAndView searchPuzzle(@RequestParam(name = "category") String name,
			@RequestParam(name = "size") Integer size, @RequestParam(name = "condition") Integer condition) {
		ModelAndView mv = new ModelAndView();
		Condition con = null;
		if (condition == 1) {
			con = Condition.NEW;
		}
		if (condition == 2) {
			con = Condition.LIKE_NEW;
		}
		if (condition == 3) {
			con = Condition.USED;
		}
		if (condition == 4) {
			con = Condition.WORN;
		}
		List<InventoryItem> inventoryItems = dao.searchPuzzle(name, size, con);

		mv.addObject("puzzles", inventoryItems);
		mv.setViewName("search-puzzle-results");
		return mv;

	}

	@RequestMapping(path = "searchPuzzleByRating.do", method = RequestMethod.GET)
	public ModelAndView searchPuzzleByRating(@RequestParam(name = "puzzleRating") int rating) {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> inventoryItems = dao.searchPuzzleByRating(rating);
		mv.addObject("puzzles", inventoryItems);
		mv.setViewName("search-puzzle-results");
		return mv;

	}

	@RequestMapping(path = "updateRequest.do", method = RequestMethod.POST)
	public ModelAndView updateRequest(@RequestParam(name = "id") Integer inventoryId) {
		ModelAndView mv = new ModelAndView();
		InventoryItem ii = dao.updateRequest(inventoryId);
		mv.addObject(ii);

		return mv;

	}

	@RequestMapping(path = "request.do", method = RequestMethod.POST)
	public ModelAndView request(@RequestParam(name = "id") InventoryItem id, HttpSession session, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("userLoggedIn");
		dao.requestUserForPuzzle(id, loggedInUser);
		mv.setViewName("borrow");

		return mv;

	}

	@RequestMapping(path = "/puzzleDetails.do", method = RequestMethod.GET)
	public ModelAndView displayPuzzleDetails(@RequestParam(name = "puzzle") Integer inventoryId) {
		ModelAndView mv = new ModelAndView();
		InventoryItem ii = dao.getInventoryItemById(inventoryId);
		Integer puzzleId = ii.getPuzzle().getId();
		User user = uDao.getUserById(ii.getOwner().getId());
		List<PuzzleRating> puzRatings = dao.getPuzzleRatingsByPuzzleId(puzzleId);
		Double d = agrigatePuzzleRating(puzRatings);
		mv.addObject("ii", ii);
		mv.addObject("user", user);
		mv.addObject("rating", d);
		mv.addObject("puzzle", ii.getPuzzle());
		mv.setViewName("puzzle-details");

		return mv;
	}

	public Double agrigatePuzzleRating(List<PuzzleRating> puzRatings) {
		int rating = 0;
		double puzzleAverage = 0.00;
		for (PuzzleRating puzzleRating : puzRatings) {
			rating = rating + puzzleRating.getRating();
		}
		if (puzRatings.size() != 0) {
			double ratingP = (rating * 100) / 100;
			puzzleAverage = ratingP / puzRatings.size();
			puzzleAverage = Math.round(puzzleAverage * 100.0) / 100;
		}
		return puzzleAverage;

	}
}
