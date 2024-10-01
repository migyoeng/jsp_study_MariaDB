--bbs.sql
● MariaDB
-- 답변형 게시판

--bbs 테이블 생성
-- 숫자 자료형 INT, OracleDB에서의 시퀀스 : auto_increment
-- content 자료형 varchar -> text
-- tinyint -> int 만큼의 크기가 필요하지 않을 경우
-- 날짜 데이터 : data -> datetime
CREATE TABLE tb_bbs (
    bbsno       INT           AUTO_INCREMENT PRIMARY KEY
   ,wname       VARCHAR(20)   NOT NULL
   ,subject     VARCHAR(100)  NOT NULL
   ,content     TEXT          NOT NULL
   ,grpno       TINYINT       NOT NULL
   ,indent      TINYINT       DEFAULT 0    NOT NULL
   ,ansnum      TINYINT       DEFAULT 0    NOT NULL
   ,regdt       DATETIME      NOT NULL
   ,passwd      VARCHAR(15)   NOT NULL
   ,readcnt     INT           DEFAULT 0    NOT NULL
   ,ip          VARCHAR(15)   NOT NULL
);

-- 행 추가 테스트
--auto_increment로 인해 bbsno 컬럼을 추가하지 않아도 된다
--nvl() -> ifnull()
--sysdate -> now()
--임시 테이블명은 무조건 부여해야 한다 - 안그러면 오류
INSERT INTO tb_bbs(wname, subject, content, passwd, ip, grpno, regdt)
VALUES ('정미경', '제목', '내용', '1234', '127.0.0.1', (select ifnull(max(bbsno),0)+1 from tb_bbs as TB), now());