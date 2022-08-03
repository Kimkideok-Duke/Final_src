package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.MainService;

@Controller
public class MainCtrl {
    @Autowired(required=false)
    private MainService service;
    
    // http://localhost:7080/PMS/main.do
    @RequestMapping("main.do")
    public String main() {
    	return "WEB-INF\\views\\Main.jsp";
    }
    
}
