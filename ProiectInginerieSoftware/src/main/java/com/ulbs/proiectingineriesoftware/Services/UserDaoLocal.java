package com.ulbs.proiectingineriesoftware.Services;

import com.ulbs.proiectingineriesoftware.Common.PhotoDetails;
import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Models.Photo;
import com.ulbs.proiectingineriesoftware.Models.Role;
import com.ulbs.proiectingineriesoftware.Models.User;
import java.util.List;
import javax.ejb.Local;

@Local
public interface UserDaoLocal {

    void addUser(User users);

    void editUser(User users, int id);

    void deleteUser(int userID);

    User getUser(int userID);

    User getUserByUsername(String username);

    List<User> getAllUsers();

    User userLogin(String username, String password);

    boolean existsUserWithUsername(String username);

    boolean existsRoleWithName(String username);

    void addRole(Role role);

    List<Role> getAllRoles();

    String createUsername(String name, String prenume);

    boolean existsUsername(String username);

    void addRoleToUser(Role role, String username);

    Role getRole(String roleName);

    void deleteRole(String roleName);

    public User getUserProfile(String username);

    void setJobApplicantDeafult(String username);

    void confirmJob(String username);

    void setRoleDefaultForAllUsers(String roleName);

    void setUserPhoto(User user, Photo photo);

    public PhotoDetails findPhotoByUserId(Integer userId);

    void deleteAllApplicantsForJob(Job job);

    void recomandaUser(String username,String recruiterName);

}
