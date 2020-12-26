package com.ulbs.proiectingineriesoftware.Services;

import com.ulbs.proiectingineriesoftware.Common.FileDetails;
import com.ulbs.proiectingineriesoftware.Common.PhotoDetails;
import com.ulbs.proiectingineriesoftware.Common.SendEmail;
import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Models.File;
import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Models.Photo;
import com.ulbs.proiectingineriesoftware.Models.Role;
import com.ulbs.proiectingineriesoftware.Models.User;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

@Stateless
public class UserDao implements UserDaoLocal {

    private static final Logger LOG = Logger.getLogger(UserDao.class.getName());

    private JobDaoLocal jobDaoLocal;

    private String status = "failed";

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addUser(User users) {
        LOG.info("addUser");
        try {

            entityManager.persist(users);

            this.status = "ok";

        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public void editUser(User users, int id) {
        LOG.info("editUser");
        try {

            Query q = entityManager.createQuery("select u from User u where u.userid = :userId");   //query sql
            q.setParameter("userId", id);
            @SuppressWarnings("unchecked")
            List<User> usersList = q.getResultList();

            User userUpdate = usersList.get(0);

            userUpdate.setName(users.getName());                      //setare update
            userUpdate.setPrenume(users.getPrenume());
            userUpdate.setTelefon(users.getTelefon());
            userUpdate.setTelefonMobil(users.getTelefonMobil());
            userUpdate.setDescriere(users.getDescriere());
            userUpdate.setFunctia(users.getFunctia());
            userUpdate.setMail(users.getMail());
            entityManager.merge(userUpdate);          //salvare

        } catch (Exception e) {
            // throw new EJBException(e);
            //error
        }

    }

    @Override
    public void deleteUser(int userID) {
        LOG.info("deleteUser");
        try {

            /*   Query q = entityManager.createQuery("DELETE FROM User u where u.userid= :userIds");
            q.setParameter("userIds", userID);
            q.executeUpdate();*/                      //varianta1
            User user = entityManager.find(User.class, userID);

            List<Comment> commentsList = new ArrayList<Comment>();

            Role role = user.getRole();

            List<User> usersWithRole = role.getUserList();

            usersWithRole.remove(user);
            role.setUserList(usersWithRole);
            entityManager.merge(role);

            commentsList = user.getCommentsList();

            Query q = entityManager.createQuery("SELECT u FROM Job u");

            Job job = user.getJob();
            List<Job> jobPublishers = q.getResultList();

            if (jobPublishers != null) {
                for (Job jobPublisher : jobPublishers) {
                    if (jobPublisher.getPublisher().equals(user.getUsername())) {
                        job.setPublisher("Anonim");                               //ps ar trebui resetat ,dar da eroare
                    }
                }
            }

            if (user.getJob() != null) {

                List<User> usersList = job.getUsersList();
                usersList.remove(user);
                job.setUsersList(usersList);
            }

            Job jobApplicant = user.getJobApplicant();

            if (user.getJobApplicant() != null) {

                List<User> angajati = jobApplicant.getUsersApplicant();
                angajati.remove(user);
                jobApplicant.setUsersApplicant(angajati);

            }

            if (commentsList != null) {
                for (Comment comment : commentsList) {
                    comment.setUser(null);
                    entityManager.merge(comment);
                }
            }

            if (job != null) {
                entityManager.merge(job);
            }

            if (jobApplicant != null) {
                entityManager.merge(jobApplicant);
            }

            entityManager.remove(user);                        // in cele din urma stergem obiectul

        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public User getUser(int userID) {
        LOG.info("getUser");
        try {

            User users;

            users = entityManager.find(User.class,
                    userID);

            return users;

        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public Role getRole(String roleName) {
        LOG.info("getRole");
        try {

            List<Role> roles = getAllRoles();

            for (Role role : roles) {
                if (role.getRolename().equals(roleName)) {
                    return role;
                }
            }

            return null;

        } catch (Exception e) {

            throw new EJBException(e);
        }

    }

    public User getUserByUsername(String username) {
        LOG.info("getUserByUsername");
        try {
            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> user = q.getResultList();
            User getUser = user.get(0);

            return getUser;
        } catch (RuntimeException e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<User> getAllUsers() {
        LOG.info("getAllUsers");
        try {

            List<User> usersList;
            usersList = entityManager.createNamedQuery("Users.getAll").getResultList();

            return usersList;
        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public boolean existsUserWithUsername(String username) {
        LOG.info("existsUserWithUsername");
        try {

            List<User> usersList;
            usersList = entityManager.createNamedQuery("Users.getAll").getResultList();

            // entityManager.close();
            for (User user : usersList) {
                if (user.getUsername().equals(username)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public boolean existsRoleWithName(String name) {
        LOG.info("existsRoleWithName");
        try {

            List<Role> rolesList = getAllRoles();

            for (Role role : rolesList) {
                if (role.getRolename().equals(name)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public User userLogin(String username, String password) {
        LOG.info("userLogin");
        try {

            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> user = q.getResultList();
            if (!user.isEmpty()) {
                User getUser = user.get(0);

                LOG.info(getUser.getUsername());
                return getUser;
            } else {
                return null;
            }
        } catch (Exception e) {

            throw new EJBException(e);
        }

    }

    @Override
    public void addRole(Role role) {
        LOG.info("addRole");
        try {
            if (!existsRoleWithName(role.getRolename())) {
                entityManager.persist(role);
            }

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Role> getAllRoles() {
        LOG.info("getAllRoles");
        try {

            List<Role> rolesList;
            rolesList = entityManager.createNamedQuery("Roles.getAll").getResultList();

            return rolesList;
        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public String createUsername(String name, String prenume) {
        LOG.info("createUsername");
        String username = "";
        if (name != null) {
            if (name.length() >= 5) {
                username = name.substring(0, 5) + prenume.charAt(0);
            } else {
                username = name + prenume.charAt(0);
            }

            if (existsUsername(username)) {

                Random rn = new Random();
                int nr = Math.abs(rn.nextInt() % 100);
                LOG.info(String.valueOf(username));
                username = username + nr;
            }

            return username;
        } else {
            return " ";
        }
    }

    @Override
    public boolean existsUsername(String username) {

        return existsUserWithUsername(username);

    }

    @Override
    public void addRoleToUser(Role role, String username) {
        LOG.info("addRoleToUser");
        Query q = entityManager.createQuery("select u from User u where u.username = :username");
        q.setParameter("username", username);
        @SuppressWarnings("unchecked")
        List<User> user = q.getResultList();
        User getUser = user.get(0); //se retine in getUser userul cu usernameul unic username

        try {
            if (getUser != null) {
                if (existsRoleWithName(role.getRolename())) { //daca exista rolul in bd    
                    Query qr = entityManager.createQuery("select u from Role u where u.rolename = :rolename");
                    qr.setParameter("rolename", role.getRolename());
                    @SuppressWarnings("unchecked")
                    List<Role> roles = qr.getResultList();
                    Role getRole = roles.get(0);
                    getRole.addUserToRole(getUser);//se adauga userul la lista cu roluri
                    getUser.setRole(getRole);//se seteaza rolul userului
                    entityManager.merge(getRole);//se updateaza rolul in bd
                } else {//daca nu exista rolul in bd
                    addRole(role);//se adauga in bd               
                    role.addUserToRole(getUser);//se adauga userul la lista cu roluri
                    getUser.setRole(role);//se seteaza rolul userului
                }
                entityManager.merge(getUser);//se updateaza userul in bd
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteRole(String roleName) {
        LOG.info("deleteRole");
        try {
            if (existsRoleWithName(roleName)) {
                Role getRole = getRole(roleName);

//                getRole.setUserList(null);
//                entityManager.merge(getRole);
                List<User> users = getAllUsers();
                for (User user : users) {
                    if (user.getRole() == getRole) {
                        user.setRole(null);
                        entityManager.merge(user);
                    }
                }

                entityManager.remove(getRole);
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public User getUserProfile(String username) {
        try {
            LOG.info("getUserProfile");
            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> user = q.getResultList();
            User getUser = user.get(0);

            LOG.info(getUser.getUsername());

            return getUser;
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override

    public void setRoleDefaultForAllUsers(String roleName) {
        LOG.info("setRoleDefaultForAllUsers");
        try {
            List<User> users = getAllUsers();

            if (!users.isEmpty()) {
                for (User user : users) {
                    if (user.getRole().getRolename().equals(roleName)) {
                        user.setRole(getRole("Viewer"));
                        entityManager.merge(user);
                    }
                }
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void setJobApplicantDeafult(String username) {
        try {
            LOG.info("setJobApplicantDeafult");
            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> user = q.getResultList();
            User getUser = user.get(0);
            if (getUser != null) {
                getUser.setJobApplicant(null);
                getUser.setFunctia("Fara");
                entityManager.merge(getUser);
            }

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void confirmJob(String username) {
        try {
            LOG.info("confirmJob ,name " + username);
            //  User user = entityManager.find(User.class, id);
            Query qu = entityManager.createQuery("select u from User u where u.username = :username");
            qu.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> users = qu.getResultList();
            User user = users.get(0);
            if (user != null) {
                //  Job job;// = entityManager.find(Job.class, user.getJob().getJobid());
                Query q = entityManager.createQuery("select j from Job j where j.jobname = :jobname");
                q.setParameter("jobname", user.getJobApplicant().getJobname());
                @SuppressWarnings("unchecked")
                List<Job> jobs = q.getResultList();
                Job job = jobs.get(0);

                if (job.getRemainingjob() > 0) {
                    job.setRemainingjob(job.getRemainingjob() - 1);

                    LOG.info(job.getJobname());

                    user.setJob(job);
                    user.setJobApplicant(null);
                    user.setFunctia(job.getJobname());

                    List<User> users1;

                    users1 = job.getUsersApplicant();
                    users1.remove(user);
                    job.setUsersApplicant(users1);

                    job.addUserToList(user);

                    entityManager.merge(job);
                    entityManager.merge(user);
                    SendEmail.send(user.getMail(), "Ai fost acceptat in job-ul " + job.getJobname(), "Felicitari " + user.getUsername() + " pentru ocuparea acestui post! ", "abc12dll@gmail.com", "firmasoftwareabc12DLL");

                }
                if (job.getRemainingjob() == 0) {
                    deleteAllApplicantsForJob(job);
                }

            }
        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public void deleteAllApplicantsForJob(Job job) {
        LOG.info("deleteAllApplicantsForJob pt job=" + job.getJobname());
        try {
            List<User> users = getAllUsers();

            if (!users.isEmpty()) {
                for (User user : users) {
                    if (user.getJobApplicant() == job) {

                        user.setFunctia("Fara functie");
                        user.setJobApplicant(null);

                        entityManager.merge(user);
                    }
                }
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public void setUserPhoto(User user, Photo photo) {
        LOG.info("setUserPhoto");
        try {
            user.setPhoto(photo);
            photo.setUser(user);

            entityManager.persist(photo);
            entityManager.merge(user);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public PhotoDetails findPhotoByUserId(Integer userId) {
        LOG.info("findPhotoByUserId ,      userID: " + userId);
        TypedQuery<Photo> typedQuery = entityManager.createQuery("select p from Photo p where p.userPhoto.userid= :id", Photo.class).setParameter("id", userId);
        List<Photo> photos = typedQuery.getResultList();
        if (photos.isEmpty()) {
            return null;
        }
        Photo photo = photos.get(0);
        return new PhotoDetails(photo.getId(), photo.getFilename(), photo.getFileType(), photo.getFileContent());
    }

    @Override
    public void recomandaUser(String username, String recruiterName) {
        try {
            LOG.info("recomandaUser ,name " + username);

            Query qu = entityManager.createQuery("select u from User u where u.username = :username");
            qu.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> users = qu.getResultList();
            User user = users.get(0);
            user.setRecomandare(recruiterName);
            entityManager.merge(user);
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public FileDetails findFileByUserId(Integer userId) {
        LOG.info("findFileByUserId ,      userID: " + userId);
        TypedQuery<File> typedQuery = entityManager.createQuery("select p from File p where p.userFile.userid= :id", File.class).setParameter("id", userId);
        List<File> files = typedQuery.getResultList();
        if (files.isEmpty()) {
            return null;
        }
        File file = files.get(0);
        return new FileDetails(file.getId(), file.getFilename(), file.getFileType(), file.getFileContent());
    }

    @Override
    public void setUserFile(User user, File file) {
        LOG.info("setUserFile");
        try {
            user.setFile(file);
            file.setUser(user);

            entityManager.persist(file);
            entityManager.merge(user);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void updateProfile(User user, String telefon, String telefonMobil, String descriere) {
        LOG.info("updateProfile");
        try {
            user.setTelefon(telefon);
            user.setTelefonMobil(telefonMobil);
            user.setDescriere(descriere);

            entityManager.merge(user);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void changePasswprd(User user, String passwordSHA) {
        LOG.info("changePasswprd");
        try {
            user.setPassword(passwordSHA);
            entityManager.merge(user);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteUserPhoto(User user) {
        LOG.info("deleteUserPhoto");
        try {
            Photo photo = user.getPhoto();
            photo.setUser(null);
            user.setPhoto(null);
            entityManager.merge(user);
            if (!entityManager.contains(photo)) {
                photo = entityManager.merge(photo);
            }

            entityManager.remove(photo);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteUserCV(User user) {
        LOG.info("deleteUserCV");
        try {
            File file = user.getFile();
            file.setUser(null);
            user.setFile(null);
            entityManager.merge(user);
            if (!entityManager.contains(file)) {
                file = entityManager.merge(file);
            }

            entityManager.remove(file);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

}
