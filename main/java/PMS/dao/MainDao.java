package PMS.dao;
import java.util.List;

// PMS.dao.MainDao
import org.springframework.stereotype.Repository;

import PMS.vo.Account;
import PMS.vo.SchPartiInfo;
import PMS.vo.SchParticipant;
import PMS.vo.Schedule;

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
}
