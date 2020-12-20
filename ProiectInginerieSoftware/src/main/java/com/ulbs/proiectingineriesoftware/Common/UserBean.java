package com.ulbs.proiectingineriesoftware.Common;

import com.ulbs.proiectingineriesoftware.Models.User;


public class UserBean {

    private String username;
    private String password;
    private String firstName;

    private String lastName;
    private String roleName;

    public void initializare(User user) {
        this.firstName = user.getName();
        this.password = user.getUsername();
        this.username = user.getUsername();
        this.lastName = user.getPrenume();
        this.roleName = user.getRole().getRolename();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String newFirstName) {
        firstName = newFirstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String newLastName) {
        lastName = newLastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String newPassword) {
        password = newPassword;
    }

    public String getUsername() {
        return username;
    }

    public void setUserName(String newUsername) {
        username = newUsername;
    }

}
