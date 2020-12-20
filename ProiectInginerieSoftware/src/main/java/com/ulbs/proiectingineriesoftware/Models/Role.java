package com.ulbs.proiectingineriesoftware.Models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@NamedQueries(
        @NamedQuery(name = "Roles.getAll", query = "select u from Role u"))
@Entity
@Table(name = "ROLE")
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ROLEID")
    private Integer roleid;

    @Column(name = "ROLENAME")
    private String rolename;

    @OneToMany(mappedBy="role", cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)   //aceste conditii trebuie puse in clasa de baza aparent 
    private List<User> userList = new ArrayList();

    public Role() {
    }

    public Role(String rolename) {
        this.rolename = rolename;
    }

    public Role(Integer roleid, String rolename) {
        this.roleid = roleid;
        this.rolename = rolename;
    }

 
    public void addUserToRole(User user){
        userList.add(user);
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "Role{" + "roleid=" + roleid + ", rolename=" + rolename + ", userList=" + userList + '}';
    }

}
