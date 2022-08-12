package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.GanttService;
import PMS.vo.Gantt;

@Controller
public class GanttController {
	@Autowired(required=false)
	private GanttService service;
	
	// http://localhost:7080/PMS/goGnatt.do
	@RequestMapping("goGnatt.do")
	public String goGnatt() {
		return "WEB-INF/views/gantt_googleTest.jsp";
	}
	// http://localhost:7080/PMS/getGantt.do
	@RequestMapping("getGantt.do")
	public String getGantt(@RequestParam("pno")int pno, Model d) {
		d.addAttribute("gantt",service.getGantt(pno));
		return "WEB-INF\\views\\gantt.jsp";
	}
	// http://localhost:7080/PMS/ajaxGantt.do
	@RequestMapping("ajaxGantt.do")
	public String ajaxGantt(@RequestParam("pno")int pno, Model d) {
		d.addAttribute("gantt",service.getGantt(pno));
		return "pageJsonReport";
	}
	// http://localhost:7080/PMS/detailGantt.do
	@RequestMapping("detailGantt.do")
	public String detailGantt(int sno) {
		service.detailGantt(sno);
		return "pageJsonReport";
	}
	@RequestMapping("insertGantt.do")
	public String insertGantt(Gantt ins) {
		service.insertGantt(ins);
		return "redirect:/getGantt.do";
	}
	@RequestMapping("updateGantt.do")
	public String updateGantt(Gantt upt) {
		service.updateGantt(upt);
		return "redirect:/getGantt.do";
	}
	@RequestMapping("deleteGantt.do")
	public String deleteGantt(int sno) {
		service.deleteGantt(sno);
		return "redirect:/getGantt.do";
	}
	
}
