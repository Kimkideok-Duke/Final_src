package PMS.dao;
// PMS.dao.MainDao
import org.springframework.stereotype.Repository;

import PMS.vo.Schedule;

@Repository
public interface MainDao {
	public String getTitleByNo(int pno);

	public void uptSchedule(Schedule upt);
}
