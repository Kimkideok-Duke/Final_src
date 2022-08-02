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
    
    // http://localhost:8080/PMS/entire.do
    @RequestMapping("entire.do")
    public String entire() {
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
 
    
    // http://localhost:8080/PMS/showMyProject.do
    @RequestMapping("showMyProject.do")
    public String showMyProject(@RequestParam(value="userno", defaultValue="E10000020") String userno, Model d) {
    	d.addAttribute("mylist", service.showMyProject(userno));
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
}
