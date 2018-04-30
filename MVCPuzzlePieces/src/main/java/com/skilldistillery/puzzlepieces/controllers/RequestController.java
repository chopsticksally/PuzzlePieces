package com.skilldistillery.puzzlepieces.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.entities.Request;
import com.skilldistillery.puzzlepieces.entities.User;

@Controller
public class RequestController {

	@Autowired
	private PuzzleDAO puzdao;

	@RequestMapping(path = "sendRequest.do", method = RequestMethod.POST)
	public ModelAndView sendingARequest(String message, int invId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		Request request = puzdao.sendOrCreateRequest(invId, user, message);
		user.addRequestSent(request);
		session.setAttribute("loggedInUser", user);
		mv.setViewName("USER PROFILE JSP HERE");
		return mv;
	}

	@RequestMapping(path = "acceptingOrRejectingRequest.do", method = RequestMethod.POST)
	public ModelAndView acceptingOrRejectingARequest(Request request, @RequestParam(name = "choice") int choice, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (choice == 1) {
			if(puzdao.notAcceptRequest(request)) {
//				User user = (User) session.getAttribute("loggedInUser");
//				session.setAttribute("loggedInUser", request);
			}
		}
		if (choice == 2) {
			if(puzdao.acceptRequestToBorrow(request)) {
//				session.setAttribute("loggedInUser", request);
			}
		}
		if (choice == 3) {
			if(puzdao.acceptRequestToOwn(request)) {
//				session.setAttribute("loggedInUser", value);
			}
		}

		mv.setViewName("USER PROFILE JSP HERE");
		return mv;
	}

	// @RequestMapping(path="acceptRequestToBorrow.do", method=RequestMethod.POST)
	// public ModelAndView acceptingARequestToBorrow(HttpSession session, Request
	// request) {
	// ModelAndView mv = new ModelAndView();
	//
	//
	//
	// return mv;
	// }
	//
	// @RequestMapping(path="acceptRequestToOwn.do", method=RequestMethod.POST)
	// public ModelAndView ARequest(HttpSession session, Request request) {
	// ModelAndView mv = new ModelAndView();
	//
	//
	//
	// return mv;
	// }
	//
	// @RequestMapping(path="notAcceptRequest.do", method=RequestMethod.POST)
	// public ModelAndView updatingARequest(HttpSession session, Request request) {
	// ModelAndView mv = new ModelAndView();
	// dao.updateRequest(inventoryId)
	//
	//
	// return mv;
	// }

}