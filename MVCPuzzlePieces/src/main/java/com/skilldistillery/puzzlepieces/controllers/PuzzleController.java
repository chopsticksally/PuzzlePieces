package com.skilldistillery.puzzlepieces.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.puzzlepieces.data.PuzzleDAO;
import com.skilldistillery.puzzlepieces.entities.Condition;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;

@Controller
public class PuzzleController {
	@Autowired
	private PuzzleDAO dao;

	@RequestMapping(path = "deleteInventory.do", method = RequestMethod.POST)
	public ModelAndView destroy(@RequestParam(name = "id") Integer inventoryId) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = dao.destroy(inventoryId);
		if (deleted) {
			mv.setViewName("redirect:success");
		}
		if (!deleted) {
			mv.setViewName("redirect:fail");
		}
		return mv;
	}

	@RequestMapping(path = "updateInventory.do", method = RequestMethod.POST)
	public ModelAndView updateInventory(@RequestParam(name = "id") Integer inventoryId, InventoryItem updated) {
		ModelAndView mv = new ModelAndView();
		try {
			InventoryItem ii = dao.updateInventory(inventoryId, updated);
			mv.addObject("updated", ii);
			mv.setViewName("redirect:success");
		} catch (IllegalArgumentException e) {
			mv.setViewName("redirect:fail");
		} catch (NullPointerException n) {
			mv.setViewName("redirect:fail");
		}
		return mv;
	}

	@RequestMapping(path = "addInventory.do", method = RequestMethod.POST)
	public ModelAndView addInventory(@RequestParam(name = "id") InventoryItem p) {
		ModelAndView mv = new ModelAndView();
		try {
			InventoryItem ii = dao.addInventory(p);
			mv.addObject("added", ii);
			mv.setViewName("redirect:success");
		} catch (IllegalArgumentException e) {
			mv.setViewName("redirect:fail");
		} catch (NullPointerException n) {
			mv.setViewName("redirect:fail");
		}
		return mv;
	}

	@RequestMapping(path = "retrieveAll.do", method = RequestMethod.GET)
	public ModelAndView retrieveAll() {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> inventoryItems = dao.retrieveAll();
		mv.addObject("inventoryItems", inventoryItems);
		mv.setViewName("home");
		return mv;

	}

	@RequestMapping(path = "searchPuzzle.do", method = RequestMethod.GET)
	public ModelAndView searchPuzzle(@RequestParam(name = "category")String name,
	@RequestParam(name = "size")Integer size,
	@RequestParam(name = "condition")Condition condition) {
		ModelAndView mv = new ModelAndView();
		List<InventoryItem> inventoryItems = dao.searchPuzzle(name);
		mv.addObject("inventroyItems", inventoryItems);
		mv.setViewName("showSearchedPuzzles");
		return mv;
		
	}

}
