package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.MainDao;
import PMS.vo.Account;
import PMS.vo.Schedule;

@Service
public class MainService {
	@Autowired(required=false)
	private MainDao dao;
	
	public String getTitleByNo(int pno) {
		return dao.getTitleByNo(pno);
	}
	public List<Schedule> getScheduleList(int pno) {
		return dao.getScheduleList(pno);
	}
	public Schedule getSchedule(int sno) {
		return dao.getSchedule(sno);
	}
	public void regSchedule(Schedule reg) {
		dao.regSchedule(reg);
	}
	public void uptSchedule(Schedule upt) {
		dao.uptSchedule(upt);
	}
	public void delSchedule(int sno) {
		dao.delSchedule(sno);
	}
	public void uptScheduleByPM(Schedule upt) {
		dao.uptScheduleByPM(upt);
	}
	public List<Account> getPrjparticipant(int pno){
		return dao.getPrjparticipant(pno);
	}
	// 프로젝트 진행도
	public int getProgress(int pno) {
		return dao.getProgress(pno);
	}
}
