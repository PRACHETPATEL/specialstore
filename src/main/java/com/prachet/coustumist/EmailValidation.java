package com.prachet.coustumist;

import com.prachet.utilities.StringRessource;
import com.prachet.utilities.UserAddress;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.DispatcherType;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

//@WebFilter(filterName = "Emailvalidation",urlPatterns = "/otpverification",dispatcherTypes = DispatcherType.FORWARD)
public class EmailValidation extends HttpFilter {
    private static void sendEmail(String message, String subject, String to, String from) throws MessagingException {
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, StringRessource.getPass());
            }
        });
        session.setDebug(true);
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setSubject(subject);
        mimeMessage.setFrom(from);
        mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        mimeMessage.setText(message);
        Transport.send(mimeMessage);
    }

    private static String generateOTP(int count) {

        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = new Random().nextInt(9);
            builder.append(character);
        }
        return builder.toString();
    }

    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        UserAddress userAddress = (UserAddress) session.getAttribute("address1");
        String name = userAddress.getFname();
        String check = "";
        check = (String) session.getAttribute("otp");
        String to = userAddress.getEmail();
        String previous = (String) session.getAttribute("email");
        String otp = generateOTP(6);
        String verify = "false";
        verify = (String) session.getAttribute(to);
        if (verify == null) {
            if (!to.equals(previous) || check == null) {
                String message = "Hello " + name + ",\nPlease Verify your email address using this OTP: " + otp + "\n\n\n\nRegards,\nTeam SpecialStore.";
                String subject = "Email Verification";
                String from = StringRessource.getEmail();
                session.setAttribute("otp", otp);
                try {
                    sendEmail(message, subject, to, from);
                    session.setAttribute("email", to);
                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
            }
        }else {
            session.setAttribute("email", to);
        }
        chain.doFilter(request, response);
    }
}