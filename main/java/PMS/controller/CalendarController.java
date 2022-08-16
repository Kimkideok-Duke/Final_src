package PMS.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PMS.service.CalendarService;
import PMS.service.MainService;
import PMS.vo.Calendar;
import PMS.vo.Schedule;

@Controller
public class CalendarController {
	@Autowired(required = false)
	private CalendarService service;
	private MainService mservice;
	// http://localhost:6080/PMS/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\Calendar.jsp";
	}
	// http://localhost:6080/PMS/calList.do callist
	@RequestMapping("calList.do")
	public String calList(HttpServletRequest request, Model d) {
//		HttpSession session = request.getSession();
//		int pno = (int)session.getAttribute("pno");
//		List<Schedule> slist = mservice.getScheduleList(pno); //pno를 받아야함.
//		for(int idx=0;idx<slist.size();idx++) {
//			Date enddate = slist.get(idx).getEndDate();
//			Date startdate = slist.get(idx).getStartDate();
//			List<Calendar> clist = service.getCalList();
//			clist.get(idx).setStart(startdate);
//			clist.get(idx).setEnd(enddate);
//			d.addAttribute("callist", service.getCalList());
//		}
		d.addAttribute("callist", service.getCalList());
		return "pageJsonReport";
	}
	// http://localhost:6080/PMS/calInsert.do
	@RequestMapping("calInsert.do")
	public String calInsert(Calendar ins) {
		service.insertCalendar(ins);
//		mservice.regSchedule(new Schedule(ins.ins.getStart(),ins.getEnd()));
		// 등록 후, 초기화면으로 이동
		return "redirect:/calendar.do";
	} // calUpdate.do calDelete.do
	
	// http://localhost:6080/PMS/calUpdate.do
	@RequestMapping("calUpdate.do")
	public String updateCalendar(Calendar upt) {
		service.updateCalendar(upt);
//		mservice.uptScheduleByPM(null);
		return "redirect:/calendar.do";
	}
	// http://localhost:6080/PMS/calDelete.do
	@RequestMapping("calDelete.do")
	public String deleteCalendar(int id) {
		service.deleteCalendar(id);
		return "redirect:/calendar.do";
	}
}

