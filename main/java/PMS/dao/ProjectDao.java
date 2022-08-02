package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Project;
import PMS.vo.mySchedule;

@Repository
public interface ProjectDao {
	// 전체 프로젝트 표시
	public List<Project> showAllProject();
	
	// 내가 소속된 프로젝트 표시
	public List<mySchedule> showMyProject(String userno);
}
