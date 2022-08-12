package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.GanttDao;
import PMS.vo.Gantt;
import PMS.vo.Schedule;

@Service
public class GanttService {
	@Autowired(required=false)
	private GanttDao dao;
	// 간트차트에서 일정조회
	public List<Gantt> getGantt(int pno){
		return dao.getGantt(pno);
	}
	// 간트차트에서 상세일정 조회
	public List<Gantt> detailGantt(int son){
		return dao.detailGantt(son);
	}
	// 간트차트에서 일정 추가
	public void insertGantt(Gantt ins) {
		dao.insertGantt(ins);
	}
	// 간트차트에서 일정 수정
	public void updateGantt(Gantt upt) {
		dao.updateGantt(upt);
	}
	// 간트차트에서 일정 삭제
	public void deleteGantt(int sno) {
		dao.deleteGantt(sno);
	}

}
