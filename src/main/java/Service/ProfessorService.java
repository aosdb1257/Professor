package Service;

import java.util.Vector;

import Dao.ProfessorDao;
import Vo.EnrolledStudentVo;
import Vo.LectureListVo;
import Vo.LecturePlanVo;
import Vo.SubjectVo;

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

	public Vector<EnrolledStudentVo> getAllEnrolledStudentList(String professor_id) {
		return professorDao.getAllEnrolledStudentList(professor_id);
	}

	public boolean addSubject(SubjectVo subjectVo) {
		return professorDao.addLectureForm(subjectVo);
	}

	public Vector<SubjectVo> getAllRequestLectureList(String id) {
		return professorDao.getAllRequestLectureList(id);
	}

}
