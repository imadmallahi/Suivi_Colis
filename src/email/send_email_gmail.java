package email;

import java.util.*;
import javax.mail.*;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.*;


public class send_email_gmail {


public send_email_gmail(String email, String sujet,String text) throws Exception {
	super();
	final String username = "suivi.colis.puplo@gmail.com";
	final String password = "mellahi1234";
	
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
	
	Message message = new MimeMessage(session);
	message.setFrom(new InternetAddress("suivi.colis.puplo@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,
	InternetAddress.parse(email));
	message.setSubject(sujet);
	message.setText(text);
	
	Transport.send(message);
	
	System.out.println("Done");
	
	
	}
	public static void main (String args[]){
	try {
	new send_email_gmail("mellahi.imad2017@gmail.com", "yaqout", "<p style='color:red' > hello </p>");
	} catch (Exception e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
	}
	}
	
	

}
