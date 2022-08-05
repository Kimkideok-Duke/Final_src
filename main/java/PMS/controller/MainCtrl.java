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
    
    // http://localhost:6080/PMS/main.do
    @RequestMapping("goMain.do")
    public String main(@RequestParam("pno") int pno, Model d) {
    	String title = service.getTitleByNo(pno);
    	d.addAttribute("title", title);
    	return "WEB-INF\\views\\Main.jsp";
    }
    
    @RequestMapping("goSchedule")
    public String goSchedule(@RequestParam("itemno") int itemno, Model d) {
    	
    	return "WEB-INF\\views\\Schedule.jsp";
    }
    
    @RequestMapping("uptSchedule.do")
	public String uptSchedule(Schedule upt, Model d) {
		service.uptSchedule(upt);
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\Schedule.jsp";
	}
    
	
}
