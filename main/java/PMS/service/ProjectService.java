package PMS.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.ProjectDao;
import PMS.vo.Project;
import PMS.vo.mySchedule;

@Service
public class ProjectService {
	@Autowired(required=false)
	private ProjectDao dao;
	
	// 전체 프로젝트 표시
	public List<Project> showAllProject(Map map){
		return dao.showAllProject(map);
	}
	
	// 내 프로젝트 보기
	public List<Project> showMyProject(String userno){
		return dao.showMyProject(userno);
	}
			
	// 내가 소속된 프로젝트 표시
	public List<mySchedule> showMySchedule(String userno){
		return dao.showMySchedule(userno);
	}
}
