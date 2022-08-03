package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Account;
// PMS.dao.AccountDao
import PMS.vo.MypageScheduleList;
@Repository
public interface AccountDao {
	// 사원번호, 비밀번호 입력받고 존재하는 사원번호인지 체크
	public String isMember(Account sch);
	// 사원번호, 비밀번호 입력받고 일치하는지 체크
	public String loginCheck(Account sch);
	// 사원번호 입력받고 사원정보 리턴
	public Account getUserDetail(String userno);
	// 비밀번호 변경
	public void uptPw(Account upt);
	// 마이페이지에서 개인정보 수정
	public void uptUserInfo(Account upt);
	// 마이페이지 내가 참여한 일정
	public List<MypageScheduleList> getMySList(String userno);
}
