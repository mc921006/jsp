package shop;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Gmail_Mail {
  
  public static void send(String title, String content, String toEmail) {
    
    Properties p = new Properties();
    p.put("mail.smtp.user", "sc921006@naver.com"); //본인 지메일
    p.put("mail.smtp.host", "smtp.naver.com");
    p.put("mail.smtp.port", "465");
    p.put("mail.smtp.starttls.enable", "true");
    p.put("mail.smtp.auth", "true");

    p.put("mail.smtp.debug", "true");
    p.put("mail.smtp.socketFactory.port", "465");
    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    p.put("mail.smtp.socketFactory.fallback", "false");

    try {
      Authenticator auth = new SMTPAuthenticator();
      Session session = Session.getInstance(p, auth);
      session.setDebug(true); 

      MimeMessage msg = new MimeMessage(session);
      String message = content;
      msg.setSubject(title);
      
      Address fromAddr = new InternetAddress("sc921006@naver.com"); 
      msg.setFrom(fromAddr);
      
      Address toAddr = new InternetAddress(toEmail); 
      msg.addRecipient(Message.RecipientType.TO, toAddr);
      msg.setContent(message, "text/plain;charset=KSC5601");
      
      Transport.send(msg);
      
    } catch (Exception e) { 
      e.printStackTrace();
    }
  }

  private static class SMTPAuthenticator extends Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
      //지메일 아이디 , 비밀번호
      return new PasswordAuthentication("sc921006@naver.com", "mc93281");
    }
  }
  
  public static void main(String[] args) {
    send("test","test 내용","sc921006@naver.com");
  }
}