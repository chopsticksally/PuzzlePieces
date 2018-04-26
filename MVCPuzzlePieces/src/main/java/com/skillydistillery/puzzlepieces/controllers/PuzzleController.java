package com.skillydistillery.puzzlepieces.controllers;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;

public class PuzzleController {
	@Autowired
	private PuzzleDAO puzzleDAO;
	@Requestmapping(path=)
	

}
//@Autowired
//private FilmDAO filmDAO;
//@RequestMapping(path = "getFilm.do")
//public ModelAndView getFilm(@RequestParam(name= "fid")Integer filmId) {
//	ModelAndView mv = new ModelAndView();
//	Film film = filmDAO.show(filmId);
//	mv.addObject("film",film);
//	mv.setViewName("film/show.jsp");
//	
//	return mv;