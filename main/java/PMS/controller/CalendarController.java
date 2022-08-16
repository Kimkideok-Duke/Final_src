package PMS.controller;

import java.text.SimpleDateFormat;
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
	
	@Autowired(required = false)	
	private MainService mservice;
	// http://localhost:6080/PMS/calendar.do
	@RequestMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\Calendar.jsp";
	}
	// http://localhost:6080/PMS/calList.do callist
	@RequestMapping("calList.do")
	public String calList(HttpServletRequest request, Model d) {
		HttpSession session = request.getSession();
		int pno = (int)session.getAttribute("pno");
		List<Schedule> slist = mservice.getScheduleList(pno); //pno로 schedule list 받아옴
		for(int idx=0;idx<slist.size();idx++) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String startdate = transFormat.format(slist.get(idx).getStartDate());// slist의 startdate,enddate값 추출
			String enddate = transFormat.format(slist.get(idx).getEndDate()); //형변환
			String title = slist.get(idx).getSname();
			List<Calendar> clist = service.getCalList(); // calendar list 
			service.updateCalendar(new Calendar(title,startdate,enddate));
			// calendar list의 각 idx에 맞게 start, end값 설정
			d.addAttribute("callist", clist);
		}
//		d.addAttribute("callist", service.getCalList());
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

