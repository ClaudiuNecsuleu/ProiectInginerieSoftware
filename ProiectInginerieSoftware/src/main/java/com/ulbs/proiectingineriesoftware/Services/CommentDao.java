package com.ulbs.proiectingineriesoftware.Services;

import com.ulbs.proiectingineriesoftware.Common.SendEmail;
import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Models.User;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class CommentDao implements CommentDaoLocal {

    private static final Logger LOG = Logger.getLogger(CommentDao.class.getName());

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addCommentToUser(Comment comment, String username) {
        LOG.info("addCommentToUser");
        try {

            Query q = entityManager.createQuery("select u from User u where u.username = :username");   //query in baza de date
            q.setParameter("username", username);  //precizam cine este username din query
            @SuppressWarnings("unchecked")  //spunem compilatorului ca tot ce facem e legal (la unele compilatoare poate gasi asta ca eroare/warning)
            List<User> user = q.getResultList();      //preluam lista
            User getUser = user.get(0);         //trebuie sa avem doar 1 rezultat in acea lista
            if (getUser != null) {

                getUser.addCommentsToList(comment);        //actualizam datele
                comment.setUser(getUser);

                entityManager.persist(comment);             //efectuam tranzactiile
                entityManager.merge(getUser);

                SendEmail.send(getUser.getMail(), "Ai primit un comentariu! ", "Salut " + getUser.getUsername() + " ai primit comentariul: " + comment.getComment() + " de la " + comment.getPublisherUsername() + ".", "abc12dll@gmail.com", "firmasoftwareabc12DLL");

            }

        } catch (RuntimeException e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void addCommentToJob(Comment comment, String jobname) {
        LOG.info("addCommentToJob");
        try {

            Query q = entityManager.createQuery("select u from Job u where u.jobname = :jobname");       //ca mai sus aproape ,dar pt job
            q.setParameter("jobname", jobname);
            @SuppressWarnings("unchecked")
            List<Job> jobs = q.getResultList();
            Job getJob = jobs.get(0);
            if (getJob != null) {

                getJob.addCommentsList(comment);
                comment.setJob(getJob);

                entityManager.persist(comment);
                entityManager.merge(getJob);

                Query qu = entityManager.createQuery("select u from User u where u.username = :username");   //query in baza de date
                qu.setParameter("username", getJob.getPublisher());  //precizam cine este username din query
                @SuppressWarnings("unchecked")  //spunem compilatorului ca tot ce facem e legal (la unele compilatoare poate gasi asta ca eroare/warning)
                List<User> user = qu.getResultList();      //preluam lista
                User getUser = user.get(0);

                SendEmail.send(getUser.getMail(), "Ai primit un comentariu la job! ", "Salut " + getUser.getUsername() + ", ai primit comentariul: " + comment.getComment() + " de la " + comment.getPublisherUsername() + ".", "abc12dll@gmail.com", "firmasoftwareabc12DLL");

            }

        } catch (RuntimeException e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void addComment(Comment comment) {
        LOG.info("addComment");
        try {
            entityManager.persist(comment);                                 //comment simplu
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteComment(int commentID) {
        LOG.info("deleteComment");
        try {
            Query q = entityManager.createQuery("select c FROM Comment c where c.commentid = :commentID");        //putem folosi si entityManager.find(nume.class ,id);
            q.setParameter("commentID", commentID);
            @SuppressWarnings("unchecked")
            List<Comment> commentList;
            commentList = q.getResultList();
            Comment comment;
            comment = commentList.get(0);              // preluam obiectul din baza de date
            if (comment != null) {
                User user = comment.getUser();          //preluam obiectul de tip user din comment   
                if (user != null) {                        //testam daca user ul a fost sters
                    commentList = user.getCommentsList();
                    commentList.remove(comment);                  //stergem comentariu din lista
                    comment.setUser(null);
                    user.setCommentsList(commentList);          //setam  noua lista
                    entityManager.merge(user);                 //actualizam user   
                    entityManager.merge(comment);
                }
                entityManager.remove(comment);             //stergem
            }
             if (comment != null) {
                Job job = comment.getJob();          //preluam obiectul de tip user din comment   
                if (job != null) {                        //testam daca user ul a fost sters
                    commentList = job.getCommentsList();
                    commentList.remove(comment);                  //stergem comentariu din lista
                    comment.setJob(null);
                    job.setCommentsList(commentList);          //setam  noua lista
                    entityManager.merge(job);                 //actualizam user   
                    entityManager.merge(comment);
                }
                entityManager.remove(comment);             //stergem
            }


        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public void deleteAllComments() {
        LOG.info("deleteAllComments");
        try {
            List<Comment> commentsList;
            commentsList = entityManager.createNamedQuery("Comments.getAll").getResultList();

            for (Comment comment : commentsList) {
                User user = comment.getUser();
                user.getCommentsList().remove(comment);
                comment.setUser(null);
                entityManager.merge(user);
                entityManager.merge(comment);
                             //luam pe rand fiecare inserare din tabelul Comment si il stergem
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Comment> getAllComments() {
        LOG.info("getAllComments");
        try {
            List<Comment> commentsList = entityManager.createNamedQuery("Comments.getAll").getResultList();

            return commentsList;

        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public List<Comment> getAllCommentsByUser(String username) {
        LOG.info("getAllCommentsForUser");
        try {
            List<Comment> commentsList = entityManager.createNamedQuery("Comments.getAll").getResultList();

            List<Comment> commentsByUser = new ArrayList<Comment>();

            for (Comment comment : commentsList) {
                if (comment.getPublisherUsername().equals(username) && comment.getJob() == null) {
                    commentsByUser.add(comment);
                }
            }

            return commentsByUser;

        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public Comment getCommentByID(int commentID) {
        LOG.info("getCommentByID");
        try {
            Query q = entityManager.createQuery("select u from Comment u where u.commentid = :commentID");
            q.setParameter("commentID", commentID);
            @SuppressWarnings("unchecked")
            List<Comment> commentsList = q.getResultList();
            Comment getComment = commentsList.get(0);

            return getComment;
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public Comment getCommentByUserName(String username) {
        LOG.info("getCommentByUserName");
        try {
            Query q = entityManager.createQuery("select u from Users u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> usersList = q.getResultList();
            User getUser = usersList.get(0);

            List<Comment> commentsList = getUser.getCommentsList();

            return commentsList.get(0);
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Comment> getCommentsByUsername(String username) {
        LOG.info("getCommentsByUsername");
        try {
            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> usersList = q.getResultList();
            User getUser = usersList.get(0);

            return getUser.getCommentsList();
            
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void editComment(int commentID, Comment comments) {
        LOG.info("editComment");
        try {
            Query q = entityManager.createQuery("select u from Comment u where u.commentid = :commentID");
            q.setParameter("commentID", commentID);
            @SuppressWarnings("unchecked")
            List<Comment> commentsList = q.getResultList();
            Comment getComment = commentsList.get(0);  //preiau obiectul de tip comment dupa id
            if (getComment != null) {

                getComment.setComment(comments.getComment());       //setem noile valori
                getComment.setDate(comments.getDate());
                getComment.setTime(comments.getTime());

                User user = getComment.getUser();
                if (user != null) {
                    user.getCommentsList().remove(getComment);        //stergem commentul vechi
                    user.addCommentsToList(getComment);               //adaugam pe cel nou
                    entityManager.merge(user);
                }
                entityManager.merge(getComment);                  //efectuam update-urile

            }
        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

    @Override
    public List<User> getUsersList() {
        LOG.info("getUsersList");
        try {
            Query q = entityManager.createQuery("select u from User u");
            @SuppressWarnings("unchecked")                                              //lista de useri in comment 
            List<User> userList = q.getResultList();
            return userList;
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Job> getJobsList() {
        LOG.info("getJobsList");
        try {
            Query q = entityManager.createQuery("select u from Job u");
            @SuppressWarnings("unchecked")                                              //lista de useri in comment 
            List<Job> jobsList = q.getResultList();
            return jobsList;
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

}
