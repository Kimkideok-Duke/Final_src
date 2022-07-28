package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.TestDao;

@Service
public class TestService {
	@Autowired(required=false)
	private TestDao dao;
}
