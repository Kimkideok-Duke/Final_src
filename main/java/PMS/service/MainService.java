package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.MainDao;
import PMS.vo.Schedule;

@Service
public class MainService {
	@Autowired(required=false)
	private MainDao dao;
	
	public String getTitleByNo(int pno) {
		return dao.getTitleByNo(pno);
	}

	public void uptSchedule(Schedule upt) {
		dao.uptSchedule(upt);
	}

}
