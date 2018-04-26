package com.skillydistillery.puzzlepieces.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.UserDAO;

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
	public ModelAndView loggingIn() {
		ModelAndView mv = new ModelAndView();
		try {
			
			mv.setViewName("logged-in");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mv;
		
		
	}
	
//	@RequestMapping(path = "/loggedIn.do", method = RequestMethod.GET)
//	public ModelAndView loggedIn() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("logged-in");
//		return mv;
//
//	}

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

	@RequestMapping(path="/searchUser.do", method=RequestMethod.GET)
	public ModelAndView searchUser() {
		ModelAndView mv = new ModelAndView();
		try {
			

		} catch (NullPointerException n) {
			mv.setViewName("redirect:");
		}

		return mv;
	}
	
	@RequestMapping(path="/puzzleDetails.do", method=RequestMethod.GET)
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
