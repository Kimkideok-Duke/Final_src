package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AccountDao;
import PMS.vo.Account;
import PMS.vo.AccountSch;
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
	// 인사관리페이지 신규사원 등록
	public void insAccount(Account ins) {
		String tempPw = "";
		for(int i=1;i<=8;i++) {
			int pwPath = (int)(Math.random()*3);
			int pwCode = (pwPath == 0)?(int)(Math.random()*10+48):(pwPath == 1)?(int)(Math.random()*26+65):(int)(Math.random()*26+97);
			tempPw+=(char)pwCode;
		}
		ins.setPw(tempPw);
		dao.insAccount(ins);
	}
	public Account recentAccount() {
		return dao.recentAccount();
	}
	// 인사관리페이지 사원목록 조회 + 페이징처리
	public List<Account> AccountList(AccountSch sch){
		// 페이징처리 코드 추가
		// 1. 전체 데이터 건수 생성
				sch.setCount(dao.totCnt(sch));
				System.out.println("총건수 : "+sch.getCount());
				// 2. 선언한 한번에 보여줄 데이터건수(요청값)
				// 		초기화면을 대비하여 한번에 보여줄 데이터 건수를 선언
				// 객체로 매개변수를 받을 때 숫자형 요청값에 값이 없을때는 null이 아니라 0이 입력된다.
				// 요청값이 없을 때 0이므로 초기값을 설정해주어야 한다.
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				} // 초기 페이지 수를 5로 설정
				
				// 3. 총 페이지수 : 총 데이터 건수/한번에 보여줄 페이지 크기
				//	ex) 18/5 ==> 3..
				//  ex) 18/5.0 ==> Math.ceil(3.6) : 4.0 ==> 정수형으로 변환하여 4를 총 페이지수로 처리
				sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
				
				// 4. 클릭한 현재 페이지 번호 (요청값)
				// 		1 => 1~5
				// 		2 => 6~10
				// 		3 => 11~15
				//	초기에 화면은 0으로 처리되기에 default값을 1로 처리한다.
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 블록단위로 next를 눌렀을 때, cupage가 페이지 수 이상으로 증가되는 것을 방지
				if(sch.getCurPage() > sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}
				
				// 5. 마지막번호(현재페이지*한번에보여줄페이지건수)
				int end = sch.getCurPage()*sch.getPageSize();
				if(end>=sch.getCount()) { // 마지막번호가 총 데이터 건수보다 크면
					sch.setEnd(sch.getCount());
				}else {
					sch.setEnd(end);
				}
				// 끝 번호가 18인데 4페이지에서 20까지 출력하라는 명령이 들어가도
				// db에서는 상관 없지만(18까지 나온다) 정확하게 하기 위해 조건문 작성
				
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 1			(1-1)*5+1	=> 1
				// 2			(2-1)*5+1	=> 6
				// 3			(3-1)*5+1	=> 11 
				
				// 하단에 <이전	이후> 블록 처리
				// 1. 블록의 크기 지정
				sch.setBlockSize(5);
				// 2. 블록의 번호 지정
				//	 1번블럭	[1]...[5]
				//	 2번블럭	[6]...[10]
				//	 3번블럭	[11]...[15]
				int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
				
				// 만약 페이지블록이 13개까지만 있다면 블록은 15까지 처리되어 에러가 발생한다.
				// DB에서 가져오는 데이터가 아니기 때문에 에러가 발생하므로
				// 조건문으로 처리
				
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>=sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				
				System.out.println(dao.totCnt(sch));
				System.out.println(sch.getPageSize());
		return dao.AccountList(sch);
	}
	
}
