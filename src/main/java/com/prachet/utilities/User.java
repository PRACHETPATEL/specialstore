package com.prachet.utilities;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

public class User {
    private String fname;
    private String lname;
    private String email;
    private String phone;
    private UserAddress userAddress;

    public User(String fname, String lname, String email, String phone,UserAddress address) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
        this.userAddress = address;
    }

    public static void main(String[] args)  {
        String name="prachet";
        String message="Hello "+name+",\nPlease Verify your email address using this OTP: "+generateOTP(6)+"\n\n\n\nRegards,\nTeam SpecialStore.";
        String subject="Email Verification";
        String to="mailextra253@gmail.com";
        String from= StringRessource.getEmail();
        try {
            sendEmail(message,subject,to,from);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private static void sendEmail(String message, String subject, String to, String from) throws MessagingException {
        String host="smtp.gmail.com";
        Properties properties=System.getProperties();
        properties.put("mail.smtp.host",host);
        properties.put("mail.smtp.port","465");
        properties.put("mail.smtp.ssl.enable","true");
        properties.put("mail.smtp.auth","true");
        Session session=Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("specialstore.custom@gmail.com","hzasadlldfwuoksy");
            }
        });
        session.setDebug(true);
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(from);
        mimeMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
        mimeMessage.setText(message);
        Transport.send(mimeMessage);
    }
    private static String  generateOTP(int count) {

        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = new Random().nextInt(9);
            builder.append(character);
        }
        return builder.toString();
    }
}