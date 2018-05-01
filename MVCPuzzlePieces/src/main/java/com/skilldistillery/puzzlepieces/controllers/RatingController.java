package com.skilldistillery.puzzlepieces.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.entities.Borrow;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.PuzzleRating;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;
import com.skilldistillery.puzzlepieces.entities.UserRating;

@Controller
public class RatingController {
	@Autowired
	private PuzzleDAO pdao;
	@Autowired
	private UserDAO userdao;

	@RequestMapping(path = "puzzleRatingPage.do", method = RequestMethod.GET)
	public ModelAndView puzzleRatingPage(@RequestParam(name = "id") int inventoryId) {
		ModelAndView mv = new ModelAndView();
		InventoryItem ii = pdao.getInventoryItemById(inventoryId);
		mv.addObject("inventoryItem", ii);
		mv.setViewName("puzzle-rating");

		return mv;
	}

	@RequestMapping(path = "userRatingPage.do", method = RequestMethod.GET)
	public ModelAndView userRatingPage(@RequestParam(name = "id") int userId) {
		ModelAndView mv = new ModelAndView();
		User user = userdao.getUserById(userId);
		mv.addObject("user", user);
		mv.setViewName("user-rating");

		return mv;
	}

	@RequestMapping(path = "rateUser.do", method = RequestMethod.POST)
	public ModelAndView rateUser(UserRating userRating, @RequestParam(name = "id") int userId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		userdao.createUserRating(userId, userRating, session);
		List<Borrow> borrows = pdao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = pdao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = pdao.getRatingOfUserByUserId(userId);
		List<Request> userRequests = pdao.getReceivedByUserId(userId);
		List<Request> sentRequests = pdao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = pdao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = pdao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);

		mv.setViewName("other-user-profile");

		return mv;
	}

	@RequestMapping(path = "ratePuzzle.do", method = RequestMethod.POST)
	public ModelAndView ratePuzzle(PuzzleRating puzzleRating, @RequestParam(name = "id") int puzzleId,
			@RequestParam(name = "inventoryid") int inventoryId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		userdao.createPuzzleRating(puzzleId, puzzleRating, session);
		InventoryItem ii = pdao.getInventoryItemById(inventoryId);
		User user = userdao.getUserById(ii.getOwner().getId());
		List<PuzzleRating> puzRatings = pdao.getPuzzleRatingsByPuzzleId(puzzleId);
		Double d = agrigatePuzzleRating(puzRatings);
		mv.addObject(puzzleRating);
		mv.addObject("ii", ii);
		mv.addObject("user", user);
		mv.addObject("rating", d);
		mv.addObject("puzzle",ii.getPuzzle());

		mv.setViewName("puzzle-details");
		return mv;
	}

	public Double agrigatePuzzleRating(List<PuzzleRating> puzRatings) {
		int rating = 0;
		double puzzleAverage = 0;
		for (PuzzleRating puzzleRating : puzRatings) {
			rating = rating + puzzleRating.getRating();
		}
		if (puzRatings.size() != 0) {
			puzzleAverage = rating / puzRatings.size();
		}
		return puzzleAverage;

	}
}