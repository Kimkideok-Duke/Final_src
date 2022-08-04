/*
계정 테이블 생성
사원번호 (userno) 기본키

권한(auth)
admin (전체 관리자)
pm (프로젝트 관리자)
um (유저 관리자)
user (일반 사용자)

*/
CREATE TABLE account(
	userno varchar2(9) PRIMARY KEY,
	pw varchar2(16) NOT NULL,
	name varchar2(30) NOT NULL,
	email varchar2(100),
	dept varchar2(30),
	position varchar2(30),
	address varchar2(200),
	hpnum varchar2(15),
	birthdate DATE,
	joindate DATE NOT NULL,
	auth varchar2(30) CHECK(auth IN('admin','pm','um','user'))
);

/*
프로필 이미지 테이블 생성
 */
CREATE TABLE profile(
	userno REFERENCES account(userno),
	PATH varchar2(120),
	fname varchar2(50)
);

/*
사원번호(userno) 시퀀스 생성 / 숫자8자리
 */
CREATE SEQUENCE acc_seq
       INCREMENT BY 1
       START WITH 10000000
       MINVALUE 10000000
       MAXVALUE 99999999
       NOCYCLE;


INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','홍길동','himan7777@naver.com', '본부',
	'ceo','서울시 마포구 서교동 447-5 201호','010-1234-5678',NULL,sysdate,'admin');

INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','김길동','himan7777@naver.com', '개발부',
	'부장','서울시 마포구 서교동 447-5 201호','010-1234-5678',NULL,sysdate,'pm');

INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','서길동','himan7777@naver.com', '개발부',
	'과장','서울시 마포구 서교동 447-5 204호','010-1934-5978',NULL,sysdate,'um');

SELECT * FROM account;
SELECT * FROM profile;

/*
로그인 sql
사원번호 존재 확인
사원번호, 비밀번호 일치 확인
 */
SELECT count(*)
FROM account
WHERE userno='E10000003';

SELECT count(*)
FROM account
WHERE userno = 'E10000003'
AND pw = 'abcabc123';


-- 사원번호로 사원 상세정보 조회
SELECT *
FROM account
WHERE userno = 'E10000003';

-- 비밀번호 변경
UPDATE ACCOUNT 
SET pw = 'abcabc123'
WHERE userno = 'E10000003';

-- 마이페이지 개인정보수정
UPDATE ACCOUNT 
	SET email = 'himan7777@naver.com',
		address = '서울시 마포구 서교동 447-5 201호',
		birthdate = to_date('1996-06-03','YYYY-MM-DD'),
		hpnum = '010-5678-1234'
WHERE userno = 'E10000003';

-- 내가 참여한 일정 (오류체크)
SELECT distinct p2.title, s.sname, a.name, a.position
FROM SCHEDULE s, SCHPARTICIPANT p, PROJECT p2, ACCOUNT a 
WHERE s.sno in (
	SELECT SNO
	FROM SCHPARTICIPANT
	WHERE userno = 'E10000020')
AND p2.pno in (
	SELECT PNO
	FROM SCHPARTICIPANT
	WHERE userno = 'E10000020'
)
AND p.userno = 'E10000020'
AND a.userno in (
	SELECT p2.PMNO 
	FROM SCHEDULE s, SCHPARTICIPANT p, PROJECT p2
	WHERE s.sno in (
		SELECT SNO
		FROM SCHPARTICIPANT
		WHERE userno = 'E10000020')
	AND p2.pno in (
		SELECT PNO
		FROM SCHPARTICIPANT
		WHERE userno = 'E10000020'
	)
	AND p.userno = 'E10000020'
)
;

-- um page 사원 추가
INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','김영수','himan7788@naver.com', null,
	null,null,null,NULL,sysdate,null);
SELECT * FROM account;
