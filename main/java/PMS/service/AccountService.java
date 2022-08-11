package PMS.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import PMS.dao.AccountDao;
import PMS.vo.Account;
import PMS.vo.AccountDeptCount;
import PMS.vo.AccountProfile;
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
		// 2. 선언한 한번에 보여줄 데이터건수(요청값)
		// 		초기화면을 대비하여 한번에 보여줄 데이터 건수를 선언
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		} // 초기 페이지 수를 5로 설정
		
		// 3. 총 페이지수 : 총 데이터 건수/한번에 보여줄 페이지 크기
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		
		// 4. 클릭한 현재 페이지 번호 (요청값)
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
		// 하단에 블록 처리
		// 1. 블록의 크기 지정
		sch.setBlockSize(5);
		// 2. 블록의 번호 지정
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
		return dao.AccountList(sch);
	}
	
	// 인사관리페이지에서 유저정보 수정
	public void uptUserInfoUmPage(Account upt) {
		dao.uptUserInfoUmPage(upt);
	}
	
	// 인사관리페이지 차트 (부서별 인원수)
	public List<AccountDeptCount> getDeptCount(){
		return dao.getDeptCount();
	}
	
	// 마이페이지 프로필이미지 경로조회
	public AccountProfile getProfilePath(String userno) {
		return dao.getProfilePath(userno);
	}
	
	// 인사관리페이지에서 사원정보 삭제
	public void delAccount(String userno) {
		dao.delAccount(userno);
	}
	@Value("${uploadpf}")
	private String path;
	// 마이페이지 프로필사진 업로드
	public void insProfileImg(AccountProfile ins) {
		MultipartFile mpf = ins.getReport();
		String fname = mpf.getOriginalFilename();
		
		File f = new File(path+fname);
		try {
			mpf.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dao.checkProfileImg(ins.getUserno()).equals("1")) {
			dao.delProfileImg(ins.getUserno());
		}
		dao.insProfileImg(new AccountProfile(ins.getUserno(),path,fname));
	}
	// 마이페이지 프로필사진 삭제
	public void delProfileImg(String userno) {
		dao.delProfileImg(userno);
	}
}
