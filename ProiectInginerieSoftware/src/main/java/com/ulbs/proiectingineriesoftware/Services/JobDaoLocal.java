package com.ulbs.proiectingineriesoftware.Services;

import com.ulbs.proiectingineriesoftware.Models.Job;
import java.util.List;
import javax.ejb.Local;


@Local
public interface JobDaoLocal {

    void addJobToUser(String username, Job job);

    void deleteJob(int jobID);

    List<Job> getAllJobs();

    void editJob(int jobID, Job job);

    Job getJobByJobID(Integer jobID);

    List<Job> getJobByPublisher(String username);

    void deleteAllJobs();

    void deleteUserFromJob(String username);

    void addJob(Job job);

    boolean existsJobWithName(String name);

    void addUserApplicantToJob(String username, String jobname);
    
    void setStatusJob(int jobid);



}
