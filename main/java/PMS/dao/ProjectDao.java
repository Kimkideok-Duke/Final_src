package PMS.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import PMS.vo.PrjParticipant;
import PMS.vo.Project;
import PMS.vo.Schedule;
import PMS.vo.mySchedule;

@Repository
public interface ProjectDao {
	// 전체 프로젝트 표시
	public List<Project> showAllProject(Map map);
	
	// 내 프로젝트 보기
	public List<Project> showMyProject(String userno);
	
	// 프로젝트 추가
	public void addProject(Project ins);
	
	// 방금 생성된 프로젝트 번호 추출
	public int getMaxPno(String pmno);
	
	// 프로젝트 참가자 추가
	public void addPrjParticipant(PrjParticipant ins);
	
	// 내 업무 보기
	public List<mySchedule> showMySchedule(String userno);
	
	// 프로젝트별 일정표시
	public List<Schedule> showSchedule(int pno);
}
