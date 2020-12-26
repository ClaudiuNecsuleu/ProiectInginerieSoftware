package com.ulbs.proiectingineriesoftware.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@NamedQueries(
        @NamedQuery(name = "Users.getAll", query = "select u from User u"))
@Entity
@Table(name = "USERLIST")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USERID")
    private Integer userid;

    @NotNull
    @Column(name = "NAME")
    private String name;

    @NotNull
    @Column(name = "PRENUME")
    private String prenume;

    @NotNull
    @Column(name = "TELEFON")
    private String telefon;

    @NotNull
    @Column(name = "TELEFON_MOBIL")
    private String telefonMobil;

    @NotNull
    @Column(name = "MAIL")
    private String mail;

    @NotNull
    @Column(name = "FUNCTIA")
    private String functia;

    @NotNull
    @Column(name = "DESCRIERE")
    private String descriere;

    @Column(name = "USERNAME")
    private String username;

    @Column(name = "PASSWORD")
    private String password;

    @Column(name = "RECOMANDARE")
    private String recomandare;

    @ManyToOne
    private Role role;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    private List<Comment> commentsList;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)   //aceste conditii trebuie puse in clasa de baza aparent      
    @JoinColumn(name = "JobID")
    private Job job;

    @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)   //aceste conditii trebuie puse in clasa de baza aparent      
    @JoinColumn(name = "JobApplicant")
    private Job jobApplicant;

    @OneToOne(mappedBy = "userPhoto", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Photo photo;

    @OneToOne(mappedBy = "userFile", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private File file;

    public User() {
    }

    public User(Integer userid) {
        this.userid = userid;
    }

    public User(String name, String prenume, String telefon, String telefonMobil, String mail, String functia, String descriere, String username, String password) {

        //this.userid = id;
        this.name = name;
        this.prenume = prenume;
        this.telefon = telefon;
        this.telefonMobil = telefonMobil;
        this.mail = mail;
        this.functia = functia;
        this.descriere = descriere;
        this.username = username;
        this.password = password;

    }

    public User(String name, String prenume,String password, String telefon, String telefonMobil, String mail, String functia, String descriere, String username, Role role, List<Comment> commentsList, Job job, Job jobApplicant) {

        this.name = name;
        this.prenume = prenume;
        this.password=password;
        this.telefon = telefon;
        this.telefonMobil = telefonMobil;
        this.mail = mail;
        this.functia = functia;
        this.descriere = descriere;
        this.username = username;
        this.role = role;
        this.commentsList = commentsList;
        this.job = job;
        this.jobApplicant = jobApplicant;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public Job getJobApplicant() {
        return jobApplicant;
    }

    public void setJobApplicant(Job jobApplicant) {
        this.jobApplicant = jobApplicant;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public List<Comment> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<Comment> commentsList) {
        this.commentsList = commentsList;
    }

    public void addCommentsToList(Comment comments) {
        this.commentsList.add(comments);
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrenume() {
        return prenume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getTelefonMobil() {
        return telefonMobil;
    }

    public void setTelefonMobil(String telefonMobil) {
        this.telefonMobil = telefonMobil;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getFunctia() {
        return functia;
    }

    public void setFunctia(String functia) {
        this.functia = functia;
    }

    public String getDescriere() {
        return descriere;
    }

    public void setDescriere(String descriere) {
        this.descriere = descriere;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRecomandare() {
        return recomandare;
    }

    public void setRecomandare(String recomandare) {
        this.recomandare = recomandare;
    }

    @Override
    public String toString() {
        return "User{" + "userid=" + userid + ", name=" + name + ", prenume=" + prenume + ", telefon=" + telefon + ", telefonMobil=" + telefonMobil + ", mail=" + mail + ", functia=" + functia + ", descriere=" + descriere + ", username=" + username + ", role=" + role + ", commentsList=" + commentsList + ", job=" + job + '}';
    }

}
