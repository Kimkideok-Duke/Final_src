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
	// http://localhost:7080/PMS/getAlert.do
	@RequestMapping("getAlert.do")
	public String getAlert(@RequestParam(value="userno", defaultValue="")String userno, Model d) {
		d.addAttribute("art",service.getAlert(userno));
		return "WEB-INF\\views\\alert.jsp";
	}
	@RequestMapping("getAlertjson.do")
	public String getAlertjson(@RequestParam(value="userno", defaultValue="") String userno, Model d) {
		d.addAttribute("art",service.getAlertjson(userno));
		return "pageJsonReport";
	}

	
}
