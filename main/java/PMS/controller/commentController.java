package PMS.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PMS.service.TimelineService;
import PMS.service.commentService;
import PMS.vo.Comment;
import PMS.vo.Timeline;


@Controller
public class commentController {
	@Autowired(required=false)
	private commentService service;
	@Autowired(required=false)
	private TimelineService serviceT;

	// http://localhost:7080/PMS/commentList.do
		@RequestMapping("commentList.do")
		public String commentList(@RequestParam("sno") int sno,
			@RequestParam("pno") int pno, Model d) {
	    	d.addAttribute("title", service.getTitle(sno));
	    	d.addAttribute("sname", service.getSname(sno));
			d.addAttribute("clist", service.commentList(sno));
			
			return "WEB-INF\\views\\Comment.jsp";
		}	
		
		
		@RequestMapping("commInsertForm.do")
		public String commInsertForm(@RequestParam("sno") int sno, Model d) {
			d.addAttribute("sname", service.getSname(sno));
			return "WEB-INF\\views\\insertComment.jsp";
		}
			
		@RequestMapping("commInsert.do")
		public String commInsert(@RequestParam("pno") int pno,
				@RequestParam("sno") int sno,
				Comment ins,Timeline ins2, Model d) {			
			service.insertComment(ins);
			serviceT.insertTimeline(ins2);
			d.addAttribute("isInsert", "Y");			
			return "WEB-INF\\views\\insertComment.jsp";
		}
		
		@RequestMapping("download.do")
		public String download(@RequestParam("fname") String fname, Model d) {
			d.addAttribute("downloadFileName", fname);
			return "downloadViewer";
		}
		
		@RequestMapping("commDetail.do")
		public String commDetail(@RequestParam("cno") int cno,
				@RequestParam("pno") int pno,
				@RequestParam("sno") int sno,Model d){
			d.addAttribute("comment",service.getDetail(cno));
			d.addAttribute("sname", service.getSname(sno));
			return "WEB-INF\\views\\DetailComment.jsp";
		}	
		
		@RequestMapping("commDelete.do")
		public String commDelete(@RequestParam("cno") int cno,
				@RequestParam("sno") int sno,
				@RequestParam("pno") int pno,Timeline ins2,Model d) {
			System.out.println(ins2.getPno());
			System.out.println(ins2.getSname());
			System.out.println(ins2.getWriter());
			System.out.println(ins2.getState());
			serviceT.insertTimeline(ins2);
			d.addAttribute("comment",service.getDetail(cno));
			d.addAttribute("sname", service.getSname(sno));
			d.addAttribute("proc", "del");
			return "WEB-INF\\views\\DetailComment.jsp";
		}
		
		@RequestMapping("commUpForm.do")
		public String commUpForm(@RequestParam("cno") int cno,
				@RequestParam("sno") int sno,
				@RequestParam("pno") int pno,Model d) {
			d.addAttribute("comment", service.getDetail(cno));
			d.addAttribute("sname", service.getSname(sno));
			System.out.println("수정페이지이동");
			return "WEB-INF\\views\\UpdateComment.jsp";
		}
			
		@RequestMapping("commUpdate.do")
		public String commUpdate(@RequestParam("sno") int sno,
				@RequestParam("pno") int pno,
				Comment upt,Timeline ins2, Model d) {
			d.addAttribute("comment", service.updateComment(upt));
			
			serviceT.insertTimeline(ins2);
			d.addAttribute("upt", "Y");
			System.out.println("수정:"+upt.getContent());
			return "WEB-INF\\views\\UpdateComment.jsp";
		}


	}
