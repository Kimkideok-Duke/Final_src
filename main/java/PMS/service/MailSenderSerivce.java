package PMS.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import PMS.dao.AccountDao;
import PMS.vo.Account;

@Service
public class MailSenderSerivce {
	// 컨테이너에 있는 메일 발송 객체 autowiring 처리
	@Autowired(required = false)
	private JavaMailSender sender;
	@Autowired(required = false)
	private AccountDao dao;
	// 인사관리페이지에서 신규유저 등록 메일전송
	public String sendMailNew(Account ins) {
		String msg = "Y"; //메일 발송이 성공되었을 때,
		// 처리할 메서드 선언
		// 1. 멀티미디어형 메일 데이터 전송
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 제목 설정
		try {
			mmsg.setSubject("Welcome Fine PMS !");
			// 3. 수신자 설정
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(ins.getEmail()));
			// 4. 내용 설정
			mmsg.setText("Fine PMS에 신규가입 되었습니다.\n사원번호&임시비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해주세요!\n"+ins.getName()+"님의 사원번호 : "+dao.recentAccount().getUserno()+"\t 비밀번호 : "+dao.recentAccount().getPw());
			// 5. 발송 처리
			sender.send(mmsg);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			msg = "MailException";
			System.out.println(e.getMessage());
		} catch(Exception e) {
			msg = "Exception";
			System.out.println(e.getMessage());
		}
		
		return msg;
	}
	// 비밀번호찾기 페이지에서 임시비밀번호 메일 전송
	public String sendMailPw(Account ins) {
		String tempPw = "";
		for(int i=1;i<=8;i++) {
			int pwPath = (int)(Math.random()*3);
			int pwCode = (pwPath == 0)?(int)(Math.random()*10+48):(pwPath == 1)?(int)(Math.random()*26+65):(int)(Math.random()*26+97);
			tempPw+=(char)pwCode;
		}
		
		ins.setPw(tempPw);
		ins.setEmail(dao.getUserDetail(ins.getUserno()).getEmail());
		ins.setName(dao.getUserDetail(ins.getUserno()).getName());
		dao.uptPw(ins);
		
		String msg = "Y";
		MimeMessage mmsg = sender.createMimeMessage();
		try {
			mmsg.setSubject("Fine PMS : 비밀번호 찾기");
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(ins.getEmail()));
			mmsg.setText("Fine PMS 비밀번호 찾기 입니다.\n임시비밀번호로 로그인 후 마이페이지에서 비밀번호를 변경해주세요!\n"+ins.getName()+"님의 임시비밀번호 : "+tempPw);
			
			sender.send(mmsg);
			
		} catch (MessagingException e) {
			msg = "MailException";
			System.out.println(e.getMessage());
		} catch(Exception e) {
			msg = "Exception";
			System.out.println(e.getMessage());
		}
		return msg;
	}
}
