package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.AccountService;
import PMS.service.MailSenderSerivce;
import PMS.vo.Account;
import PMS.vo.AccountProfile;
import PMS.vo.AccountSch;

@Controller
public class AccountController {
	@Autowired(required=false)
	private AccountService service;
	@Autowired(required=false)
	private MailSenderSerivce service2;
	
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
		if(service.isMember(sch)) {
			if(service.loginCheck(sch).equals("pass")) {
				session.setAttribute("userno", sch.getUserno());
				session.setAttribute("auth", service.getUserDetail(sch.getUserno()).getAuth());
				session.setAttribute("name", service.getUserDetail(sch.getUserno()).getName());
				session.setAttribute("dept", service.getUserDetail(sch.getUserno()).getDept());
				if(service.getProfilePath(sch.getUserno()) != null) {
					session.setAttribute("pfImg", service.getProfilePath(sch.getUserno()).getFname());
				}
				d.addAttribute("passVal", "P");
			}else {
				d.addAttribute("passVal", "B");
			}
		}else {
			d.addAttribute("passVal","N");
		}
		return "loginPage.do";
	}
	
	// 비밀번호 찾기
	@RequestMapping("rePw.do")
	public String rePw(Account sch, Model d) {
		if(service.isMember(sch)) {
			service2.sendMailPw(sch);
			d.addAttribute("proc", "Y");
		}else {
			d.addAttribute("proc", "N");
		}
		return "WEB-INF\\views\\f-pw.jsp";
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "WEB-INF\\views\\login.jsp";
	}
	
	// 샘플페이지#########################
	// http://localhost:7080/PMS/samplePage.do
	@RequestMapping("samplePage.do")
	public String samplePage() {
		return "WEB-INF\\views\\sample.jsp";
	}
	
	// 마이페이지 호출
	// http://localhost:7080/PMS/goMyPage.do
	@RequestMapping("goMyPage.do")
	public String goMyPage(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		String userno = (String)session.getAttribute("userno");
		d.addAttribute("userInfo", service.getUserDetail(userno));
		d.addAttribute("userSList", service.getMySList(userno));
		d.addAttribute("profile",service.getProfilePath(userno));
		return "WEB-INF\\views\\mypage.jsp";
	}
	
	//비밀번호 변경
	@RequestMapping("changePw.do")
	public String changePw(Account upt, Model d) {
		service.uptPw(upt);
		d.addAttribute("proc", "pwC");
		return "WEB-INF\\views\\mypage.jsp";
	}
	
	// 마이페이지에서 개인정보 수정
	@RequestMapping("changeInfoMypage.do")
	public String changeInfoMypage(Account upt, Model d) {
		service.uptUserInfo(upt);
		d.addAttribute("proc", "infoC");
		return "WEB-INF\\views\\mypage.jsp";
	}
	
	// 인사 관리 시스템 페이지 호출
	@RequestMapping("goUmPage.do")
	public String goUmPage() {
		return "WEB-INF\\views\\um-page.jsp";
	}
	
	// http://localhost:7080/PMS/deptCnt.do
	// 인사관리페이지 차트정보
	@RequestMapping("deptCnt.do")
	public String deptCnt(Model d) {
		d.addAttribute("deptCnt", service.getDeptCount());
		return "pageJsonReport";
	}
	
	// 관리자 페이지(프로젝트) 호출
	@RequestMapping("goAdminPage.do")
	public String goAdminPage() {
		return "WEB-INF\\views\\admin-page.jsp";
	}
	
	// 인사관리페이지에서 신규사원 등록
	// http://localhost:7080/PMS/addAccount.do?name=테스트&email=asdf@naver.com
	@RequestMapping("addAccount.do")
	public String addAccount(Account ins, Model d) {
		service.insAccount(ins);
		service2.sendMailNew(ins);
		d.addAttribute("proc", "userI");
		d.addAttribute("newUser",service.recentAccount());
		return "pageJsonReport";
	}
	
	// 인사관리페이지에서 인원목록 출력
	// http://localhost:7080/PMS/accountList.do?curPage=0&pageSize=5
	@RequestMapping("accountList.do")
	public String accountList(AccountSch ins, Model d) {
		d.addAttribute("accList", service.AccountList(ins));
		return "pageJsonReport";
	}
	
	// 인사관리페이지 모달창 ajax
	// http://localhost:7080/PMS/uptModal.do?userno=E10000003
	@RequestMapping("uptModal.do")
	public String uptModal(@RequestParam(value = "userno", defaultValue = "") String userno, Model d) {
		d.addAttribute("uptModalInfo", service.getUserDetail(userno));
		return "pageJsonReport";
	}
	
	// 인사관리페이지에서 유저정보 수정
	@RequestMapping("uptUserInfoUm.do")
	public String uptUserInfoUm(Account upt, Model d) {
		service.uptUserInfoUmPage(upt);
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\um-page.jsp";
	}
	
	// 인사관리페이지에서 사원정보 삭제
	@RequestMapping("delAcc.do")
	public String delAcc(@RequestParam(value = "userno", defaultValue = "") String userno, Model d) {
		service.delAccount(userno);
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\um-page.jsp";
	}
	
	// 마이페이지에서 프로필사진 업로드
	@RequestMapping("uptPfImg.do")
	public String uptPfImg(HttpServletRequest request, AccountProfile ins, Model d) {
		HttpSession session = request.getSession();
		service.insProfileImg(ins);
		session.setAttribute("pfImg", ins.getFname());
		d.addAttribute("proc", "uptImg");
		return "WEB-INF\\views\\mypage.jsp";
	}
	// 마이페이지 프로필사진 삭제
	@RequestMapping("delPfImg.do")
	public String delPfImg(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		String userno = (String)session.getAttribute("userno");
		service.delProfileImg(userno);
		session.removeAttribute("pfImg");
		d.addAttribute("proc", "delImg");
		return "WEB-INF\\views\\mypage.jsp";
	}
}
