-- ====== Timeline ========

-- 타임라인 테이블
CREATE table Timeline(
tno NUMBER PRIMARY KEY,
pno NUMBER,
writer varchar2(20),
sname varchar2(50),
tdte DATE,
state varchar2(50)
);
SELECT * FROM Timeline;
DROP TABLE Timeline;

-- 타임라인 시퀀스 생성
CREATE SEQUENCE seq_time
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_time;

/* 시간 처리
SELECT t.*,
CASE WHEN TO_number(sysdate-t.tdte)*24*60 <= 60 THEN '방금전'
WHEN TO_number(sysdate-t.tdte)*24 <= 24 THEN trunc(TO_number(sysdate-t.tdte)*24) || '시간 전'
@ -46,7 +28,25 @@ WHEN TO_number(sysdate-t.tdte) <= 31 THEN trunc(TO_number(sysdate-t.tdte)) || '
ELSE substr(t.tdte,1,10)
END AS calTime
FROM Timeline t WHERE pno = #{pno} order BY tdte desc;
 
SELECT * from Timeline where pno = #{pno} order BY tdte desc
*/

-- calTime 조회 쿼리
SELECT t.*,
CASE WHEN TO_number(sysdate-t.tdte)*24*60*60 <= 60 THEN '방금전'
WHEN TO_number(sysdate-t.tdte)*24*60 <= 60 THEN trunc(TO_number(sysdate-t.tdte)*24*60) || '분 전'
WHEN TO_number(sysdate-t.tdte)*24 <= 24 THEN trunc(TO_number(sysdate-t.tdte)*24) || '시간 전'
WHEN TO_number(sysdate-t.tdte) <= 31 THEN trunc(TO_number(sysdate-t.tdte)) || '일 전'
ELSE substr(t.tdte,1,10)
END AS calTime
FROM Timeline t WHERE pno =21 order BY tdte desc;


/*
SELECT sysdate-hiredate FROM emp;
SELECT floor((sysdate-hiredate)/365) || '년 전' FROM emp;
SELECT floor((sysdate-hiredate)) || '일 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '시간 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '분 전' FROM emp;
 */

-- 타임라인 결과 테이블
CREATE TABLE TResult(
tno NUMBER,
tmResult varchar2(100) 
);

DROP TABLE TResult;
SELECT * FROM TResult;


-- 타임라인 상세 조회 
SELECT t.*,r.tmResult,
CASE WHEN TO_number(sysdate-t.tdte)*24*60*60 <= 60 THEN '방금전'
WHEN TO_number(sysdate-t.tdte)*24*60 <= 60 THEN trunc(TO_number(sysdate-t.tdte)*24*60) || '분 전'
WHEN TO_number(sysdate-t.tdte)*24 <= 24 THEN trunc(TO_number(sysdate-t.tdte)*24) || '시간 전'
WHEN TO_number(sysdate-t.tdte) <= 31 THEN trunc(TO_number(sysdate-t.tdte)) || '일 전'
ELSE substr(t.tdte,1,10)
END AS calTime
FROM Timeline t,TResult r WHERE pno =2 AND t.tno =r.tno order BY tdte DESC;


-- 진행상태 갯수, 비율 조회
SELECT STATUS, COUNT(*) stCnt, round(RATIO_TO_REPORT(COUNT(*)) OVER()*100,2) stRatio
FROM SCHEDULE
WHERE pno=2
GROUP BY STATUS;


