package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.GanttDao;

@Service
public class GanttService {
	@Autowired(required=false)
	private GanttDao dao;
}
