package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.AccountService;

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
}
