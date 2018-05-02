package com.skilldistillery.puzzlepieces.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.entities.Address;
import com.skilldistillery.puzzlepieces.entities.Borrow;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.PuzzleRating;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;
import com.skilldistillery.puzzlepieces.entities.UserRating;

@Controller
public class UserController {
	@Autowired
	UserDAO dao;
	@Autowired
	private PuzzleDAO puzzleDao;

	@RequestMapping(path = "/home.do", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> ii = puzzleDao.retrieveAll();
		mv.addObject("inventoryItems", ii);
		// TEST
		System.out.println(ii.size());
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(path = "/logged-in-home.do", method = RequestMethod.GET)
	public ModelAndView loggedInHomePage() {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> ii = puzzleDao.retrieveAll();
		mv.addObject("inventoryItems", ii);
		mv.setViewName("logged-in-home");
		return mv;
	}

	@RequestMapping(path = "/login.do", method = RequestMethod.GET)
	public String loginPage() {
		return "login";

	}

	// @Validated
	@RequestMapping(path = "/loggingIn.do", method = RequestMethod.POST)
	public ModelAndView loggingIn(@Valid User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User userLoggingIn = dao.userLoginByUserNameAndPassword(user.getUserName(), user.getPassword());
		if (userLoggingIn == null) {
			mv.addObject("errorMessage", "Invalid login information");
			mv.setViewName("login");
			return mv;
		}

		if (userLoggingIn != null) {
			session.setAttribute("userLoggedIn", userLoggingIn);
			List<InventoryItem> ii = puzzleDao.retrieveAll();
			mv.addObject("inventoryItems", ii);
			mv.setViewName("logged-in-home");
		}
		return mv;
	}

	@RequestMapping(path = "/register.do", method = RequestMethod.GET)
	public String registrationPage() {
		return "register";

	}

	@RequestMapping(path = "registering.do", method = RequestMethod.POST)
	public ModelAndView registering(@RequestParam(name = "passwordConfirm") String confirm, User user, Errors errors,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		boolean userCheck = dao.isUserNameTaken(user.getUserName());
		if (userCheck == true && user.getPassword().equals(confirm)) {
			mv.addObject("errorMessage", "Username is taken, try again with a different username");
			mv.setViewName("register");
		}
		else if (!user.getPassword().equals(confirm)) {
			mv.addObject("errorMessage", "Password does not match, please try again.");
			mv.addObject("username", user.getUserName());
			mv.setViewName("register");
		} else {
			dao.createUser(user);
			session.setAttribute("userLoggedIn", user);
			List<InventoryItem> ii = puzzleDao.retrieveAll();
			mv.addObject("inventoryItems", ii);
			mv.setViewName("logged-in-home");
			
		}
		return mv;
	}

	@RequestMapping(path = "/registerUserInformation.do", method = RequestMethod.POST)
	public ModelAndView registerUserInformation(@RequestParam(name = "id") Integer userId, UserInformation ui,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			UserInformation updatedUi = dao.updateUserInformation(userId, ui);
			// mv.addObject("ui", updatedUi );
			User user = (User) session.getAttribute("userLoggedIn");
			user.setUserInformation(updatedUi);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("register-user-address");
		} catch (Exception e) {
			mv.setViewName("register-user-info");
		}
		return mv;

	}

	@RequestMapping(path = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(SessionStatus logout) {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> ii = puzzleDao.retrieveAll();
		mv.addObject("inventoryItems", ii);
		logout.setComplete();
		mv.setViewName("home");
		return mv;

	}

	@RequestMapping(path = "/updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(@RequestParam(name = "id") Integer userId, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		user = dao.updateUser(userId, user);
		session.setAttribute("userLoggedIn", user);
		List<Borrow> borrows = puzzleDao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzzleDao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzzleDao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzzleDao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzzleDao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzzleDao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzzleDao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.addObject("rating", rating);
		mv.setViewName("user-profile");

		return mv;

	}

	@RequestMapping(path = "/updateUserInformation.do", method = RequestMethod.POST)
	public ModelAndView updateUserInformation(@RequestParam(name = "id") Integer userId, UserInformation ui,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserInformation updatedUi = dao.updateUserInformation(userId, ui);
		User user = (User) session.getAttribute("userLoggedIn");
		user.setUserInformation(updatedUi);
		session.setAttribute("userLoggedIn", user);
		List<Borrow> borrows = puzzleDao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzzleDao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzzleDao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzzleDao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzzleDao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzzleDao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzzleDao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.addObject("rating", rating);
		mv.setViewName("user-profile");

		return mv;

	}

	@RequestMapping(path = "/updateAddress.do", method = RequestMethod.POST)
	public ModelAndView updateAddress(@RequestParam(name = "id") Integer userId, Address address, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Address updatedAddress = dao.updateAddress(userId, address);
		User user = (User) session.getAttribute("userLoggedIn");
		user.getUserInformation().setAddress(updatedAddress);
		session.setAttribute("userLoggedIn", user);
		List<Borrow> borrows = puzzleDao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzzleDao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzzleDao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzzleDao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzzleDao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzzleDao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzzleDao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.addObject("rating", rating);
		mv.setViewName("user-profile");

		return mv;

	}

	@RequestMapping(path = "/registerAddress.do", method = RequestMethod.POST)
	public ModelAndView registerAddress(@RequestParam(name = "id") Integer userId, Address address,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			Address updatedAddress = dao.updateAddress(userId, address);
			// mv.addObject("address",updatedAddress );
			User user = (User) session.getAttribute("userLoggedIn");
			user.getUserInformation().setAddress(updatedAddress);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("logged-in");
		} catch (Exception e) {
			mv.setViewName("register-user-address");

		}
		return mv;

	}

