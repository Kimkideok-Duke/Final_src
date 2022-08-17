package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AlertDao;
import PMS.vo.Alert;

@Service
public class AlertService {
	@Autowired(required=false)
	private AlertDao dao;
	// 알림 표시
	public List<Alert> getAlert(String userno){
		return dao.getAlert(userno);
	}
	public List<Alert> getAlertjson(String userno){
		return dao.getAlertjson(userno);
	}

}
