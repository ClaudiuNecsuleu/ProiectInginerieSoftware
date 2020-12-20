package com.ulbs.proiectingineriesoftware.Services;

import com.ulbs.proiectingineriesoftware.Models.Comment;
import com.ulbs.proiectingineriesoftware.Models.Job;
import com.ulbs.proiectingineriesoftware.Models.User;
import java.util.List;
import javax.ejb.Local;

@Local
public interface CommentDaoLocal {

    void addCommentToUser(Comment comment, String username);

    void addCommentToJob(Comment comment, String username);

    void deleteComment(int commentID);

    List<Comment> getAllComments();

    void addComment(Comment comment);

    public void editComment(int commentID, Comment comments);

    Comment getCommentByID(int commentID);

    Comment getCommentByUserName(String username);

    List<Comment> getCommentsByUsername(String username);

    void deleteAllComments();

    List<User> getUsersList();
    
    List<Job> getJobsList();
    
     List<Comment> getAllCommentsByUser(String username);


}
