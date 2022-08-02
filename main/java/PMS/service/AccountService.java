package PMS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.AccountDao;

@Service
public class AccountService {
	@Autowired(required=false)
	private AccountDao dao;
	
}
