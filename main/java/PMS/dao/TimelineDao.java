package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.TimeResult;
import PMS.vo.Timeline;

@Repository
public interface TimelineDao {
	public List<Timeline> getTimeline(int pno);
	public void insertTimeline(Timeline ins2);
	
	public List<Timeline> getTmDetail(int pno);
	public void insResult(Timeline ins3);

}
