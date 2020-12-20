package com.ulbs.proiectingineriesoftware.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@NamedQueries(
        @NamedQuery(name = "Jobs.getAll", query = "select u from Job u"))
@Entity
@Table(name = "JOBS")
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "JOBID")
    private Integer jobid;

    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "JOBNAME")
    private String jobname;

    @NotNull
    @Column(name = "REMAININGJOB")
    private int remainingjob;

    @Size(max = 100)
    @Column(name = "DESCRIPTION")
    private String description;

    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "PUBLISHER")
    private String publisher;

    @OneToMany(mappedBy = "job")
    private List<User> usersApplicant;

    @OneToMany(mappedBy = "job")
    private List<User> usersList;

    @OneToMany(mappedBy = "job")
    private List<Comment> commentsList;

    public Job() {
    }

    public Job(Integer jobid) {
        this.jobid = jobid;
    }

    public Job(String jobname, int remainingjob, String description, String publisher) {
        this.jobname = jobname;
        this.remainingjob = remainingjob;
        this.description = description;
        this.publisher = publisher;
    }

    public List<User> getUsersApplicant() {
        return usersApplicant;
    }

    public void setUsersApplicant(List<User> usersApplicant) {
        this.usersApplicant = usersApplicant;
    }

    
    
    public List<Comment> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<Comment> commentsList) {
        this.commentsList = commentsList;
    }

    public void addCommentsList(Comment Comment) {
        this.commentsList.add(Comment);
    }

    public void addAplicantList(User user) {
        this.usersApplicant.add(user);
    }

    public List<User> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<User> usersList) {
        this.usersList = usersList;
    }

    public void addUserToList(User user) {
        this.usersList.add(user);
    }

    public Integer getJobid() {
        return jobid;
    }

    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname;
    }

    public int getRemainingjob() {
        return remainingjob;
    }

    public void setRemainingjob(int remainingjob) {
        this.remainingjob = remainingjob;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    @Override
    public String toString() {
        return "Job{" + "jobid=" + jobid + ", jobname=" + jobname + ", remainingjob=" + remainingjob + ", description=" + description + ", publisher=" + publisher + ", usersList=" + usersList + '}';
    }

}
