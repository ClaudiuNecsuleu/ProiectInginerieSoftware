package com.ulbs.proiectingineriesoftware.Services;

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
public class JobDao implements JobDaoLocal {

    private static final Logger LOG = Logger.getLogger(JobDao.class.getName());

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void addJob(Job job) {
        LOG.info("addJob");
        try {
            if (!existsJobWithName(job.getJobname())) {
                entityManager.persist(job);
            }

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void addJobToUser(String username, Job job) {
        LOG.info("addJobToUser");
        try {

            Query q = entityManager.createQuery("select u from User u where u.username = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> user = q.getResultList();
            User getUser = user.get(0);
            if (getUser != null) {

                if (existsJobWithName(job.getJobname())) {
                    Job getJob = getJobByJobID(job.getJobid());
                    getUser.setJob(getJob);
                    getJob.addUserToList(getUser);
                    entityManager.merge(getJob);

                    entityManager.merge(getUser);
                } else {
                    getUser.setJob(job);
                    job.addUserToList(getUser);

                    addJob(job);

                    entityManager.merge(getUser);
                }
            }
        } catch (RuntimeException e) {
            // throw new EJBException(e);
        }
    }

    @Override
    public void deleteJob(int jobID) { //sterge un job dupa id
        LOG.info("deleteJob");
        try {
            Job job = entityManager.find(Job.class, jobID);//se cauta jobul care are ID respectiv

            List<User> users = job.getUsersList(); //se iau toti userii care au jobul respectiv
            List<Comment> comments = job.getCommentsList();//se iau toate comentariile de la jobul respectiv

            if (users != null) {
                for (User user : users) { //ia userii care au/au candidat la jobul respectiv pe rand 
                    user.setJob(null); //seteaza jobul lor null
                    entityManager.merge(user);//modifica in BD
                }
            }

            if (comments != null) {
                for (Comment comment : comments) { //ia comentariile la postul respectiv pe rand 
                    comment.setJob(null);//sterge din BD

                }
            }

            entityManager.remove(job);
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteAllJobs() {
        LOG.info("deleteAllJobs");
        try {

            List<Job> jobsList = getAllJobs();
            for (Job job : jobsList) {//sterge toate joburile dupa id
                deleteJob(job.getJobid());
            }

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void deleteUserFromJob(String username) {
        LOG.info("deleteUserFromJob");
        try {
            Query qu = entityManager.createQuery("select u from User u where u.username = :username");
            qu.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<User> users = qu.getResultList();
            User user = users.get(0);

            if (user != null) {
                Job job = user.getJob();
                List<User> userList = new ArrayList<User>();
                userList = job.getUsersList();
                userList.remove(user);
                job.setUsersList(userList);
                user.setJob(null);
                user.setFunctia("Fara");
                entityManager.merge(job);
                entityManager.merge(user);
            }
        } catch (EJBException e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void editJob(int jobID, Job job) {
        LOG.info("editJob");
        try {
            Query q = entityManager.createQuery("select j from Job j where j.jobid = :jobID");
            q.setParameter("jobID", jobID);
            @SuppressWarnings("unchecked")
            List<Job> jobs = q.getResultList();

            Job jobUpdate = job;             //ok ,vad ca merge si asa  
            jobUpdate.setJobid(jobID);

            entityManager.merge(jobUpdate);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Job> getAllJobs() {
        LOG.info("getAllJobs");
        try {
            List<Job> jobsList;
            jobsList = entityManager.createNamedQuery("Jobs.getAll").getResultList();

            return jobsList;
        } catch (Exception e) {

            throw new EJBException(e);
        }
    }

    @Override
    public Job getJobByJobID(Integer jobID) {
        LOG.info("getJobByJobID    jobid: " + jobID);
        try {
            Query q = entityManager.createQuery("select j from Job j where j.jobid = :jobID");
            q.setParameter("jobID", jobID);
            @SuppressWarnings("unchecked")
            List<Job> jobs = q.getResultList();

            return jobs.get(0);

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public List<Job> getJobByPublisher(String username) {
        LOG.info("getJobByPublisher");
        try {
            Query q = entityManager.createQuery("select j from Job j where j.publisher = :username");
            q.setParameter("username", username);
            @SuppressWarnings("unchecked")
            List<Job> jobs = q.getResultList();

            return jobs;

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public boolean existsJobWithName(String name) { //daca nu exista in BD se returneaza false, daca exista se returneaza true
        LOG.info("existsJobWithName");
        try {
            List<Job> jobs = getAllJobs();
            for (Job job : jobs) {
                if (job.getJobname().equals(name)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void addUserApplicantToJob(String username, String jobname) {
        LOG.info("addUserApplicantToJob");
        try {
            Query q = entityManager.createQuery("select j from Job j where j.jobname = :jobname");
            q.setParameter("jobname", jobname);
            @SuppressWarnings("unchecked")
            List<Job> jobs = q.getResultList();
            Job job = jobs.get(0);

            if (job.getRemainingjob() > 0) {
                Query qu = entityManager.createQuery("select u from User u where u.username = :username");
                qu.setParameter("username", username);
                @SuppressWarnings("unchecked")
                List<User> users = qu.getResultList();
                User user = users.get(0);

                job.addAplicantList(user);
                user.setJobApplicant(job);

                entityManager.merge(job);
                entityManager.merge(user);
            }

        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    @Override
    public void setStatusJob(int jobid) {
        LOG.info("setStatusJob");
        try {
            Job job = entityManager.find(Job.class, jobid);
            job.setStatus("Aprobat");
            
            entityManager.merge(job);
            
        } catch (Exception e) {
            throw new EJBException(e);
        }

    }

}
