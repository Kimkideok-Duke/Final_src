package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.MainDao;

@Service
public class MainService {
	@Autowired(required=false)
	private MainDao dao;
}
