package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.AlertService;

@Controller
public class AlertController {
	@Autowired(required=false)
	private AlertService service;
	// http://localhost:7080/PMS/goAlert.do
	@RequestMapping("goAlert.do")
	public String goAlert() {
		return "WEB-INF\\views\\alert.jsp";
	}
}
