package service;

//import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
//import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

import com.sun.mail.smtp.SMTPAddressFailedException;

public class SendMail{
	
	final static Logger logger = Logger.getLogger(SendMail.class);
	
	public static void sendMail(String receiverMail , String ReceiverName , String msg){
		logger.info("Inside send mail");

		try{
			String to = receiverMail;
			String from = "srtaskworkflow@gmail.com";//change accordingly
			final String username = "srtaskworkflow@gmail.com";//change accordingly
			final String password = "Gspann123";//change accordingly
			String host = "smtp.gmail.com";

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");

			Session session = Session.getInstance(props, new GmailAuthenticator(username, password));
			logger.info("Account authenticated successfully");
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject("Regarding TechQuo account");
			message.setText("Hello " + ReceiverName + ",\n" + msg);
						
			Transport.send(message);
			System.out.println("Sent message successfully....");
			
		}
		catch (SMTPAddressFailedException e){
			logger.error(e);
			System.out.println(e);
			
			
		}
		catch(Exception a){
			logger.error(a);
			System.out.println(a);
			
		}
	}
}
