package PMS.dao;
// PMS.dao.MainDao
import org.springframework.stereotype.Repository;

@Repository
public interface MainDao {
	public String getTitleByNo(int pno);
}
