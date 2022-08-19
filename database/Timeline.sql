-- ====== Timeline ========

-- 타임라인 테이블
CREATE table Timeline(
tno NUMBER PRIMARY KEY,
pno NUMBER,
sno NUMBER,
writer varchar2(20),
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
CASE WHEN TO_number(sysdate-t.tdte)*24*60 <= 60 THEN '방금전'
WHEN TO_number(sysdate-t.tdte)*24 <= 24 THEN trunc(TO_number(sysdate-t.tdte)*24) || '시간 전'
WHEN TO_number(sysdate-t.tdte) <= 31 THEN trunc(TO_number(sysdate-t.tdte)) || '일 전'
ELSE substr(t.tdte,1,10)
END AS calTime
FROM Timeline t WHERE pno =2 order BY tdte desc;




/*
SELECT sysdate-hiredate FROM emp;
SELECT floor((sysdate-hiredate)/365) || '년 전' FROM emp;
SELECT floor((sysdate-hiredate)) || '일 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '시간 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '분 전' FROM emp;
 */


