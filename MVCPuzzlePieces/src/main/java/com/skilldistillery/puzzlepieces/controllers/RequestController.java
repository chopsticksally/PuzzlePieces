package com.skilldistillery.puzzlepieces.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Request;

@Controller
public class RequestController {

	@Autowired
	private PuzzleDAO dao;
	
	
	
	
	
	@RequestMapping(path="sendRequest.do", method=RequestMethod.POST)
	public ModelAndView sendingARequest(HttpSession session, InventoryItem invItem){
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(path="updateRequest.do", method=RequestMethod.POST)
	public ModelAndView acceptingOrRejectingARequest(Request request) {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
//	@RequestMapping(path="acceptRequestToBorrow.do", method=RequestMethod.POST)
//	public ModelAndView acceptingARequestToBorrow(HttpSession session, Request request) {
//		ModelAndView mv = new ModelAndView();
//		
//		
//		
//		return mv;
//	}
//	
//	@RequestMapping(path="acceptRequestToOwn.do", method=RequestMethod.POST)
//	public ModelAndView ARequest(HttpSession session, Request request) {
//		ModelAndView mv = new ModelAndView();
//		
//		
//		
//		return mv;
//	}
//	
//	@RequestMapping(path="notAcceptRequest.do", method=RequestMethod.POST)
//	public ModelAndView updatingARequest(HttpSession session, Request request) {
//		ModelAndView mv = new ModelAndView();
//		dao.updateRequest(inventoryId)
//		
//		
//		return mv;
//	}

}