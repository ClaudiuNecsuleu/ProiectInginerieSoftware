package com.ulbs.proiectingineriesoftware.Models;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@NamedQueries(
        @NamedQuery(name = "Comments.getAll", query = "select u from Comment u")
)
@Entity
@Table(name = "COMMENTS")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "COMMENTID")
    private Integer commentid;

    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "COMMENT")
    private String comment;

    @NotNull
    @Column(name = "DATE")
    private LocalDate date;

    @NotNull
    @Column(name = "TIME")
    private LocalTime time;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "UserID")
    private User user;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "JobID")
    private Job job;

    private String publisherUsername;

    public String getPublisherUsername() {
        return publisherUsername;
    }

    public void setPublisherUsername(String publisherUsername) {
        this.publisherUsername = publisherUsername;
    }

    public Comment() {
    }

    public Comment(Integer commentid) {
        this.commentid = commentid;
    }

    public Comment(String comment, LocalDate date, LocalTime time, String publisherUsername) {

        this.comment = comment;
        this.date = date;
        this.time = time;
        this.publisherUsername = publisherUsername;
    }



    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentid=" + commentid + ", comment=" + comment + ", date=" + date + ", time=" + time + ", user=" + user + '}';
    }

}
