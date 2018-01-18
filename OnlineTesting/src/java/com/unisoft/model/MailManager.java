package com.unisoft;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailManager {

    private static Session session;
    private static String from = "php.batch.2015@gmail.com";
    private static String passwd = "abc#1234";

    static {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(from, passwd);
                    }
                });
    }

    public static boolean sendRegistrationMail(String to) {
        boolean flag = true;
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("Registration");
            message.setText("Your registration with Online AddressBook has been Successfull");

            Transport.send(message);

        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
    public static boolean sendPasswordMail(String to, String pwd) {
        boolean flag = true;
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("New Password");
            message.setText("Your new password is : "+pwd);

            Transport.send(message);

        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }    
}
