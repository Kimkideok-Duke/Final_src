/*
 * 프로젝트
 */
CREATE TABLE PROJECT (
    pno NUMBER PRIMARY KEY,
    title varchar2(50) NOT NULL,
    dept varchar2(50) NOT NULL,
    pmno varchar2(9) NOT NULL
);
DROP TABLE PROJECT;
DELETE FROM PROJECT
WHERE PNO = 24;
CREATE SEQUENCE seq_pno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_pno;
INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','김길동','himan7777@naver.com', '개발부',
	'부장','서울시 마포구 서교동 447-5 201호','010-1234-5678',NULL,sysdate,'pm');
INSERT INTO account values('E'||to_char(acc_seq.nextval),'abcabc123','김유신','ys7777@naver.com', '개발부',
	'사원','서울시 마포구 서교동 447-5 201호','010-1234-5678',NULL,sysdate,'user');

INSERT INTO PROJECT values(seq_pno.nextval, '첫프로젝트', '개발부', 'E10000004');
/*
프로젝트 생성
INSERT INTO PROJECT values(seq_pno.nextval, #{title}, #{dept}, #{userno});

방금 생성된 프로젝트의 pno값 추출
SELECT max(pno) FROM PROJECT
WHERE PMNO = 'E10000004'
ORDER BY PNO
*/
SELECT * FROM PROJECT
ORDER BY PNO;

SELECT max(pno) FROM PROJECT
WHERE PMNO = 'E10000004'
ORDER BY PNO;





/*
 * 일정
 */
CREATE TABLE SCHEDULE(
	sno NUMBER PRIMARY KEY,
	pno NUMBER NOT NULL,
	sname varchar2(50) NOT NULL,
	status varchar2(50) NOT NULL,
	progress NUMBER NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE NOT NULL
);
DROP TABLE SCHEDULE;
CREATE SEQUENCE seq_sno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_sno;
INSERT INTO SCHEDULE values(seq_sno.nextval, 2, '첫일정', '진행중', 0, sysdate, to_date('2022-08-05','YYYY-MM-DD'));
INSERT INTO SCHEDULE values(seq_sno.nextval, 2, '완료일정', '완료', 100, sysdate, to_date('2022-08-03','YYYY-MM-DD'));
/*
일정 생성
INSERT INTO SCHEDULE values(seq_sno.nextval, #{pno}, #{sname}, #{progress}, 
							to_date(#{startDate_s}, 'YYYY-MM-DD'), to_date(#{endDate_s}, 'YYYY-MM-DD'));
*/
SELECT * FROM SCHEDULE;
SELECT *
FROM SCHEDULE
WHERE PNO = 2
ORDER BY SNO;
SELECT AVG(progress)
FROM SCHEDULE
WHERE pno = 2;

/*
프로젝트 별 일정 리스트 
SELECT *
FROM SCHEDULE
WHERE pno = #{pno}

프로젝트별 진행도
SELECT AVG(progress)
FROM SCHEDULE
WHERE pno = #{pno}
*/




/*
 * 프로젝트 참가자
 */
CREATE TABLE PRJPARTICIPANT (
	userno varchar2(9) NOT NULL,
	pno NUMBER NOT NULL
);
INSERT INTO PRJPARTICIPANT values('E10000020', 2);
INSERT INTO PRJPARTICIPANT values('E10000004', 21);

SELECT * FROM PRJPARTICIPANT
WHERE pno = 2;

SELECT DISTINCT
	  pj.*
FROM PROJECT pj, PRJPARTICIPANT p, SCHEDULE s 
WHERE pj.PNO = p.PNO AND s.PNO  = p.PNO
AND p.USERNO = 'E10000020';

SELECT p.*
FROM PROJECT p, PRJPARTICIPANT pp
WHERE p.PNO = pp.PNO
AND pp.USERNO = 'E10000004';

SELECT * FROM PRJPARTICIPANT;
/*
프로젝트 참가자 추가
INSERT INTO PRJPARTICIPANT values(#{userno}, #{pno})

내 프로젝트 보기
SELECT p.*
FROM PROJECT p, PRJPARTICIPANT pp
WHERE p.PNO = pp.PNO
AND pp.USERNO = #{userno}
 */



/*
 * 일정 참가자
 */
CREATE TABLE SCHPARTICIPANT (
	userno varchar2(9) NOT NULL,
	sno NUMBER NOT NULL,
	pno NUMBER NOT NULL
);
DROP TABLE SCHPARTICIPANT;
INSERT INTO SCHPARTICIPANT values('E10000004', 2, 2);
INSERT INTO SCHPARTICIPANT values('E10000020', 3, 2);
/*
참가자 추가
INSERT INTO SCHPARTICIPANT values(#{userno}, #{sno}, #{pno});
*/
SELECT * FROM SCHPARTICIPANT;

SELECT p.USERNO, pj.TITLE, pj.DEPT, s.*
FROM SCHEDULE s, PROJECT pj, SCHPARTICIPANT p
WHERE pj.PNO = s.PNO AND pj.PNO = p.PNO AND s.SNO = p.SNO
AND p.USERNO = 'E10000020';


SELECT pno, AVG(progress)
FROM SCHEDULE
GROUP BY PNO;
/*
내 업무 보기
SELECT p.USERNO, pj.TITLE, pj.DEPT, s.*
FROM SCHEDULE s, PROJECT pj, SCHPARTICIPANT p
WHERE pj.PNO = s.PNO AND pj.PNO = p.PNO AND s.SNO = p.SNO
AND p.USERNO = #{userno}

*/