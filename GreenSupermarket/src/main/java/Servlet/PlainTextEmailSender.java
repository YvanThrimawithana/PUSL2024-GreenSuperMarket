package Servlet;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PlainTextEmailSender {

    public void sendPlainTextEmail(String host, String port, final String apiKey, String toAddress,
            String subject, String message) throws AddressException, MessagingException {

        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                // Use "apikey" as the username and the API key as the password
                return new PasswordAuthentication("apikey", apiKey);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        // Use a valid email address associated with your SendGrid account as the "from" address
        msg.setFrom(new InternetAddress("1greensupermarket@gmail.com")); // replace with a valid email
        InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // set plain text message
        msg.setText(message);

        // sends the e-mail
        Transport.send(msg);
    }

    /**
     * Test the send e-mail method
     *
     */
    public static void main(String Message,String mailto) {

        // SMTP server information
        String host = "smtp.sendgrid.net";
        String port = "587";
        // Use the API key as the "from" address
        String apiKey = "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";

        // outgoing message information
        String mailTo = mailto;
        String subject = "Order Receipt";
        String message = Message;

        PlainTextEmailSender mailer = new PlainTextEmailSender();

        try {
            mailer.sendPlainTextEmail(host, port, apiKey, mailTo, subject, message);
            System.out.println("Email sent.");
        } catch (Exception ex) {
            System.out.println("Failed to send email.");
            ex.printStackTrace();
        }
    }
}
