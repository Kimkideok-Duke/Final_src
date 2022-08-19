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
   public String calList(Model d) {
      d.addAttribute("callist", service.getCalList());
      return "pageJsonReport";
   }
   // http://localhost:6080/PMS/calInsert.do
   @RequestMapping("calInsert.do")
   public String calInsert(HttpServletRequest request, Calendar ins) {
      HttpSession session = request.getSession();
      int pno = 0;
      if(session!=null && session.getAttribute("pno")!=null) {
    	  pno = (int)session.getAttribute("pno");
      }
      String startdate = ins.getStart().split("T")[0];
      String enddate= ins.getEnd().split("T")[0];
      Schedule reg = new Schedule(pno, ins.getTitle(), "기본", 0, startdate, enddate, 0);
      mservice.regSchedule(reg);
      int sno = service.getRecentSno();
      ins.setPno(pno);
      ins.setSno(sno);
      service.insertCalendar(ins);
      // 등록 후, 초기화면으로 이동
      return "redirect:/calendar.do";
   } // calUpdate.do calDelete.do
   
   // http://localhost:6080/PMS/calUpdate.do
   @RequestMapping("calUpdate.do")
   public String updateCalendar(Calendar upt) {
	  service.updateCalendar(upt);
      String startdate = upt.getStart().split("T")[0]; 
      String enddate = upt.getEnd().split("T")[0];
      Schedule s = service.getScheduleId(upt.getId());
      s.setSname(upt.getTitle());
      s.setStartDate_s(startdate);
      s.setEndDate_s(enddate);
      mservice.uptScheduleByPM(s);
      return "redirect:/calendar.do";
   }
   // http://localhost:6080/PMS/calDelete.do
   @RequestMapping("calDelete.do")
   public String deleteCalendar(int id) {
	  mservice.delSchedule(service.getSnoId(id));
	  service.deleteCalendar(id);
      return "redirect:/calendar.do";
   }
}
