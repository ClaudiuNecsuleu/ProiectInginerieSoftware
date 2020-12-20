package com.ulbs.proiectingineriesoftware.Models;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;


@Entity
public class Photo implements Serializable {

    private static final long serialVersionUID = 1L;

    String filename;
    String fileType;
    byte[] fileContent;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @OneToOne
    @JoinColumn(name = "USER_KEY")
    private User userPhoto;

    public Photo(){};
    
    public Photo(String filename, String fileType, byte[] fileContent) {
        this.filename = filename;
        this.fileType = fileType;
        this.fileContent = fileContent;

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public byte[] getFileContent() {
        return fileContent;
    }

    public void setFileContent(byte[] fileContent) {
        this.fileContent = fileContent;
    }

    public User getUser() {
        return userPhoto;
    }

    public void setUser(User user) {
        this.userPhoto = user;
    }

}
