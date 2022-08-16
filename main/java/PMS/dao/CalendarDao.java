package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Calendar;
import PMS.vo.Schedule;

// public List<Calendar> getCalList();
@Repository
public interface CalendarDao {

	public List<Calendar> getCalList();
	public void insertCalendar(Calendar ins);
	public void updateCalendar(Calendar upt);
	public void deleteCalendar(int id);  
	public int getRecentSno();
	// 캘린더 id로 Sno 리턴
	public int getSnoId(int id);
	// 캘린더 id로 schedule 객체 리턴
	public Schedule getScheduleId(int id);
}
