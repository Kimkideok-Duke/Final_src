package PMS.dao;
import java.util.List;

// PMS.dao.GanttDao
import org.springframework.stereotype.Repository;

import PMS.vo.Gantt;
import PMS.vo.Schedule;
import PMS.vo.GanttData;

@Repository
public interface GanttDao {
	// 간트차트에서 일정조회
	public List<Gantt> getGantt(int pno);
	// 간트차트에서 상세일정 조회
	public List<Gantt> detailGantt(int son);
	// 간트차트에서 일정 추가
	public void insertGantt(Gantt ins);
	// 간트차트에서 일정 수정
	public void updateGantt(Gantt upt);
	// 간트차트에서 일정 삭제
	public void deleteGantt(int sno);
	// 간트차트에 들어갈 일정 데이터 추출
	public List<GanttData> getGanttData(int pno);
}