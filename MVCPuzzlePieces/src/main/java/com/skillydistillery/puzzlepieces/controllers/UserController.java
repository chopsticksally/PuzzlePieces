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

	@RequestMapping(path = "home.do", method = RequestMethod.GET)
	public String homePage() {
		return "home.jsp";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String loginPage() {
		return "login.jsp";

	}

	@RequestMapping(path = "loggedIn.do")
	public ModelAndView loggedIn() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("logged-in");
		return mv;

	}
}
