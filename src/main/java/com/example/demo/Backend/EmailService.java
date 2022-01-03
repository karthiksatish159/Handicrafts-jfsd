package com.example.demo.Backend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.example.demo.Model.ordersdp;

import org.springframework.mail.javamail.MimeMessageHelper;

import freemarker.template.Configuration;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Random;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import java.nio.charset.StandardCharsets;


@Service
public class EmailService 
{
	  @Autowired
	    JavaMailSender mailSender;
	  @Autowired
	  private Configuration config;
	  public void sendSimpleEmail(String toEmail,
              String body,
              String subject) 
	  {
SimpleMailMessage message = new SimpleMailMessage();

message.setFrom("sdp3handicrafts@gmail.com");
message.setTo(toEmail);
message.setText(body);
message.setSubject(subject);

mailSender.send(message);
System.out.println("Mail Send...");
}
	    public static String generateOTP(int length) {
	        String numbers = "1234567890";
	        Random random = new Random();
	        char[] otp = new char[length];

	        for(int i = 0; i< length ; i++) {
	           otp[i] = numbers.charAt(random.nextInt(numbers.length()));
	        }
	        String v=new String(otp);
	        return v;
	     }



public void sendEmail(String toEmail,
        String subject, Map<String, Object> model123) 
{

	MimeMessage message = mailSender.createMimeMessage();
	try {
		// set mediaType
		MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
				StandardCharsets.UTF_8.name());
		// add attachment
		//helper.addAttachment("logo.png", new ClassPathResource("logo.png"));

		Template t = config.getTemplate("email-template.ftl");
		String html = FreeMarkerTemplateUtils.processTemplateIntoString(t, model123);

		helper.setTo(toEmail);
		helper.setText(html, true);
		helper.setSubject(subject);
		helper.setFrom("sdp3handicrafts@gmail.com");
		mailSender.send(message);

		//response.setMessage("mail send to : " + request.getTo());
		//response.setStatus(Boolean.TRUE);

	} 
	catch (MessagingException| IOException|  TemplateException e) 
	{
	
	}
}
}
	

