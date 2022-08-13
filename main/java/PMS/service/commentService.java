package PMS.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import PMS.dao.commentDao;
import PMS.vo.Comment;
import PMS.vo.CommentFile;



@Service
public class commentService {
	@Autowired(required=false)
	private commentDao dao;
	
	public List<Comment> commentList(int sno){	
		return dao.commentList(sno);
	}
	

	public String getTitle(int sno) {
		return dao.getTitle(sno);
	}
	public String getSname(int sno) {
		return dao.getSname(sno);
	}
	
	public String getWriter(String userno) {
		return dao.getWriter(userno);
	}
	
	// 파일서버 정보(공통정보)
	@Value("${upload}")
	private String fpath;	
	public void insertComment(Comment ins) {
		MultipartFile mpf = ins.getReport();
		String fname = mpf.getOriginalFilename();
		
		File f = new File(fpath+fname);
		try {
			mpf.transferTo(f);
			System.out.println("파일업로드 완료!");
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dao.insertComment(ins);	
		dao.insertFile(new CommentFile(fpath,fname));
	}
	
	public Comment getDetail(int cno){
		return dao.getDetail(cno);
	}
	
	
	public Comment updateComment(Comment upt) {
		dao.updateComment(upt);
		return dao.getDetail(upt.getCno());
	}	
	
	public void deleteComment(int cno) {
		dao.deleteComment(cno);
	}

	
}


