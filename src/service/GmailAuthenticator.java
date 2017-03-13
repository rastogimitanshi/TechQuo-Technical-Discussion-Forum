package service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GmailAuthenticator extends Authenticator  {
	String user;
    String pw;
   
    public GmailAuthenticator(String username, String password)
    {
       super();
       this.user = username;
       this.pw = password;
    }
   
    public PasswordAuthentication getPasswordAuthentication(){
      return new PasswordAuthentication(user, pw);
   }
}
