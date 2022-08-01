package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AlertDao;

@Service
public class AlertService {
	@Autowired(required=false)
	private AlertDao dao;
}
