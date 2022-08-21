package PMS.dao;
import java.util.List;

// PMS.dao.MainDao
import org.springframework.stereotype.Repository;

import PMS.vo.Account;
import PMS.vo.PrjParticipant;
import PMS.vo.SchPartiInfo;
import PMS.vo.SchParticipant;
import PMS.vo.Schedule;
import PMS.vo.ScheduleStatusCnt;

@Repository
public interface MainDao {
	public String getTitleByNo(int pno);
	public List<Schedule> getScheduleList(int pno);
	public void regSchedule(Schedule reg);
	public void uptSchedule(Schedule upt);
	public void uptScheduleByPM(Schedule upt);
	public void delSchedule(int sno);	
	public Schedule getSchedule(int sno);
	public List<Account> getPrjparticipant(int pno);
	// 프로젝트 진행도
	public int getProgress(int pno);
	// 일정 참가자 추가
	public void insSchParticipant(SchParticipant ins);
	// 일정 참가자 조회
	public List<SchPartiInfo> showSchPartiInfo(int sno);
	// 일정 진행상태 수 조회
	public List<ScheduleStatusCnt> getStatusCnt(int pno);
	// 프로젝트 참가자 조회
	public List<Account> getPrjPartiList(int pno);
	// 일정 참가자 삭제
	public void delSchParticipant(SchParticipant del);
	// 일정 참가자 삭제
	public void delSchPrjParticipant(PrjParticipant del);
	// 프로젝트 참가자 삭제
	public void delPrjParticipant(PrjParticipant del);
}
