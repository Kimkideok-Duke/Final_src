package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Calendar;

// public List<Calendar> getCalList();
@Repository
public interface CalendarDao {

	public List<Calendar> getCalList();
	public void insertCalendar(Calendar ins);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);  
	public int getRecentSno();
}
