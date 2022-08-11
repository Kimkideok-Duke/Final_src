package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.DeptBudget;
import PMS.vo.PrjParticipant;
import PMS.vo.Project;
import PMS.vo.ProjectScheduleJoin;
import PMS.vo.Schedule;
import PMS.vo.getDeptCnt;
import PMS.vo.myProject;
import PMS.vo.mySchedule;

@Repository
public interface ProjectDao {
	// 전체 프로젝트 표시
	public List<Project> showAllProject();
	
	// 전체 일정 표시
	public List<mySchedule> showAllSchedule();
	
	// 내 프로젝트 보기
	public List<myProject> showMyProject(String userno);
	
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
	
	// 관리하는 모든 일정리스트(pm)
	public List<ProjectScheduleJoin> managingSchedule(String pmno);
	
	// 부서별 예산
	public List<DeptBudget> getDeptBudget();
	
	// 부서별 프로젝트 갯수
	public List<getDeptCnt> getDeptCnt();
	
}