	@RequestMapping(path = "/searchUserPage.do", method = RequestMethod.GET)
	public String searchUserPage() {
		return "search-user";
	}

	@RequestMapping(path = "/userProfile.do", method = RequestMethod.GET)
	public ModelAndView userProfilePage(@RequestParam(name = "userId") Integer userId) {
		ModelAndView mv = new ModelAndView();
		List<Borrow> borrows = puzzleDao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzzleDao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzzleDao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		List<Request> userRequests = puzzleDao.getReceivedByUserId(userId);
		List<Request> sentRequests = puzzleDao.getSentRequestsByUserId(userId);
		List<UserRating> userSubmittedRatings = puzzleDao.getSubmittedRatingsByUserId(userId);
		UserInformation userInfo = puzzleDao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userRequests", userRequests);
		mv.addObject("sentRequests", sentRequests);
		mv.addObject("userSubmittedRatings", userSubmittedRatings);
		mv.addObject("userInfo", userInfo);
		mv.addObject("rating", rating);
		mv.setViewName("user-profile");
		return mv;
	}

	@RequestMapping(path = "/searchUser.do", method = RequestMethod.GET)
	public ModelAndView searchUserByUserName(@RequestParam(name = "userName") String userName) {
		ModelAndView mv = new ModelAndView();
		List<User> users = dao.searchUserByUserName(userName);
		mv.addObject("users", users);
		mv.setViewName("search-user-results");
		return mv;
	}

	@RequestMapping(path = "/searchUserByRating.do", method = RequestMethod.GET)
	public ModelAndView searchUserByUserRating(@RequestParam(name = "userRating") int rating) {
		ModelAndView mv = new ModelAndView();
		List<User> users = dao.searchUserByUserRating(rating);
		mv.addObject("users", users);
		mv.setViewName("search-user-results");
		return mv;
	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public ModelAndView editProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("edit-profile");
		return mv;
	}

	@RequestMapping(path = "otherUserProfile.do", method = RequestMethod.GET)
	public ModelAndView otherUserProfile(@RequestParam(name = "userId") int userId) {
		ModelAndView mv = new ModelAndView();
		List<Borrow> borrows = puzzleDao.getBorrowsByLoanerId(userId);
		List<InventoryItem> inventoryItems = puzzleDao.getInventoryItemsByUserId(userId);
		List<UserRating> userRatings = puzzleDao.getRatingOfUserByUserId(userId);
		Double rating = agrigateUserRating(userRatings);
		UserInformation userInfo = puzzleDao.getUserInformationByUserId(userId);
		mv.addObject("borrows", borrows);
		mv.addObject("inventoryItems", inventoryItems);
		mv.addObject("userRatings", userRatings);
		mv.addObject("userInfo", userInfo);
		mv.addObject("rating", rating);
		mv.setViewName("other-user-profile");
		return mv;
	}

	@RequestMapping(path = "/*", method = RequestMethod.GET)
	public String fallback() {
		return "fallback";
	}

	public Double agrigateUserRating(List<UserRating> userRatings) {
		int rating = 0;
		double userAverage = 0.00;
		for (UserRating userRating : userRatings) {
			rating = rating + userRating.getRating();
		}
		if (userRatings.size() != 0) {
			double ratingP = (rating * 100) / 100;
			userAverage = ratingP / userRatings.size();
			userAverage = (Math.round(userAverage * 100.0)) / 100.0;
		}
		return userAverage;

	}
}
