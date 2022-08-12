package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.MainDao;
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
		
	}
	public void uptSchedule(Schedule upt) {
		dao.uptSchedule(upt);
	}
	public void delSchedule() {

	}

}
