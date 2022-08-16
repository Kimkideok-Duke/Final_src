package PMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    
	// http://localhost:6080/PMS/loginPage.do
    
    // http://localhost:6080/PMS/goMain.do
    @RequestMapping("goMain.do")
    public String main(HttpServletRequest request, @RequestParam(value="pno", defaultValue="") int pno, Model d) {
		HttpSession session = request.getSession();
		session.setAttribute("pno", pno);
    	d.addAttribute("title", service.getTitleByNo(pno));
    	d.addAttribute("slist",service.getScheduleList(pno));  	
    	return "WEB-INF\\views\\Main.jsp";
    }
    @RequestMapping("regScheduleModal.do")
	public String regScheduleModal(Schedule reg, Model d) {
		return "pageJsonReport";
	}
    @RequestMapping("regSchedule.do")
	public String regSchedule(Schedule reg, Model d) {
		service.regSchedule(reg);
		d.addAttribute("isReg","Y");
		return "WEB-INF\\views\\Main.jsp";
	}
    
    @RequestMapping("uptScheduleModal.do")
	public String uptScheduleModal(@RequestParam(value = "sno", defaultValue = "1") int sno, Model d) {
		d.addAttribute("schedule", service.getSchedule(sno));
		return "pageJsonReport";
	}
    @RequestMapping("uptSchedule.do")
	public String uptSchedule(Schedule upt, Model d) {
		service.uptSchedule(upt);
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\Main.jsp";
	}
	@RequestMapping("uptScheduleByPM.do")
	public String uptScheduleByPM(Schedule upt, Model d) {
		service.uptScheduleByPM(upt);
		d.addAttribute("proc", "upt");
		d.addAttribute("pno", service.getSchedule(upt.getSno()).getPno());
		return "WEB-INF\\views\\Main.jsp";
	}
	
    @RequestMapping("delSchedule.do")
	public String delSchedule(@RequestParam(value = "sno") int sno, Model d) {
		service.delSchedule(sno);
		d.addAttribute("proc", "del");
		d.addAttribute("pno", service.getSchedule(sno).getPno());
		return "WEB-INF\\views\\Main.jsp";
	}

	/*
	등록, 수정, 삭제할때 간트/풀캘린더 테이블 같이 dao로 CRUD하기
	 */
	//http://localhost:7080/PMS/getPrjparticipant.do?pno=2
	@RequestMapping("getPrjparticipant.do")
	public String getPrjparticipant(@RequestParam(value="pno", defaultValue="") int pno, Model d) {
		d.addAttribute("parlist",service.getPrjparticipant(pno));
		return "pageJsonReport";
	}
}
