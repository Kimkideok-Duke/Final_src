package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Comment;
import PMS.vo.CommentFile;

@Repository
public interface commentDao {
	public List<Comment> commentList(int sno);
	public void insertComment(Comment ins);
	public Comment getDetail(int cno);
	public void updateComment(Comment upt);		
	public void deleteComment(int cno);
	public void insertFile(CommentFile file);
}
