package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.ProjectService;
import PMS.vo.PrjParticipant;
import PMS.vo.Project;

@Controller
public class ProjectController {
	@Autowired(required=false)
    private ProjectService service;
    
	// http://localhost:8080/PMS/loginPage.do
    // http://localhost:8080/PMS/entireDashboard.do
    @RequestMapping("entireDashboard.do")
    public String entireDashboard(HttpServletRequest request, Model d) {
    	HttpSession session = request.getSession();
    	String userno = (String)session.getAttribute("userno");
    	String auth = (String)session.getAttribute("auth");
    	d.addAttribute("plist", service.showAllProject());
    	d.addAttribute("slist", service.showAllSchedule());
    	d.addAttribute("myPlist", service.showMyProject(userno));
    	d.addAttribute("mySlist", service.showMySchedule(userno));
    	d.addAttribute("pmSlist", service.managingSchedule(userno));
    	d.addAttribute("userno", userno);
    	d.addAttribute("auth", auth);
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
    
    // 프로젝트 추가
    @RequestMapping("addProject.do")
    public String addProject(Project ins, Model d) {
    	service.addProject(ins);
    	return "addPrjParticipant.do";
    }
    
    // 프로젝트 참가자 추가
    @RequestMapping("addPrjParticipant.do")
    public String addPrjParticipant(HttpServletRequest request, Model d) {
    	HttpSession session = request.getSession();
    	String userno = (String)session.getAttribute("userno");
    	PrjParticipant pp = new PrjParticipant(userno, service.getMaxPno(userno));
    	service.addPrjParticipant(pp);
    	d.addAttribute("isAddPrj", "Y");
    	return "WEB-INF/views/EntireDashBoard.jsp";
    }
    
    // 부서별 예산
    @RequestMapping("getDeptBudget.do")
    public String getDeptBudget(Model d) {
    	d.addAttribute("deptbudget", service.getDeptBudget());
    	return "pageJsonReport";
    }
    
    // 부서별 프로젝트 갯수
    @RequestMapping("getDeptCnt.do")
    public String getDeptCnt(Model d) {
    	d.addAttribute("deptcnt", service.getDeptCnt());
    	return "pageJsonReport";
    }
}
