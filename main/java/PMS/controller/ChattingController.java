package PMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChattingController {
	// http://localhost:7080/PMS/chattingFrm.do
	@RequestMapping("chattingFrm.do")
	public String chattingFrm() {
		return "WEB-INF\\views\\Main.jsp";
	}
}
