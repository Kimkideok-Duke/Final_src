package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AccountDao;
import PMS.vo.Account;
import PMS.vo.MypageScheduleList;

@Service
public class AccountService {
	@Autowired(required=false)
	private AccountDao dao;
	// 사원번호, 비밀번호 입력받고 존재하는 사원번호인지 체크
	public boolean isMember(Account sch) {
		if(dao.isMember(sch).equals("1")) {
			return true;
		}else {
			return false;
		}
	}
	// 사원번호, 비밀번호 입력받고 일치하는지 체크
	public String loginCheck(Account sch) {
		String result = "";
		if(dao.loginCheck(sch).equals("1")) {
			result = "pass";
		}else {
			result = "block";
		}
		return result;
	}
	// 사원번호 입력받고 사원정보 리턴
	public Account getUserDetail(String userno) {
		return dao.getUserDetail(userno);
	}
	// 비밀번호 변경
	public void uptPw(Account upt) {
		dao.uptPw(upt);
	}
	// 마이페이지에서 개인정보 수정
	public void uptUserInfo(Account upt) {
		dao.uptUserInfo(upt);
	}
	// 마이페이지 내 일정목록 조회
	public List<MypageScheduleList> getMySList(String userno) {
		return dao.getMySList(userno);
	}
}
