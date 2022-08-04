package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.ProjectService;

@Controller
public class ProjectController {
	@Autowired(required=false)
    private ProjectService service;
    
    // http://localhost:8080/PMS/entireDashboard.do
    @RequestMapping("entireDashboard.do")
    public String entireDashboard(@RequestParam(value="userno", defaultValue="E10000020") String userno, Model d) {
    	d.addAttribute("myPlist", service.showMyProject(userno));
    	d.addAttribute("mySlist", service.showMySchedule(userno));
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
    
    @RequestMapping("mainDashboard.do")
    public String mainDashboard(@RequestParam(value="pno", defaultValue="2") String pno, Model d) {
    	
    	return "WEB-INF/views/MainDashboard.jsp";
    }
}
