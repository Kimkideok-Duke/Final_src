package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Account;
import PMS.vo.AccountDeptCount;
import PMS.vo.AccountProfile;
import PMS.vo.AccountSch;
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
	// 인사관리페이지 신규사원등록
	public void insAccount(Account ins);
	// 가장 최근에 등록한 사원정보 리턴(임시..)
	public Account recentAccount();
	// 인사관리페이지 사원목록 조회 + 페이징처리
	public List<Account> AccountList(AccountSch sch);
	// 전체 사원목록 개수
	public int totCnt(AccountSch sch);
	// 인사관리페이지 사원정보수정
	public void uptUserInfoUmPage(Account upt);
	// 인사관리페이지 차트 (부서별 인원수)
	public List<AccountDeptCount> getDeptCount(); 
	// 마이페이지 프로필사진 경로조회
	public AccountProfile getProfilePath(String userno);
	// 인사관리페이지 사원 삭제
	public void delAccount(String userno);
	// 마이페이지 프로필사진 업로드
	public void insProfileImg(AccountProfile ins);
	// 마이페이지 프로필사진 삭제
	public void delProfileImg(String userno);
	// 현재 프로필사진 등록되어있는지 확인
	public String checkProfileImg(String userno);
	// 사원리스트
	public List<Account> getAccountList();
}
