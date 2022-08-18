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

SELECT * FROM schedule;
insert into schedule values(seq_sno.nextval,2,'확인','진행중',0,sysdate,sysdate,0);

insert into Timeline values(seq_time.nextval,2,'안정인','일정명',sysdate,'일정등록');
insert into Timeline values(seq_time.nextval,2,'안정인','일정명',SYSDATE-1/24,'일정등록');
insert into Timeline values(seq_time.nextval,2,'안정인','일정명',SYSDATE-500,'일정등록');
SELECT * FROM Timeline order BY tdte asc;

SELECT A.*,
 WHEN gap <= 60 THEN '방금 전' 
WHEN gap<= 60*24 THEN trunc(tdte/60) || '시간 전'
ELSE to_char(tdte, 'yyyy-MM-DD')
END AS TIMEGAP
FROM (SELECT Timeline.*
trunc((sysdate - tdte) *24 * 60) AS gap
FROM Timeline WHERE pno = 2 order BY tdte DESC) A;

substring(tdte,3,10)

SELECT t.*,
CASE WHEN TO_number(sysdate-t.tdte)*24*60 <= 60 THEN '방금전'
WHEN TO_number(sysdate-t.tdte)*24 <= 24 THEN trunc(TO_number(sysdate-t.tdte)*24) || '시간 전'
WHEN TO_number(sysdate-t.tdte) <= 31 THEN trunc(TO_number(sysdate-t.tdte)) || '일 전'
ELSE substr(t.tdte,1,10)
END AS calTime
FROM Timeline t WHERE pno = #{pno} order BY tdte desc;
 
SELECT * from Timeline where pno = #{pno} order BY tdte desc


