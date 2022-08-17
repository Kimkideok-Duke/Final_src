package PMS.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PMS.vo.Timeline;

@Repository
public interface TimelineDao {
	public List<Timeline> getTimeline(int pno);
}
