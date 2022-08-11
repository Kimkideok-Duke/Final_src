package PMS.dao;
import java.util.List;

// PMS.dao.MainDao
import org.springframework.stereotype.Repository;

import PMS.vo.Schedule;

@Repository
public interface MainDao {
	public String getTitleByNo(int pno);
	public List<Schedule> getScheduleList(int pno);
	public void regSchedule(Schedule reg);
	public void uptSchedule(Schedule upt);
	public void delSchedule();	
	public Schedule getSchedule(int sno);
	
}
