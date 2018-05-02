package com.skilldistillery.puzzlepieces.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.puzzlepieces.entities.Address;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.Puzzle;
import com.skilldistillery.puzzlepieces.entities.PuzzleRating;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;
import com.skilldistillery.puzzlepieces.entities.UserRating;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {
		UserInformation ui = new UserInformation();
		Address address = new Address();
		em.persist(user);
		ui.setUser(user);
		ui.setAddress(address);
		em.persist(ui);
		em.flush();
		return user;
	}

	@Override
	public User updateUser(int id, User updated) {
		User managedUser = em.find(User.class, id);
		managedUser.setUserName(updated.getUserName());
		managedUser.setPassword(updated.getPassword());

		em.persist(managedUser);
		em.flush();
		return managedUser;
	}

	@Override
	public UserInformation updateUserInformation(int id, UserInformation updated) {
		UserInformation managedUserInfo = em.find(UserInformation.class,
				em.find(User.class, id).getUserInformation().getId());
		managedUserInfo.setFirstName(updated.getFirstName());
		managedUserInfo.setLastName(updated.getLastName());
		managedUserInfo.setEmail(updated.getEmail());

		em.persist(managedUserInfo);
		em.flush();
		return managedUserInfo;
	}

	@Override
	public Address updateAddress(int id, Address updatedAddress) {
		Address managedAddress = em.find(Address.class,
				em.find(User.class, id).getUserInformation().getAddress().getId());
		managedAddress.setStreet(updatedAddress.getStreet());
		managedAddress.setStreet2(updatedAddress.getStreet2());
		managedAddress.setCity(updatedAddress.getCity());
		managedAddress.setState(updatedAddress.getState());
		managedAddress.setPostalCode(updatedAddress.getPostalCode());

		em.persist(managedAddress);
		em.flush();
		return managedAddress;
	}

	@Override
	public List<User> searchUserByUserName(String userName) {

		String queryString = "SELECT u FROM User u  WHERE u.userName LIKE :name ";
		List<User> search = em.createQuery(queryString, User.class).setParameter("name", "%" + userName + "%")
				.getResultList();
		return search;
	}

	@Override
	public User userLoginByUserNameAndPassword(String userName, String password) {
		String queryString = "SELECT u FROM User u WHERE u.userName = :name and u.password = :password";
		List<User> search = em.createQuery(queryString, User.class).setParameter("name", userName)
				.setParameter("password", password).getResultList();
		if (search.size() != 0) {
			User user = search.get(0);
			return user;
		} else {
			return null;
		}
	}

	@Override
	public boolean destroy(int id) {
		try {

			User it = em.find(User.class, id);
			Address ad = em.find(Address.class, it.getUserInformation().getAddress().getId());
			UserInformation ui = em.find(UserInformation.class, it.getUserInformation().getId());
			em.remove(ad);
			em.remove(ui);
			em.remove(it);
			em.flush();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean isUserNameTaken(String userName) {
		String query = "select u from User u where u.userName= :userName";
		List<User> userNames = em.createQuery(query, User.class).setParameter("userName", userName).getResultList();
		if (userNames.size() == 0) {
			return false;
		} else {
			return true;
		}

	}

	@Override
	public User getUserById(int userId) {
		User user = em.find(User.class, userId);
		return user;
	}

	@Override
	public UserRating createUserRating(int userId, UserRating userRating, HttpSession session) {
		UserRating addUserRating = new UserRating();
		User user = em.find(User.class, userId);
		User userLoggedIn = (User) session.getAttribute("userLoggedIn");
//		userRating.setRatedUser(user);
//		userRating.setRaterUser(userLoggedIn);
		addUserRating.setComment(userRating.getComment());
		addUserRating.setRating(userRating.getRating());
		addUserRating.setRaterUser(userLoggedIn);
		addUserRating.setRatedUser(user);
		em.persist(addUserRating);
		em.flush();
		return userRating;
	}

	@Override
	public PuzzleRating createPuzzleRating(int puzzleId, PuzzleRating puzzleRating, HttpSession session) {
		PuzzleRating addPuzzleRating = new PuzzleRating();
		Puzzle puzzle = em.find(Puzzle.class, puzzleId);
		User userLoggedIn = (User) session.getAttribute("userLoggedIn");
//		puzzleRating.setPuzzle(puzzle);
//		puzzleRating.setUser(userLoggedIn);
		addPuzzleRating.setComment(puzzleRating.getComment());
		addPuzzleRating.setUser(userLoggedIn);
		addPuzzleRating.setPuzzle(puzzle);
		addPuzzleRating.setRating(puzzleRating.getRating());
		em.persist(addPuzzleRating);
		em.flush();
		return puzzleRating;
	}

	@Override
	public Boolean checkIfUserHasRatedPuzzleBefore(User user, int invId) {
		InventoryItem item = em.find(InventoryItem.class, invId);
		Puzzle puzzle = item.getPuzzle();
		String query = "select pr from PuzzleRating pr where pr.puzzle.id = :id";
		List<PuzzleRating> puzzleRatings = em.createQuery(query, PuzzleRating.class).setParameter("id", puzzle.getId()).getResultList();
		Boolean ratedThePuzzle = false;
		for (PuzzleRating puzzleRating : puzzleRatings) {
			if(puzzleRating.getUser().getId() == user.getId()) {
				ratedThePuzzle = true;
			}
		}
		return ratedThePuzzle;
	}

	@Override
	public Boolean checkIfUserHasRatedUserBefore(User user, int userId) {
		User ratedUser = em.find(User.class, userId);
		String query = "select ur from UserRating ur where ur.ratedUser.id = :id";
		List<UserRating> userRatings = em.createQuery(query, UserRating.class).setParameter("id", ratedUser.getId()).getResultList();
		Boolean ratedTheUser = false;
		for (UserRating userRating : userRatings) {
			if(userRating.getRaterUser().getId() == user.getId()) {
				ratedTheUser = true;
			}
		}
		
		return ratedTheUser;
	}

	@Override
	public List<User> searchUserByUserRating(int rating) {
		String query = "select distinct(u) from User u join fetch u.ratingsOfUser";
		List<User> returnedList = new ArrayList<>();
		List<User>allUsers = em.createQuery(query, User.class).getResultList();
		for (User user : allUsers) {
			List<UserRating>urs = user.getRatingsOfUser();
			Double check = agrigateUserRating(urs);
			if(check >= rating) {
				returnedList.add(user);
			}
		}
		
		return returnedList;
	}
	
	public Double agrigateUserRating(List<UserRating> userRatings) {
		int rating = 0;
		double userAverage = 0.00;
		for (UserRating userRating : userRatings) {
			rating = rating + userRating.getRating();
		}
		if (userRatings.size() != 0) {
			double ratingP = (rating*100)/100;
			userAverage = ratingP / userRatings.size();
			userAverage = (Math.round(userAverage*100.0))/100.0;
		}
		return userAverage;

	}
}
