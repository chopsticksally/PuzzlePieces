package com.skilldistillery.puzzlepieces.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.UserDAO;
import com.skilldistillery.puzzlepieces.entities.User;

@Controller
public class UserController {
	@Autowired
	UserDAO dao;

	@RequestMapping(path = "/home.do", method = RequestMethod.GET)
	public String homePage() {
		return "home";
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

	@RequestMapping(path = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("log-out");
		return mv;

	}

	@RequestMapping(path = "/updateUserInfo.do", method = RequestMethod.POST)
	public ModelAndView updateUserInfo() {
		ModelAndView mv = new ModelAndView();
		try {

		} catch (IllegalArgumentException e) {
			mv.setViewName("redirect:");
		} catch (NullPointerException n) {
			mv.setViewName("redirect:");
		}

		return mv;

	}

	@RequestMapping(path = "/searchUser.do", method = RequestMethod.GET)
	public ModelAndView searchUser() {
		ModelAndView mv = new ModelAndView();
		try {

		} catch (NullPointerException n) {
			mv.setViewName("redirect:");
		}

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
