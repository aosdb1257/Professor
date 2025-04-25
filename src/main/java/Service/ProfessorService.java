package Service;

import java.util.Vector;

import Dao.ProfessorDao;
import Vo.LectureListVo;
import Vo.LecturePlanVo;

public class ProfessorService {
	ProfessorDao professorDao = new ProfessorDao();
	public static Vector<LectureListVo> getAllLectureList(String id) {
		ProfessorDao professorDao = new ProfessorDao();
		return professorDao.getAllLectureList(id);
	}

	public boolean addLecturePlan(LecturePlanVo planvo) {
		return professorDao.addLecturePlan(planvo);
	}

	public boolean updateLecturePlan(LecturePlanVo planvo) {
		return professorDao.updateLacturePlan(planvo);
	}

	public boolean deleteLecturePlan(String id) {;
		return professorDao.deleteLecturePlan(id);
	}

	public LecturePlanVo getAllLecturePlanList(String subjectCode) {
		return professorDao.getAllLecturePlanList(subjectCode);
	}

}
