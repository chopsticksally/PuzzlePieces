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
	@RequestMapping(path = "/loggingIn.do", method = RequestMethod.GET)
	public ModelAndView loggingIn(@Valid User user, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		User userLoggingIn = dao.userLoginByUserNameAndPassword(user.getUserName(), user.getPassword());

		if (userLoggingIn == null) {
			errors.rejectValue("userName", "error.userName", "Username or password is incorrect, please try again");
			mv.setViewName("login");
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
	public ModelAndView registering(User user, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		boolean userCheck = dao.isUserNameTaken(user.getUserName());
		if (userCheck == true) {
			errors.rejectValue("userName", "Username is taken, please enter a new Username");
			mv.setViewName("register");
		} else {
			dao.createUser(user);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("logged-in-home");
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
		try {

			user = dao.updateUser(userId, user);
			// mv.addObject("updated", user);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("redirect:success");
		} catch (Exception e) {
			mv.setViewName("redirect:fail");

		}
		return mv;

	}

	@RequestMapping(path = "/updateUserInformation.do", method = RequestMethod.POST)
	public ModelAndView updateUserInformation(@RequestParam(name = "id") Integer userId, UserInformation ui,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			UserInformation updatedUi = dao.updateUserInformation(userId, ui);
			// mv.addObject("ui", updatedUi );
			User user = (User) session.getAttribute("userLoggedIn");
			user.setUserInformation(updatedUi);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("redirect:success");
		} catch (Exception e) {

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

	@RequestMapping(path = "/updateAddress.do", method = RequestMethod.POST)
	public ModelAndView updateAddress(@RequestParam(name = "id") Integer userId, Address address, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			Address updatedAddress = dao.updateAddress(userId, address);
			// mv.addObject("address",updatedAddress );
			User user = (User) session.getAttribute("userLoggedIn");
			user.getUserInformation().setAddress(updatedAddress);
			session.setAttribute("userLoggedIn", user);
			mv.setViewName("redirect:success");
		} catch (Exception e) {
			mv.setViewName("redirect:fail");

		}
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
	public String userProfilePage() {
		return "user-profile";
	}

	@RequestMapping(path = "/searchUser.do", method = RequestMethod.GET)
	public ModelAndView searchUserByUserName(@RequestParam(name = "userName") String userName) {
		ModelAndView mv = new ModelAndView();
		List<User> users = dao.searchUserByUserName(userName);
		mv.addObject("users", users);
		mv.setViewName("searchedUsers");
		return mv;
	}

	@RequestMapping(path = "editProfile.do", method = RequestMethod.GET)
	public ModelAndView editProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("edit-profile");
		return mv;
	}

	@RequestMapping(path = "/*", method = RequestMethod.GET)
	public String fallback() {
		return "fallback";
	}
}
