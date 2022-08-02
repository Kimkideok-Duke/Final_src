package PMS.dao;

import org.springframework.stereotype.Repository;

import PMS.vo.Account;
// PMS.dao.AccountDao
@Repository
public interface AccountDao {
	// 사원번호, 비밀번호 입력받고 존재하는 사원번호인지 체크
	public String isMember(Account sch);
	// 사원번호, 비밀번호 입력받고 일치하는지 체크
	public String loginCheck(Account sch);
	// 사원번호 입력받고 사원정보 리턴
	public Account getUserDetail(String userno);
}
