package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.ProjectDao;
import PMS.vo.mySchedule;

@Service
public class ProjectService {
	@Autowired(required=false)
	private ProjectDao dao;
	
	// 내가 소속된 프로젝트 표시
	public List<mySchedule> showMyProject(String userno){
		return dao.showMyProject(userno);
	}
}
