package Service;

import java.util.Vector;

import Dao.ProfessorDao;
import Vo.LectureListVo;

public class ProfessorService {

	public static Vector<LectureListVo> getAllLectureList(String id) {
		ProfessorDao professorDao = new ProfessorDao();
		return professorDao.getAllLectureList(id);
	}

}
