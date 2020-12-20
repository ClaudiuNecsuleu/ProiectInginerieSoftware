package com.ulbs.proiectingineriesoftware.Common;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {

    public static void sendEmail(String reciever) throws Exception {

        final String user = "abc12dll@gmail.com"; //sender's email address
        final String pass = "firmasoftwareabc12DLL";      //provide your pass here

//        System.out.println("Sending Email from " + user + " to " + reciever);

        Properties pr = new Properties();

        pr.put("mail.smtp.host", "smtp.gmail.com");
        pr.put("mail.smtp.socketFactory.port", "465");
        pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        pr.put("mail.smtp.auth", "true");
        pr.put("mail.smtp.port", "465");
        pr.put("mail.debug", "false");
        pr.put("mail.smtp.ssl.enable", "true");
        Session gs = Session.getInstance(pr, new javax.mail.Authenticator() {

            @Override
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(user, pass);
            }
        });

        Message ms = messageContent(gs, user, reciever);

//        System.out.println("Message sent! ");

    }

    private static Message messageContent(Session gs, String emailId, String reciever) throws Exception {
        try {

            Message msg = new MimeMessage(gs);
            msg.setFrom(new InternetAddress(emailId));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(reciever));
            msg.setSubject("V-ati inregistrat cu succes!"); //to set the subject (not mandatory)
            msg.setText("Felicitari, acum faceti parte din echipa noastra.");
            Transport.send(msg);
            return msg;
        } catch (MessagingException e) {
            System.out.println(e);
        }

        return null;

    }
}
