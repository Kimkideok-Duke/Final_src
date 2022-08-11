package PMS.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PMS.service.commentService;
import PMS.vo.Comment;


@Controller
public class commentController {
	@Autowired(required=false)
	private commentService service;
	
	// http://localhost:7080/PMS/commentList.do
		@RequestMapping("commentList.do")
		public String commentList(@RequestParam("sno") int sno, Model d) {
			d.addAttribute("clist", service.commentList(sno));
			
			return "WEB-INF\\views\\Comment.jsp";
		}	
		
		@RequestMapping("commInsertForm.do")
		public String commInsertForm() {
			return "WEB-INF\\views\\insertComment.jsp";
		}
			
		@RequestMapping("commInsert.do")
		public String commInsert(Comment ins, Model d) {
			service.insertComment(ins);
			d.addAttribute("isInsert", "Y");
			return "WEB-INF\\views\\insertComment.jsp";
		}
		
		@RequestMapping("download.do")
		public String download(@RequestParam("fname") String fname, Model d) {
			d.addAttribute("downloadFileName", fname);
			return "downloadViewer";
		}
		
		@RequestMapping("commDetail.do")
		public String commDetail(@RequestParam("cno") int cno, Model d){
			d.addAttribute("comment",service.getDetail(cno));
			
			return "WEB-INF\\views\\DetailComment.jsp";
		}	
		
		@RequestMapping("commDelete.do")
		public String commDelete(@RequestParam("cno") int cno, Model d) {
			service.deleteComment(cno);
			d.addAttribute("proc", "del");
			return "WEB-INF\\views\\DetailComment.jsp";
		}
		
		@RequestMapping("commUpForm.do")
		public String commUpForm(int cno, Model d) {
			d.addAttribute("comment", service.getDetail(cno));
			System.out.println("수정페이지이동");
			return "WEB-INF\\views\\UpdateComment.jsp";
		}
			
		@RequestMapping("commUpdate.do")
		public String commUpdate(Comment upt, Model d) {
			d.addAttribute("comment", service.updateComment(upt));
			d.addAttribute("upt", "Y");
			System.out.println("수정:"+upt.getContent());
			return "WEB-INF\\views\\UpdateComment.jsp";
		}


	}
