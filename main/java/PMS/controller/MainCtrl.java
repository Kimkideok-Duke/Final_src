package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PMS.service.MainService;

@Controller
public class MainCtrl {
    @Autowired(required=false)
    private MainService service;
    
    // http://localhost:6080/PMS/main.do
    @RequestMapping("goMain.do")
    public String main(HttpServletRequest request, @RequestParam("pno") int pno, Model d) {
    	HttpSession session = request.getSession();
    	String title = service.getTitleByNo(pno);
    	d.addAttribute("title", title);
    	return "WEB-INF\\views\\Main.jsp";
    }
    
}
