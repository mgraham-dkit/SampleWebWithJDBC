package daos;

import business.User;

import java.util.List;

/**
 *
 * @author grahamm
 */
public interface UserDaoInterface 
{
    public List<User> findAllUsers();
    public User findUserByUsernamePassword(String uname, String pword);
    public User findUserById(int id);
    public int addUser(String uname, String pword, String fName, String lName);
}
