package com.unisoft.model;

public class Test {
    private int id;
    private String examName;
    private String testName;
    private String description;
    private int numberOfQuestions;
    private double passPercentage;

    public Test() {
    }

    public Test(String examName, String testName, String description, int numberOfQuestions, double passPercentage) {
        this.examName = examName;
        this.testName = testName;
        this.description = description;
        this.numberOfQuestions = numberOfQuestions;
        this.passPercentage = passPercentage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfQuestions() {
        return numberOfQuestions;
    }

    public void setNumberOfQuestions(int numberOfQuestions) {
        this.numberOfQuestions = numberOfQuestions;
    }

    public double getPassPercentage() {
        return passPercentage;
    }

    public void setPassPercentage(double passPercentage) {
        this.passPercentage = passPercentage;
    }
    
    
}
