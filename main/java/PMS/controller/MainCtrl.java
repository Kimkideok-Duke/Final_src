package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.MainService;
import PMS.vo.Schedule;

@Controller
public class MainCtrl {
    @Autowired(required=false)
    private MainService service;
    
    // http://localhost:6080/PMS/goMain.do
    @RequestMapping("goMain.do")
    public String main(@RequestParam(value="pno", defaultValue="2") int pno, Model d) {
    	d.addAttribute("title", service.getTitleByNo(pno));
    	d.addAttribute("slist",service.getScheduleList(pno));
    	return "WEB-INF\\views\\Main.jsp";
    }
    
    // http://localhost:6080/PMS/goSchedule.do
    @RequestMapping("goSchedule.do")
    public String goSchedule(@RequestParam(value="pno", defaultValue="2") int pno, Model d) {
    	d.addAttribute("slist",service.getScheduleList(pno));
    	return "WEB-INF\\views\\Schedule.jsp";
    }

    @RequestMapping("uptSchedule.do")
	public String uptSchedule(Schedule upt, Model d) {
		service.uptSchedule(upt);
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\Schedule.jsp";
	}
    
//	public String uptModal(@RequestParam(value = "userno", defaultValue = "") String userno, Model d) {
//		d.addAttribute("uptModalInfo", service.getUserDetail(userno));
//		return "pageJsonReport";
//	}
    
	
}
