package Vo;

public class LectureListVo {
    private String subjectCode;     // 과목코드 (PK)
    private String subjectName;     // 과목명
    private String subjectType;     // 이수구분
    private int openGrade;          // 개설학년
    private String division;        // 분반
    private int credit;             // 학점
    private int professorId;    // 담당교수 id (FK)
    private String professor;       // 담당교수
    private String schedule;        // 강의 요일/시간/강의실
    private String enrollment;      // 신청
    private String capacity;
    
	public LectureListVo() {
	}

	public LectureListVo(String subjectCode, String subjectName, String subjectType, int openGrade, String division,
			int credit, int professorId, String professor, String schedule, String enrollment, String capacity) {
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.subjectType = subjectType;
		this.openGrade = openGrade;
		this.division = division;
		this.credit = credit;
		this.professorId = professorId;
		this.professor = professor;
		this.schedule = schedule;
		this.enrollment = enrollment;
		this.capacity = capacity;
	}

	public String getCapacity() {return capacity;}

	public void setCapacity(String capacity) {this.capacity = capacity;}

	public String getSubjectCode() { return subjectCode; }
	public void setSubjectCode(String subjectCode) { this.subjectCode = subjectCode; }

	public String getSubjectName() { return subjectName; }
	public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

	public String getSubjectType() { return subjectType; }
	public void setSubjectType(String subjectType) { this.subjectType = subjectType; }

	public int getOpenGrade() { return openGrade; }
	public void setOpenGrade(int openGrade) { this.openGrade = openGrade; }

	public String getDivision() { return division; }
	public void setDivision(String division) { this.division = division; }

	public int getCredit() { return credit; }
	public void setCredit(int credit) { this.credit = credit; }
	
	public int getProfessorId() { return professorId; }
	public void setProfessorId(int professorId) { this.professorId = professorId; }

	public String getProfessor() { return professor; }
	public void setProfessor(String professor) { this.professor = professor; }

	public String getSchedule() { return schedule; }
	public void setSchedule(String schedule) { this.schedule = schedule; }

	public String getEnrollment() { return enrollment; }
	public void setEnrollment(String enrollment) { this.enrollment = enrollment; }
}
