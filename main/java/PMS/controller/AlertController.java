package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.AlertService;

@Controller
public class AlertController {
	@Autowired(required=false)
	private AlertService service;
	// http://localhost:7080/PMS/goAlert.do
	@RequestMapping("goAlert.do")
	public String goAlert(@RequestParam(value="userno")String userno, Model d) {
		d.addAttribute(userno);
		return "WEB-INF\\views\\alert.jsp";
	}
}
