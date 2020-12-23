package com.ulbs.proiectingineriesoftware.Common;

import java.io.Serializable;

public class FileDetails implements Serializable{
    
    private Integer id;
    private String filename;
    private String fileType;
    private byte [] fileContent;

    public FileDetails(Integer id, String filename, String fileType, byte[] fileCntent) {
        this.id = id;
        this.filename = filename;
        this.fileType = fileType;
        this.fileContent = fileCntent;
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

    public void setFileCntent(byte[] fileCntent) {
        this.fileContent = fileCntent;
    }
    
    
    
}
