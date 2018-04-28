package com.skilldistillery.puzzlepieces.data;

import java.util.List;

import com.skilldistillery.puzzlepieces.entities.Address;
import com.skilldistillery.puzzlepieces.entities.User;
import com.skilldistillery.puzzlepieces.entities.UserInformation;

public interface UserDAO {

	User createUser(User user);

	public User updateUser(int id, User updated);


	List<User> searchUserByUserName(String userName);

	User userLoginByUserNameAndPassword(String userName, String password);

	boolean destroy(int id);
	
    UserInformation updateUserInformation(int id, UserInformation updated); 
    
    Address updateAddress(int id, Address updatedAddress);

    boolean isUserNameTaken(String userName);
}
