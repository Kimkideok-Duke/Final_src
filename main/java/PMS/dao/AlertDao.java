package PMS.dao;
import java.util.List;

// PMS.dao.AlertDao
import org.springframework.stereotype.Repository;

import PMS.vo.Alert;

@Repository
public interface AlertDao {
	public List<Alert> getAlert(String userno);
	public List<Alert> getAlertjson(String userno);
}
