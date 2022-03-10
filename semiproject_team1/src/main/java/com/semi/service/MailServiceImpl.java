package com.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.semi.api.smtp.MailHandler;
import com.semi.dao.MemberDAO;
import com.semi.dto.Mail;
import com.semi.dto.Member;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	MemberDAO memberDAO; 
	
	@Override
	public void joinMailSend(Member mem) {
		Mail mail=new Mail();
		mail.setTitle(mem.getMem_nickname()+"님, lolpan.dog 회원가입 인증번호를 확인하시기 바랍니다.");
		mail.setAddress(mem.getMem_email_id());
		try {
			MailHandler mailHandler=new MailHandler(javaMailSender);
			mailHandler.setTo(mem.getMem_email_id());
			mailHandler.setFrom("lolpan.dog@gmail.com");
			mailHandler.setSubject(mail.getTitle());
			String htmlContent = "<div style='width: 80%; height: 80vh; background: url(http://localhost:8090/join/joinCode.jpg); background-size: cover;'>"
					+"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"
					+"<h1 style='font-size:3em; text-align:center; color:white;'>"+mem.getMem_code()+"</h1>"+"</div>";
//			String htmlContent = "<img src='http://localhost:8090/video_view/wo2.jpg'>";
			mailHandler.setText(htmlContent, true);
//			mailHandler.setInline("welcome-img", "static/asset/image/login/wo.jpg");
			mailHandler.send();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
