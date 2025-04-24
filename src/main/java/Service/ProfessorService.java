package Service;

import java.util.Vector;

import Dao.ProfessorDao;
import Vo.LectureListVo;
import Vo.LecturePlanVo;

public class ProfessorService {
	public static Vector<LectureListVo> getAllLectureList(String id) {
		ProfessorDao professorDao = new ProfessorDao();
		return professorDao.getAllLectureList(id);
	}

	public boolean addLecturePlan(LecturePlanVo planvo) {
		ProfessorDao professorDao = new ProfessorDao();
		return professorDao.addLecturePlan(planvo);
	}

}
