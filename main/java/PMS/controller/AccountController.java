package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.AccountService;
import PMS.vo.Account;

@Controller
public class AccountController {
	@Autowired(required=false)
	private AccountService service;
	
	// 로그인 페이지 호출
	// http://localhost:7080/PMS/loginPage.do
	@RequestMapping("loginPage.do")
	public String loginPage() {
		return "WEB-INF\\views\\login.jsp";
	}
	
	// 비밀번호 찾기 페이지 호출
	// http://localhost:7080/PMS/pwPage.do
	@RequestMapping("pwPage.do")
	public String pwPage() {
		return "WEB-INF\\views\\f-pw.jsp";
	}
	
	// 로그인 체크
	@RequestMapping("loginCheck.do")
	public String loginCheck(HttpServletRequest request,Account sch, Model d) {
		HttpSession session = request.getSession();
		if(service.loginCheck(sch).equals("pass")) {
			session.setAttribute("userno", sch.getUserno());
			session.setAttribute("auth", service.getUserDetail(sch.getUserno()).getAuth());
			d.addAttribute("passVal", "P");
		}else {
			d.addAttribute("passVal", "B");
		}
		return "loginPage.do";
	}
}
