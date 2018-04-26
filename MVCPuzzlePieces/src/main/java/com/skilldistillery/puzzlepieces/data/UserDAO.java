package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

public interface UserDAO {

	User createUser(User user);

	User updateUser(int id, User updated);

	UserInformation updateUser(int id, UserInformation updated);

	List<User> searchUserByUserName(String userName);

	List<User> userLoginByUserNameAndPassword(String userName, String password);

	boolean destroy(int id);

}
