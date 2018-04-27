package com.skilldistillery.puzzlepieces.controllers;

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
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

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
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(path = "/login.do", method = RequestMethod.GET)
	public String loginPage() {
		return "login";

	}

	@RequestMapping(path = "/loggingIn.do", method = RequestMethod.GET)
	public ModelAndView loggingIn(@RequestParam("userName") String userName,
			@RequestParam(name = "password") String password, HttpSession session, Errors errors) {
		ModelAndView mv = new ModelAndView();
		User userLoggingIn = dao.userLoginByUserNameAndPassword(userName, password);
		if (userLoggingIn == null) {
			errors.rejectValue("userName", "Username or password is incorrect, please try again");

		}
		if (userLoggingIn != null) {
			session.setAttribute("userLoggedIn", userLoggingIn);
			mv.addObject("user", userLoggingIn);
			mv.setViewName("logged-in");
		}

		return mv;
	}
	
	@RequestMapping(path = "/register.do", method = RequestMethod.GET)
	public String registrationPage() {
		return "register";

	}

	@RequestMapping(path = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("log-out");
		return mv;

	}

	@RequestMapping(path = "/updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(@RequestParam(name = "id") Integer userId, UserInformation updated) {
		ModelAndView mv = new ModelAndView();
		try {
			UserInformation ui = dao.updateUser(userId, updated);
			mv.addObject("updated", ui);
			mv.setViewName("redirect:success");
		} catch (IllegalArgumentException e) {
			mv.setViewName("redirect:fail");
		} catch (NullPointerException n) {
			mv.setViewName("redirect:fail");
		}
		return mv;

	}

	@RequestMapping(path = "/searchUser.do", method = RequestMethod.GET)
	public ModelAndView searchUserByUserName(@RequestParam(name = "userName") String userName) {
		ModelAndView mv = new ModelAndView();
		List<User> users = dao.searchUserByUserName(userName);
		mv.addObject("users", users);
		mv.setViewName("searchedUsers");
		return mv;
	}

	@RequestMapping(path = "/puzzleDetails.do", method = RequestMethod.GET)
	public ModelAndView displayPuzzleDetails() {
		ModelAndView mv = new ModelAndView();
		try {

		} catch (NullPointerException n) {
			mv.setViewName("redirect:");
		}

		return mv;
	}

	@RequestMapping(path = "/*", method = RequestMethod.GET)
	public String fallback() {
		return "fallback";
	}
}
