package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.CalendarDao;
import PMS.vo.Calendar;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDao dao;
	
	public List<Calendar> getCalList(){
		return dao.getCalList();
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
	
}
