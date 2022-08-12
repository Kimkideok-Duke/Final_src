package PMS.controller;

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
    
    // http://localhost:6080/PMS/goMain.do
    @RequestMapping("goMain.do")
    public String main(@RequestParam(value="pno", defaultValue="2") int pno, Model d) {
    	d.addAttribute("title", service.getTitleByNo(pno));
    	d.addAttribute("slist",service.getScheduleList(pno));
    	return "WEB-INF\\views\\Main.jsp";
    }
    
    // http://localhost:6080/PMS/goSchedule.do
    @RequestMapping("goSchedule.do")
    public String goSchedule(@RequestParam(value="pno", defaultValue="2") int pno, Model d) {
    	d.addAttribute("slist",service.getScheduleList(pno));
    	return "WEB-INF\\views\\Schedule.jsp";
    }

    // http://localhost:6080/PMS/goScheduleManage.do
    @RequestMapping("goScheduleManage.do")
    public String goScheduleManage(@RequestParam(value="sno", defaultValue="1") int sno, Model d) {
    	d.addAttribute("schedule",service.getSchedule(sno));
    	return "WEB-INF\\views\\ScheduleManage.jsp";
    }
    
 // http://localhost:7080/PMS/scheduleModal.do?sno=2
    @RequestMapping("scheduleModal.do")
	public String scheduleModal(@RequestParam(value = "sno", defaultValue = "1") int sno, Model d) {
		d.addAttribute("schedule", service.getSchedule(sno));
		return "pageJsonReport";
	}
    @RequestMapping("regSchedule.do")
	public String regSchedule(Schedule reg, Model d) {
		service.regSchedule(reg);
		return "WEB-INF\\views\\ScheduleManage.jsp";
	}
    @RequestMapping("uptSchedule.do")
	public String uptSchedule(Schedule upt, Model d) {
		service.uptSchedule(upt);
		d.addAttribute("proc", "upt");
		return "WEB-INF\\views\\ScheduleManage.jsp";
	}
    @RequestMapping("delSchedule.do")
	public String delSchedule(Model d) {
		service.delSchedule();
		d.addAttribute("proc", "del");
		return "WEB-INF\\views\\ScheduleManage.jsp";
	}
	@RequestMapping("uptSchedulePM.do")
	public String uptSchedulePM(Schedule upt, Model d) {
		System.out.println();
		service.uptScheduleByPM(upt);
		
		d.addAttribute("proc", "upt");
		d.addAttribute("pno", service.getSchedule(upt.getSno()).getPno());
		return "WEB-INF\\views\\Main.jsp";
	}
	/*
	등록, 수정, 삭제할때 간트/풀캘린더 테이블 같이 dao로 CRUD하기
	 */
}
