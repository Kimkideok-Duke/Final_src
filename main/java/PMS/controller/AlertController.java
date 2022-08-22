package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	// http://localhost:7080/PMS/getAlertnavi.do?userno=E10000020
	@RequestMapping("getAlertnavi.do")
	public String getAlertnavi(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		String userno = "";
		if(session!=null && session.getAttribute("userno")!=null) {
			userno = (String)session.getAttribute("userno");
		}
		d.addAttribute("art",service.getAlertnavi(userno));
		return "pageJsonReport";
	}

	
}
