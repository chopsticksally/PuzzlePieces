package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.puzzlepieces.entities.InventoryItem;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

@Transactional
@Component
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User createUser(User user) {
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
	public UserInformation updateUser(int id, UserInformation updated) {
		UserInformation managedUserInfo = em.find(UserInformation.class, id);
		managedUserInfo.setFirstName(updated.getFirstName());
		managedUserInfo.setLastName(updated.getLastName());
		managedUserInfo.setAddress(updated.getAddress());
		
		em.persist(managedUserInfo);
		em.flush();
		return managedUserInfo;
	}
	
	@Override
	public List<User> searchUserByUserName(String userName) {
	
	String queryString = "SELECT u FROM User u  WHERE u.userName LIKE :name ";
    List<User> search = em.createQuery(queryString, User.class)
            .setParameter("name", "%" + userName + "%").getResultList();
    return search;
	}
	@Override
	public User userLoginByUserNameAndPassword(String userName, String password) {
	 String queryString = "SELECT u FROM User u WHERE u.userName = :name and u.password = :password";
     List<User> search = em.createQuery(queryString, User.class)
             .setParameter("name",  userName).setParameter("password", password).getResultList();
     if(search.size() != 0 ) {
     User user = search.get(0);
     return user;
     }
     else {
    	 return null;
     }
	}
	
	@Override
	public boolean destroy(int id) {
		try {
			boolean d = false;
			User it = em.find(User.class, id);
			em.remove(it);
			em.flush();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
