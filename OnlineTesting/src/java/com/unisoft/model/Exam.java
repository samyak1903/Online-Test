package com.unisoft.model;

public class Exam {
    private String examName;
    private String description;

    public Exam() {
    }

    public Exam(String examName, String description) {
        this.examName = examName;
        this.description = description;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
