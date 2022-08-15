package PMS.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.ProjectDao;
import PMS.vo.DeptBudget;
import PMS.vo.PrjParticipant;
import PMS.vo.Project;
import PMS.vo.ProjectBudget;
import PMS.vo.ProjectScheduleJoin;
import PMS.vo.ProjectUserCnt;
import PMS.vo.getDeptCnt;
import PMS.vo.myProject;
import PMS.vo.mySchedule;

@Service
public class ProjectService {
	@Autowired(required=false)
	private ProjectDao dao;
	
	// 전체 프로젝트 표시
	public List<Project> showAllProject(){
		return dao.showAllProject();
	}
	
	// 전체 일정 표시
	public List<mySchedule> showAllSchedule(){
		return dao.showAllSchedule();
	}
	
	// 내 프로젝트 보기
	public List<myProject> showMyProject(String userno){
		return dao.showMyProject(userno);
	}
			
	// 관리하는 모든 일정리스트(pm)
	public List<ProjectScheduleJoin> managingSchedule(String pmno){
		return dao.managingSchedule(pmno);
	}
		
	// 내가 소속된 프로젝트 표시
	public List<mySchedule> showMySchedule(String userno){
		return dao.showMySchedule(userno);
	}
	
	// 내 프로젝트 추가
	public void addProject(Project ins) {
		dao.addProject(ins);
	}
	
	// 프로젝트 참가자 추가
	public void addPrjParticipant(PrjParticipant ins) {
		dao.addPrjParticipant(ins);
	}
	
	// 방금 생성된 프로젝트 번호 추출
	public int getMaxPno(String pmno) {
		return dao.getMaxPno(pmno);
	}
	
	// 부서별 예산
	public List<DeptBudget> getDeptBudget(){
		return dao.getDeptBudget();
	}
	
	// 부서별 프로젝트 갯수
	public List<getDeptCnt> getDeptCnt(){
		return dao.getDeptCnt();
	}
	
	// 프로젝트별 예산
	public List<ProjectBudget> getProjectBudget(String pmno){
		return dao.getProjectBudget(pmno);
	}
	
	// 프로젝트별 참가인원수
	public List<ProjectUserCnt> getProjectUserCnt(String pmno){
		return dao.getProjectUserCnt(pmno);
	}
	
	// 프로젝트 수정
	public void updateProject(Project upt) {
		dao.updateProject(upt);
	}
	
	// 프로젝트 삭제
	public void deleteProject(int pno) {
		dao.deleteSchedule(pno);
		dao.deleteProject(pno);
	}
}
