package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    public String main(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	//int pno = (int)session.getAttribute("pno");
    	int pno = 1;
    	String pname = (String)session.getAttribute(service.getPname(pno));
    	session.setAttribute("pname", pname);
    	return "WEB-INF\\views\\Main.jsp";
    }
    
}
