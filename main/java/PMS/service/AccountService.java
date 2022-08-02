package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AccountDao;
import PMS.vo.Account;

@Service
public class AccountService {
	@Autowired(required=false)
	private AccountDao dao;
	
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
}
