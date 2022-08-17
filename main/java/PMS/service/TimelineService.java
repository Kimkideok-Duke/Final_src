package PMS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import PMS.dao.TimelineDao;
import PMS.vo.Timeline;

@Service
public class TimelineService {
	@Autowired(required=false)
	private TimelineDao dao;
	
	public List<Timeline> getTimeline(int pno){	
		return dao.getTimeline(pno);
	}
	
}


