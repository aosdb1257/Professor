<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>교수 학사관리 시스템</title>
  <style>
    body {
      margin: 0;
      font-family: '맑은 고딕', sans-serif;
    }

    /* 상단 메뉴바 */
    .navbar {
      background-color: #002147;
      overflow: visible; /* 드롭다운이 잘리지 않도록 */
      display: flex;
      justify-content: space-around;
      padding: 10px 0;
      position: relative; /* 드롭다운 위치 기준 */
      z-index: 100;
    }

    .nav-item {
      position: relative;
    }

    .nav-link {
      color: white;
      padding: 14px 20px;
      text-decoration: none;
      display: block;
      font-weight: bold;
      cursor: pointer;
    }

    .nav-link:hover {
      background-color: #004080;
    }

    /* 드롭다운 메뉴 */
    .dropdown {
      display: none;
      position: absolute;
      top: 100%; /* 메뉴바 바로 아래에 뜨게 */
      left: 0;
      background-color: white;
      min-width: 200px;
      box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
      z-index: 1000; /* 다른 요소보다 위에 */
    }

    .dropdown a {
      color: #002147;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    .dropdown a:hover {
      background-color: #f1f1f1;
    }

    .nav-item.active .dropdown {
      display: block;
    }
  </style>
</head>
<body>

  <div class="navbar">
    <div class="nav-item">
      <div class="nav-link">강의관리</div>
      <div class="dropdown">
        <a href="${pageContext.request.ContextPath}/Professor/LectureList">강의목록 조회</a>
        <a href="#">강의계획서 등록 및 수정</a>
        <a href="#">수업 자료 업로드</a>
      </div>
    </div>
    <div class="nav-item">
      <div class="nav-link">수강생 관리</div>
      <div class="dropdown">
        <a href="#">수강신청 학생 명단 확인</a>
        <a href="#">학생 정보 조회</a>
      </div>
    </div>
    <div class="nav-item">
      <div class="nav-link">성적 관리</div>
      <div class="dropdown">
        <a href="#">성적 입력</a>
        <a href="#">성적 기준 설정</a>
        <a href="#">성적 확정 및 제출</a>
        <a href="#">이의신청 처리</a>
      </div>
    </div>
    <div class="nav-item">
      <div class="nav-link">출석 관리</div>
      <div class="dropdown">
        <a href="#">수동 출석 체크</a>
        <a href="#">출석 현황 확인</a>
        <a href="#">출석 통계 확인</a>
      </div>
    </div>
    <div class="nav-item">
      <div class="nav-link">커뮤니케이션</div>
      <div class="dropdown">
        <a href="#">공지사항 작성</a>
        <a href="#">피드백 등록</a>
      </div>
    </div>
  </div>

  <script>
    // 클릭하면 드롭다운 열고 닫기
    document.querySelectorAll('.nav-link').forEach(link => {
      link.addEventListener('click', function (e) {
        const parent = this.parentElement;
        const isActive = parent.classList.contains('active');

        // 다른 드롭다운 닫기
        document.querySelectorAll('.nav-item').forEach(item => {
          item.classList.remove('active');
        });

        // 현재 것만 토글
        if (!isActive) {
          parent.classList.add('active');
        }
      });
    });

    // 바깥 클릭 시 드롭다운 닫기
    document.addEventListener('click', function (e) {
      if (!e.target.closest('.nav-item')) {
        document.querySelectorAll('.nav-item').forEach(item => {
          item.classList.remove('active');
        });
      }
    });
  </script>

</body>
</html>
