package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.ProjectService;

@Controller
public class ProjectController {
	@Autowired(required=false)
    private ProjectService service;
    
    // http://localhost:8080/PMS/entireDashboard.do
    @RequestMapping("entireDashboard.do")
    public String entireDashboard(HttpServletRequest request, Model d) {
    	HttpSession session = request.getSession();
    	String userno = (String)session.getAttribute("userno");
    	d.addAttribute("myPlist", service.showMyProject(userno));
    	d.addAttribute("mySlist", service.showMySchedule(userno));
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
}
