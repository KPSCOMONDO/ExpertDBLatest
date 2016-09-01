/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.expert.database.service.implement;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

/**
 *
 * @author sokchanny
 */
@Service
public class SendMailServiceImpl implements org.expert.database.service.SendMailService {

    @Override
    public void sendMaile(String address, String type, String msg) {
        final String username = "28polen@gmail.com";
        final String password = "*****";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("28polen@gmail.com")); //Sender
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("misoh049@gmail.com,tolapheng99@gmail.com"));

            if (type.equals("reset")) {
                message.setSubject("Khmer Academy - Reset Password");
            } else if (type.equals("fbSignUp")) {
                message.setSubject("Welcome to Khmer Academy");
            } else {
                message.setSubject("Khmer Academy - Email Verification");
            }

            message.setContent(msg, "text/html; charset=utf-8");

//			message.setText(msg);
            Transport.send(message);

//			System.out.println("Done");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }
}
	


