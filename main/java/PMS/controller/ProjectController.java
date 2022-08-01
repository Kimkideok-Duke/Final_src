package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
