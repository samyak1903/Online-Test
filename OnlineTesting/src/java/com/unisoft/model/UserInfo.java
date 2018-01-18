package com.unisoft.model;

public class UserInfo {
    private String userName;
    private String password;
    private String cpassword;
    private String roleName;
    private String email;
    private String name;
    private String secretQuestion;
    private String answer;

    public UserInfo() {
    }

    public UserInfo(String userName, String password, String cpassword, String roleName, String email, String name, String secretQuestion, String answer) {
        this.userName = userName;
        this.password = password;
        this.cpassword = cpassword;
        this.roleName = roleName;
        this.email = email;
        this.name = name;
        this.secretQuestion = secretQuestion;
        this.answer = answer;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }



    
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSecretQuestion() {
        return secretQuestion;
    }

    public void setSecretQuestion(String secretQuestion) {
        this.secretQuestion = secretQuestion;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    
    
}
