package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.CalendarDao;
import PMS.vo.Calendar;
import PMS.vo.Schedule;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDao dao;
	
	public List<Calendar> getCalList(int pno){
		return dao.getCalList(pno);
	}
	public void insertCalendar(Calendar ins) {
		dao.insertCalendar(ins);
	}
	public void updateCalendar(Calendar upt) {
		dao.updateCalendar(upt);
	}
	public void deleteCalendar(int id) {
		dao.deleteCalendar(id);
	}
	public int getRecentSno() {
      return dao.getRecentSno();
    }
	public int getSnoId(int id) {
		return dao.getSnoId(id);
	}
	public Schedule getScheduleId(int id) {
		return dao.getScheduleId(id);
	}
	public void updateCalendar2(Calendar uptCal) {
		dao.updateCalendar2(uptCal);
	}
	public int getIdBySno(int sno) {
		return dao.getIdBySno(sno);
	}
	
}
