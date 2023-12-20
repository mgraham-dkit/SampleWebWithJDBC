package daos;

import business.User;

import java.util.List;

/**
 *
 * @author grahamm
 */
public interface UserDaoInterface 
{
    List<User> findAllUsers();
    User findUserByUsernamePassword(String uname, String pword);
    User findUserById(int id);
    int addUser(String uname, String pword, String fName, String lName);
    int changePassword(String username, String oldPass, String newPass);
}
