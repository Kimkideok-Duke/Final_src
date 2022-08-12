package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.GanttService;

@Controller
public class GanttController {
	@Autowired(required=false)
	private GanttService service;
	
	// http://localhost:7080/PMS/goGnatt.do
	@RequestMapping("goGnatt.do")
	public String goGnatt() {
		return "WEB-INF/views/gantt_googleTest.jsp";
	}
}
