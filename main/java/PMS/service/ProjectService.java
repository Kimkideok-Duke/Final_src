package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.ProjectDao;

@Service
public class ProjectService {
	@Autowired(required=false)
	private ProjectDao dao;
}
