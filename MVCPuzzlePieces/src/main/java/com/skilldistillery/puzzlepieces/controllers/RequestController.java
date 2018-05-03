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
import com.skilldistillery.puzzlepieces.entities.Borrow;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;
import com.skilldistillery.puzzlepieces.entities.UserRating;

@Controller
public class RequestController {

	@Autowired
	private PuzzleDAO puzdao;

	@RequestMapping(path = "sendRequest.do", method = RequestMethod.POST)
	public ModelAndView sendingARequest(@RequestParam (name= "message")String message,@RequestParam(name= "id") int invId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("userLoggedIn");
		int userId = user.getId(); 	
		Request request = puzdao.sendOrCreateRequest(invId, user, message);
		List<Borrow> borrows = puzdao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzdao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzdao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzdao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzdao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzdao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzdao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("rating", rating);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.setViewName("user-profile");
		return mv;
	}

	@RequestMapping(path = "acceptingOrRejectingRequest.do", method = RequestMethod.POST)
	public ModelAndView acceptingOrRejectingARequest(@RequestParam(name ="id") int id,@RequestParam(name ="message") String message, @RequestParam(name = "choice") int choice, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("userLoggedIn");
		int userId = user.getId(); 	
		
		
		//MIGHT HAVE TO TRY TO ADD THE REQUEST BACK TO THE USER IN SESSION
		if (choice == 1) {
			puzdao.notAcceptRequest(id, message);
		}
		if (choice == 2) {
			User requester = puzdao.acceptRequestToBorrow(id, message);
			InventoryItem itemRequested = puzdao.getInventoryItemByRequestId(id);
			if(requester != null && itemRequested != null) {
				mv.addObject("userRequester", requester);
				mv.addObject("requestedItem", itemRequested);
			}
		}
		if (choice == 3) {
			User requester = puzdao.acceptRequestToOwn(id, message);
			InventoryItem itemRequested = puzdao.getInventoryItemByRequestId(id);
			if(requester != null && itemRequested != null) {
				mv.addObject("userRequester", requester);
				mv.addObject("requestedItem", itemRequested);
			}
		}
		List<Borrow> borrows = puzdao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzdao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzdao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzdao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzdao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzdao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzdao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("rating", rating);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.setViewName("user-profile");
		return mv;
	}
	
	@RequestMapping(path="makeRequest.do", method=RequestMethod.GET)
	public ModelAndView makingARequestPage(@RequestParam(name="id")int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("inventoryId", id);
		mv.setViewName("request");
		return mv;
	}
	
	@RequestMapping(path="replyToRequest.do", method=RequestMethod.GET)
	public ModelAndView replyingPage(@RequestParam(name="id")int id) {
		ModelAndView mv = new ModelAndView();
		Request request = puzdao.findRequestById(id);
		mv.addObject("request", request);
		mv.setViewName("reply-page");
		return mv;
	}
	
	public Double agrigateUserRating(List<UserRating> userRatings) {
		int rating = 0;
		double userAverage = 0.00;
		for (UserRating userRating : userRatings) {
			rating = rating + userRating.getRating();
		}
		if (userRatings.size() != 0) {
			double ratingP = (rating*100)/100;
			userAverage = ratingP / userRatings.size();
			userAverage = (Math.round(userAverage*100.0))/100.0;
		}
		return userAverage;

	}

}