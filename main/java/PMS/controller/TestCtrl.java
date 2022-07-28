package PMS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.TestService;

@Controller
public class TestCtrl {
    @Autowired(required=false)
    private TestService service;
    
    // http://localhost:7080/team5/main.do
    @RequestMapping("main.do")
    public String main() {
    	return "WEB-INF\\views\\index.jsp";
    }
    
}
