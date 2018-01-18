package com.unisoft.model;

import java.util.HashMap;
import java.util.regex.Pattern;

public class ValidationManager {
    public static HashMap<String,String> validateUserInfo(UserInfo info){
        String userName = info.getUserName();
        String password = info.getPassword();
        String cpassword = info.getCpassword();
        String email = info.getEmail();
        String name = info.getName();
        String secretQuestion = info.getSecretQuestion();
        String answer = info.getAnswer();         
        HashMap<String,String> errors = new HashMap<String,String>();
        if(userName.equals("")){
            errors.put("userName", "UserName is Required");
        }
        if(password.equals("")){
            errors.put("password", "Password is Required");
        }
        if(email.equals("")){
            errors.put("email", "Email is Required");
        }     
        if(name.equals("")){
            errors.put("name", "Name is Required");
        }  
        if(secretQuestion.equals("")){
            errors.put("secretQuestion", "Question is Required");
        }
        if(answer.equals("")){
            errors.put("answer", "Answer is Required");
        }
        if(errors.isEmpty()){
            if(!Pattern.matches("[A-Za-z]+", userName)){
                errors.put("userName", "UserName is not Valid");
            }
            if(password.length()<5){
                errors.put("password", "Password too short");
            }
            if(!password.equals(cpassword)){
                errors.put("cpassword", "Password do not Match");
            }
            if(!Pattern.matches("[A-Za-z]+@[A-Za-z]+[.]com", email)){
                errors.put("email", "Email is not valid");
            }     
            if(!Pattern.matches("[A-Za-z]+(\\s[A-Za-z]+)*", name)){
                errors.put("name", "Name is not Valid");
            }            
        }
        if(errors.isEmpty()){
            if(DBManager.isUserExists(userName)){
                errors.put("userName", "Please select a different UserName");
            }
        }        
        return errors;
    }
}
