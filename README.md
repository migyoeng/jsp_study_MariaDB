# jsp_study_MariaDB
## myweb 개인 프로젝트 1차 푸시
###MariaDB 버전으로 수정

###사용한 라이브러리
- activation.jar
- mariadb-java-client-3.4.1.jar
- servlet-api.jar

#bbs
BbsDAO.create(), DBOpen 커넥트 부분 수정

- 답글형 게시판 제작

1.jsp 파일들 공통 코드 -> __ssi.jsp__

2.새 글 작성 -> bbsForm.jsp -> __bbsIns.jsp__

3.작성 글 목록 -> __bbsList.jsp__

4.작성 게시글 자세히 보기 -> __bbsRead.jsp__

4-1.글 수정 -> __bbsUpdate.jsp__ -> __bbsUpdateProc.jsp__

4-2.글 삭제 -> __bbsDel.jsp__ -> __bbsDelProc.jsp__

4-3.답글 달기 -> __bbsReply.jsp__ -> __bbsReplyProc.jsp__

# member

## myweb 개인 프로젝트 - member 테이블 푸시
- 로그인/회원가입 구현


- member 테이블 생성


- jsp 파일들 공통 코드 -> __ssi.jsp__

 MemberDAO, MemberDTO.java 클래스를 사용하기 위한 bean 생성


- 로그인 폼(아이디/비밀번호 입력) -> __loginForm.jsp__ -> __loginProc.jsp__

session 변수를 통해 테이블에 저장된 회원 정보와 사용자의 입력 값 비교 및 쿠키에 저장된 값 비교

로그인을 하지 않은 상태라면 아이디/비밀번호 입력 폼 출력, 쿠키에 저장된 ID라면 아이디 입력 칸에 저장된 아이디 미리 출력

쿠키에 저장됐던 ID값이라면 ID기억하기 checkbox 자동 체크 설정(checked 속성)

사용자가 입력한 아이디/비밀번호와 기존 회원 데이터 일치 시 세션 변수에 아이디,비밀번호,회원등급 저장

로그인 완료 시 myweb의 메인 페이지로 이동


이미 로그인한 상태라면 logout.jsp로 이동할 수 있는 버튼 페이지 출력


- 회원가입 폼 -> __agreement.jsp__ ->  __memberForm.jsp__

비회원이라면 loginForm.jsp에 있는 회원가입 버튼을 통해 myweb에 가입할 수 있다

카카오맵 API 추가


- 회원가입 중 아이디 중복 확인 -> __idCheckForm.jsp__

memberForm.jsp에서 아이디 중복 확인 버튼을 누를 시 아이디 가용 여부를 판단할 수 있는 modal 창 띄우기


- 로그아웃 -> __logout.jsp__

로그아웃할 경우 로그인했을 때 다른 페이지에서 회원 정보를 유효하기 위해 세션 변수에 저장했던 값을 지운다


지운 뒤 loginForm.jsp로 이동

- 회원/비회원 구분을 위해 아이디, 비밀번호, 회원 등급을 세션 변수로 관리 -> __auth.jsp__


##member 테이블 - 로그인/회원가입단 기능 추가

- 회원가입 시 아이디, 이메일 중복확인(유효성 검사)

1. 

idCheckForm.jsp -> idCheckProc.jsp

사용할 아이디를 form에서 입력 후 javascript로 아이디 입력 조건 검사

조건에 부합 시 idCheckProc.jsp에 전달

MemberDAO Class의 duplecateID() 메소드를 활용하여

테이블에 중복된 아이디가 있는지 검사 - count(id)

2.

emailCheckForm.jsp -> emailCheckProc.jsp

사용할 이메일을 form에서 입력 후 javascript로 이메일 형태 조건 검사

조건 충족 후 emailCheckProc.jsp에 전달

MemberDAO Class의 duplecateEmail() 메소드를 활용하여

테이블에 중복된 이메일이 있는지 검사 - count(email)

- 회원가입 완료(회원정보 추가) - memberForm.jsp -> memberProc.jsp

form에서 입력한 값을 불러와 memberDto 필드에 저장

저장 후 memberDto를 member 테이블에 insert 후 행 추가 완료 시 회원가입 성공

3. 아이디/비밀번호 찾기

이름, 이메일과 일치하는 계정의 ID와 영어 대/소문자, 숫자가 섞인 10자의 임시 비밀번호를 발급하여 이메일로 전송

form에서 입력한 값을 memberDto에 저장 후 MemberDAO 클래스의 findID() 메소드 호출

이름, 이메일과 일치하는 계정의 id 값 가져오기(select), id 값이 존재하면 해당 계정에 임시 비밀번호 부여

기존 비밀번호를 임시 비밀번호로 수정(update)

찾은 id 값과 임시 비밀번호를 해당 이메일로 전송

임시 비밀번호로 로그인 후 회원 정보 수정을 통해 원하는 비밀번호로 수정 가능
