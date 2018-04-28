package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.puzzlepieces.entities.Address;
import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {
		Address address = new Address();
		em.persist(address);
		em.flush();
		UserInformation ui = new UserInformation();
		ui.setAddress(address);
		em.persist(ui);
		em.flush();
		user.setUserInformation(ui);
		em.persist(user);
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
}
